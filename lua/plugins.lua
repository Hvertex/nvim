local packer = require('packer')
packer.startup({
  function(use) 
    use('wbthomason/packer.nvim')
    use('folke/tokyonight.nvim')
    use({'kyazdani42/nvim-tree.lua', requires = "kyazdani42/nvim-web-devicons"})
  end,
  config = {
    max_jobs = 12,
    display = {
      open_fn = function()
        return require("packer.util").float({border="single"})
      end,
    },
  }
})

pcall (
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocm BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
