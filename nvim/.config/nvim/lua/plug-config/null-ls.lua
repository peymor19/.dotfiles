local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.register(null_ls.builtins.diagnostics.phpcs.with({
      args = {
        "--report=json",
        "-q",
        "-s",
        "--runtime-set",
        "ignore_warnings_on_exit",
        "1",
        "--runtime-set",
        "ignore_errors_on_exit",
        "1",
        "--stdin-path=$FILENAME",
        "-",
      },
    })),
    null_ls.register(null_ls.builtins.diagnostics.phpmd.with({ extra_args = { "cleancode,design,unusedcode" } }),
    null_ls.register(null_ls.builtins.formatting.phpcbf.with({
      args = {
        "-q",
        "--stdin-path=$FILENAME",
        "-",
      },
    }))),
    null_ls.register(null_ls.builtins.formatting.phpcsfixer),
    null_ls.builtins.code_actions.gitsigns,
    }
})
