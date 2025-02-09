return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          mason = false,
        },
        rust_anaylzer = {
          mason = true
        }
      },
    },
  },
}
