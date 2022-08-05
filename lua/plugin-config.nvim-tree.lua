local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
  vim.notify("Not Fund nvim-tree")
  return
end

local list_keys = require('keybindings').nvimTreeList
nvim_tree.steup({
  
  -- 不显示git状态图标
  git = {
    enable = false,
  },
  -- project plugin 需要这样设置

  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },

  -- 隐藏 文件
  fileters = {
    dotfiles = true,
    custom = {'node_modules'},
  },

  view = {
    width = 40,
    side = 'left',
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = list_keys,
    },
    numbers = false,
    relativenumber = false,

    signcolumn = 'yes',
  },

  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = true,
    },
  },
  system_open = {
    cmd = 'open'
  },
})

-- auto closed
vim.cmd([[
 autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
