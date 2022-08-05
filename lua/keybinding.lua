vim.g.mapleader = " "
vim.g.maplocalleader = " "


local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}
-- windows split 
map("n","s", "", opt)
map("n","sv", ":vsp<CR>", opt)
map("n","sh",":sp<CR>",opt)

-- 关闭当前
map("n","sc","<C-w>c", opt)
-- 关闭其他
map("n","so","<C-w>o", opt)

-- 窗口移动
map("n","<A-h>","<C-w>h",opt)
map("n","<A-j>","<C-w>j",opt)
map("n","<A-k>","<C-w>k",opt)
map("n","<A-l>","<C-w>l",opt)

-- 窗口大小比例
-- 左右
map("n","<C-Left>",":vertical resize -2<CR>", opt)
map("n","<C-Right>",":vertical resize +2<CR>", opt)
map("n","s,",":vertical resize -20<CR>", opt)
map("n","s.",":vertical resize +20<CR>", opt)

-- 上下
map("n","sj",":resize +10<CR>", opt)
map("n","sk",":resize -10<CR>", opt)
map("n","<C-Down>",":resize +2<CR>", opt)
map("n","<C-Up>", ":resize -2<CR>", opt)
-- 等比

map("n","s=","<C-w>=",opt)


-- Terminal 
map("n","<leader>t", ":sp | terminal<CR>",opt)
map("n","<leader>vt", ":vsp | terminal<CR>",opt)
map("t","<ESC>", ":<C-\\><C-n>",opt)
map("t","<A-h>", [[ <C-\><C-N><C-w>h ]],opt)
map("t","<A-j>", [[ <C-\><C-N><C-w>j ]],opt)
map("t","<A-k>", [[ <C-\><C-N><C-w>k ]],opt)
map("t","<A-l>", [[ <C-\><C-N><C-w>l ]],opt)


-- Visule 模式
map("v","<","<gv",opt)
map("v",">",">gv",opt)

map("v","J",":move '>+1<CR>gv-gv",opt)
map("v","K",":move '>-21<CR>gv-gv",opt)
map("v","p",'"_dP', opt)

-- C+j/k 移动4 行 C+u/d移动9行
map("n","<C-j>","4j",opt)
map("n","<C-k>","4k",opt)
map("n","<C-u>","9k",opt)
map("n","<C-d>","9j",opt)


map("n","q",":q<CR>",opt)
map("n","qq",":q!<CR>",opt)
map("n","Q",":qa!<CR>",opt)

map("n","<C-s>",":w<CR>",opt)


map("i","<C-h>","<ESC>I",opt)
map("i","<C-l>","<ESC>A",opt)

local pluginKeys = {}
-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys
