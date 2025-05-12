-- Adapted from https://gist.github.com/timmyha/b1ecfc265a47b9aa53f140b5a97f2298

local chat_win = nil
local chat_buf = nil
local chat_file = nil

local M = {}

-- generate random file at ~/chats
local function generate_filename()
    local random = math.random(10000000)
    return os.getenv("HOME") .. "/chats/chat_" .. random .. ".chat"
end

-- create a chat buffer beginning with @You: or retrieve the current buffer.
local function get_chat_buffer()
    if chat_buf and vim.api.nvim_buf_is_valid(chat_buf) then
        print("Using existing buffer: " .. chat_buf)
        return chat_buf
    end

    chat_file = generate_filename()
    chat_buf = vim.api.nvim_create_buf(true, false)

    -- Set up the buffer
    vim.api.nvim_buf_set_name(chat_buf, chat_file)
    vim.bo[chat_buf].filetype = 'markdown'

    -- Set initial content
    vim.api.nvim_buf_set_lines(chat_buf, 0, -1, false, {"@You:"})

    -- Write the buffer to disk
    vim.api.nvim_buf_call(chat_buf, function()
        vim.cmd('write')
    end)

    print("Created new buffer: " .. chat_buf)
    return chat_buf
end

-- begin a new buffer/refresh
local function refresh_chat()
    if chat_buf and vim.api.nvim_buf_is_valid(chat_buf) then
        local new_file = generate_filename()

        vim.api.nvim_buf_set_name(chat_buf, new_file)
        chat_file = new_file

        -- Reset content
        vim.api.nvim_buf_set_lines(chat_buf, 0, -1, false, {"@You:"})

        -- Write the new buffer to disk
        vim.api.nvim_buf_call(chat_buf, function()
            vim.cmd('write')
        end)
    end
end

-- toggles the chat window, with window specs
M.toggle_chat = function()
    print("Toggle chat called")

    if chat_win and vim.api.nvim_win_is_valid(chat_win) then
        print("Closing existing window")
        vim.api.nvim_win_close(chat_win, true)
        chat_win = nil
        return
    end

    local buf = get_chat_buffer()
    local width = math.floor(vim.o.columns * 0.3)

    -- Create window
    chat_win = vim.api.nvim_open_win(buf, true, {
        title = "claude-3-5-sonnet-20241022",
        relative = 'editor',
        width = width,
        height = vim.o.lines - 3,
        col = vim.o.columns - width,
        row = 0,
        border = 'rounded'
    })

    -- Window setup
    vim.api.nvim_win_set_option(chat_win, 'winhighlight', 'Normal:Normal,FloatBorder:FloatBorder')
    vim.wo[chat_win].conceallevel = 0
    vim.wo[chat_win].concealcursor = ''
    vim.wo[chat_win].number = false
    vim.wo[chat_win].wrap = true
    vim.wo[chat_win].list = true
    vim.wo[chat_win].listchars = 'tab:› ,trail:•,extends:#,nbsp:.'

    local bufnr = vim.api.nvim_win_get_buf(chat_win)
    vim.bo[bufnr].bufhidden = 'hide'
    vim.bo[bufnr].buftype = ''
    vim.bo[bufnr].swapfile = false
    vim.bo[bufnr].modifiable = true
    vim.bo[bufnr].modified = false

end

-- gets your visual selection to paste into the chat buffer in markdown format with filetype
M.handle_visual_selection = function()
    local filetype = vim.bo.filetype

    vim.cmd('noau normal! "vy')

    local selected_text = vim.fn.getreg("v")

    selected_text = selected_text:gsub("\n$", "")

    local buf = get_chat_buffer()
    local content = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

    if #content > 0 and content[#content] ~= "" then
        table.insert(content, "")
    end

    table.insert(content, "```" .. filetype)
    for _, line in ipairs(vim.split(selected_text, "\n")) do
        table.insert(content, line)
    end
    table.insert(content, "```")

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

    M.toggle_chat()
end

-- only save the buffer explicitly, won't warn that the buffer isn't saved on quit
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name:match("%.chat$") then
          vim.bo[buf].modified = false -- Prevents quit prompt
        end
      end
    end
  end,
})

-- for randomness
math.randomseed(os.time())

-- commands, keymaps
vim.api.nvim_create_user_command('ClaudiusChatRefresh', refresh_chat, {})

return M
