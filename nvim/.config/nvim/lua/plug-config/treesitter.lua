local configs = require'nvim-treesitter.configs'
configs.setup {
  highlight = {
    enable = true,
  }
}
require'nvim-treesitter.configs'.setup {

    ensure_installed = { "php", "go", "bash", "html", "css", "perl", "lua", "javascript", "yaml"},

    sync_install = false,

    auto_install = true,

    highlight = {
      enable = true,
    },
  }
