-- use the following to reload this script
-- package.loaded['vimrc'] = nil, require('vimrc')

vim.g.vimrc = {}

local M = {}

-- vim.g.foo returns a copy dict, see https://stackoverflow.com/a/77381601/687420
function set_global_value(dict, key, value)
    local my_dict = vim.g[dict]
    my_dict[key] = value
    vim.g[dict] = my_dict
end

function printObj(obj, hierarchyLevel)
    if (hierarchyLevel == nil) then
        hierarchyLevel = 0
    elseif (hierarchyLevel == 4) then
        return 0
    end

    local whitespace = ""
    for i=0,hierarchyLevel,1 do
        whitespace = whitespace .. "-"
    end
    io.write(whitespace)

    print(obj)
    if (type(obj) == "table") then
        for k,v in pairs(obj) do
            io.write(whitespace .. "-")
            if (type(v) == "table") then
                printObj(v, hierarchyLevel+1)
            else
                print('key=' .. k)
                print(v)
            end
        end
    else
        print(obj)
    end
end

-- current buffer is always 0, but you can also use vim.fn.bufnr()
function current_window()
    local current_buffer = vim.fn.bufnr()
    return vim.fn.bufwinnr(current_buffer)
end

-- returns a table w/ key=bufnr, value=bufname
M.all_buffers = function()
    local to_return = {}

    for i, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        to_return[bufnr] = vim.api.nvim_buf_get_name(bufnr)
    end

    return to_return
end

-- Obtain all terms from Neoterm with vim.g.neoterm.instances
-- lua for i, x in pairs(vim.g.neoterm.instances) do print(i) end

-- Obtain selected terminal (with TREPLSetTerm) from: vim.g.neoterm.repl.instance_id
M.selected_term_name = function()
    if vim.g.neoterm.repl and vim.g.neoterm.repl.instance_id ~= nil then
        return 'neoterm-' .. vim.g.neoterm.repl.instance_id
    else
        error('No terminal selected!')
    end
end

M.selected_term_buffer_number = function()
    local term_buffer_name = M.selected_term_name()

    for i, name in pairs(M.all_buffers()) do
        if name:sub(-#term_buffer_name) == term_buffer_name then
            return i
        end
    end

    error('Term buffer not found!')
end

function window_with_selected_term()
    local term_buffer_number = M.selected_term_buffer_number()
    return vim.fn.bufwinnr(term_buffer_number)
end

-- switches to the window that has the selected terminal (selected with TREPLSetTerm <number>)
M.switch_to_selected_term_window = function(term_window)
    local term_window = term_window or window_with_selected_term()
    local command_to_execute = term_window .. 'wincmd w'

    set_global_value('vimrc', 'previous_window', current_window())

    print('Previous window NOW set to ' .. vim.g.vimrc.previous_window)

    vim.cmd(command_to_execute)
end

-- maybe not needed since I have <C-\> doing `wincmd p`, for "previous"
M.switch_to_previous_window = function(previous_window)
    local previous_window = previous_window or vim.g.vimrc.previous_window
    local command_to_execute = previous_window .. 'wincmd w'

    vim.cmd(command_to_execute)
end

return M
