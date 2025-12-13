-- use the following to reload this script
-- package.loaded['stuff'] = nil, require('stuff')

local M = {}

-- needed for the set_global_value below
vim.g.vimrc = {}

-- vim.g.foo returns a copy dict, see https://stackoverflow.com/a/77381601/687420
function set_global_value(dict, key, value)
    local my_dict = vim.g[dict]
    my_dict[key] = value
    vim.g[dict] = my_dict
end

-- I've symlinked ~/vim-dotfiles/lua to ~/.config/nvim/lua
-- package.loaded['vimrc']=nil; V = require('vimrc'); I = require('lua/inspect')
--
-- print(I.inspect(V.all_buffers()))
-- print(I.inspect(V.all_terms()))
-- this printObj not needed anymore, use :Luadev and inspect.lua instead 👆
M.printObj = function(obj, hierarchyLevel)
    if (hierarchyLevel == nil) then
        hierarchyLevel = 0
    elseif (hierarchyLevel == 4) then
        return 0
    end

    local whitespace = ""
    for i=0,hierarchyLevel,1 do
        whitespace = whitespace .. "-"
    end

    if (type(obj) == "table") then
        for k,v in pairs(obj) do
            padding = whitespace .. "-"
            if (type(v) == "table") then
                print(padding .. ' key=' .. k .. '; v=' .. lua.inspect(v))
                M.printObj(v, hierarchyLevel+1)
            else
                print(padding .. ' key=' .. k .. '; v=' .. v)
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

M.all_terms = function()
    local to_return = {}

    for i, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local neoterm_id = string.match(bufname, "#(neoterm%-%d+)$")

        if neoterm_id then
            to_return[neoterm_id] = {bufnr, bufname}
        end
    end

    return to_return
end

M.table_size = function(t)
    size = 0
    for _,_ in pairs(t) do
        size = size + 1
    end
    return size
end

M.table_keys = function(t)
    keys = {}
    for k,_ in pairs(t) do
        table.insert(keys, k)
    end
    return keys
end

-- Obtain all terms from Neoterm with vim.g.neoterm.instances
-- lua for i, x in pairs(vim.g.neoterm.instances) do print(i) end

-- Obtain selected terminal (with TREPLSetTerm) from: vim.g.neoterm.repl.instance_id
M.selected_term_name = function()
    if vim.g.neoterm.repl and vim.g.neoterm.repl.instance_id ~= nil then
        return 'neoterm-' .. vim.g.neoterm.repl.instance_id
    else
        local all_terms = M.all_terms()

        if M.table_size(all_terms) == 0 then
            error('No terminal selected!')
        else
            all_term_keys = M.table_keys(all_terms)
            table.sort(all_term_keys)

            -- first key is the first term, e.g. neoterm-1
            return keys[1]
        end
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

    print('Changing to term window with command: ' .. command_to_execute)

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

M.alternate_test_file = function()
  local file_path = vim.fn.expand("%")

  if string.find(file_path, "test/") == 1 then
    -- test file already
    return file_path
  else
    file_path = string.gsub(file_path, "lib/", "test/")
    return string.gsub(file_path, ".ex", "_test.exs")
  end
end

M.tmux_or_neoterm_cmd = function(cmd)
  if string.find(vim.g.test_strategy, 'tslime') then
    vim.cmd("Tmux " .. cmd)
  else
    vim.cmd("T " .. cmd)
  end
end

M.test_current_file = function()
  local current_file = M.alternate_test_file()
  local cmd = 'IexTests.test("' .. current_file .. '")'
  M.tmux_or_neoterm_cmd(cmd)
end

M.test_current_line = function()
  local current_file = M.alternate_test_file()
  local current_line = vim.fn.line(".")
  local cmd = 'IexTests.test("' .. current_file .. ':' .. current_line .. '")'
  M.tmux_or_neoterm_cmd(cmd)
end

M.watch_current_file = function()
  local current_file = M.alternate_test_file()
  local cmd = 'IexTests.test_watch("' .. current_file .. '")'
  M.tmux_or_neoterm_cmd(cmd)
end

M.start_iex_pry = function()
  M.tmux_or_neoterm_cmd(',tiex')
end

M.copy_module_name = function()
  local first_line = vim.fn.getline(1)

  if string.find(first_line, "defmodule") then
    local module_name = string.gsub(first_line, "defmodule ", "")
    module_name = string.gsub(module_name, " do", "")

    vim.fn.setreg("@", module_name)
    print('Copied ' .. module_name)
  else
    print('defmodule in the 1st line not found')
  end
end

return M
