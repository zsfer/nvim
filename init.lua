vim.o.number = false
vim.o.relativenumber = false
vim.o.wrap = true
vim.o.signcolumn = 'yes'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.clipboard = 'unnamedplus'
vim.o.winborder = 'rounded'
vim.o.autocomplete = true
vim.o.complete = ".,o"
vim.o.completeopt = "fuzzy,menuone,noselect"
vim.o.pumheight = 7

vim.g.mapleader = ' '

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>o', ':update<CR> :source<CR>')
map('i', 'jj', '<Esc>')

map({'n','v'}, '<Tab>', '>>', opts)
map({'n','v'}, '<S-Tab>', '<<', opts)

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

require "mason".setup()
require "mini.pick".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = {
		"python",
		"odin",
		"c",
		"cpp",
		"c_sharp",
		"typescript",
		"javascript"
	},
	highlight = { enable = true },
})

map('n', '<leader>ff', ':Pick files<Cr>', opts)
map('n', '<leader>fs', ':Pick grep<Cr>', opts)

vim.lsp.enable({ "lua_ls", "csharp_ls" })
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
	end
})

map('n', 'gd', vim.lsp.buf.type_definition, opts)
map('n', 'gD', vim.lsp.buf.definition, opts)
map('n', '<leader>cr', vim.lsp.buf.rename, opts)
map('n', '<leader>r', vim.lsp.buf.references, opts)
map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
map('n', '<leader>q', vim.lsp.buf.workspace_diagnostics, opts)

vim.cmd("colorscheme minicyan")
vim.cmd(":hi statusline guibg=NONE")
