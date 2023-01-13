local fn = vim.fn

local ensure_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end 
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}
-- Packer automatically installs itself and other plugins
return packer.startup(function(use)
    use {'wbthomason/packer.nvim'}
    use 'vimwiki/vimwiki'
    use 'preservim/vimux'
    use 'roxma/nvim-yarp'
    use 'gelguy/wilder.nvim'
    use 'preservim/nerdtree'
    use 'bkegley/gloombuddy'
    use 'rstacruz/vim-closer'
    use 'nvim-lua/plenary.nvim'
    use 'vim-scripts/phpcs.vim'
    use 'romgrk/fzy-lua-native'
    use 'akinsho/toggleterm.nvim'
    use 'vim-airline/vim-airline'
    use 'roxma/vim-hug-neovim-rpc'
    use 'vim-airline/vim-airline-themes'
    use 'nvim-treesitter/nvim-treesitter'
    use 'jose-elias-alvarez/null-ls.nvim'
    use {'catppuccin/vim', as = 'catppuccin' }
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'folke/tokyonight.nvim', branch = 'main' }
    use {'nvim-telescope/telescope.nvim', branch = '0.1.x'}
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use {'prettier/vim-prettier', run = 'npm install', ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}}
    use {"startup-nvim/startup.nvim",requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
        require"startup".setup()
    end}
    if packer_bootstrap then
        require('packer').sync()
    end
end)
