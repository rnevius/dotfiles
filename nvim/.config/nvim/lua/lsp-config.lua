local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  require('lspsaga').init_lsp_saga {
    code_action_icon = '🔧',
  }
  require("trouble").setup {
    icons = false,
  }

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- General mappings
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'K',          '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
  buf_set_keymap('n', '<Leader>la', '<Cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
  buf_set_keymap('n', 'gd',         '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>lf', '<Cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
  buf_set_keymap('n', '<Leader>li', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Leader>lp', '<Cmd>lua require("lspsaga.provider").preview_definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>lr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Leader>lk', '<Cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
  buf_set_keymap('n', '<Leader>rn', '<Cmd>lua require("lspsaga.rename").rename()<CR>', opts)

  -- Diagnostics mappings
  buf_set_keymap('n', '<Leader>ll', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<Leader>ld', '<Cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d',         '<Cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)
  buf_set_keymap('n', ']d',         '<Cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<Leader>a", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<Leader>a", "<Cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  print("[" .. client.name .. "] client loaded!")
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
  "cssls",
  "gopls",
  "graphql",
  "html",
  "jsonls",
  "pylsp",
  "solargraph",
  "tsserver",
  "yamlls"
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    handlers = {
      ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          signs = true,
          underline = true,
          -- virtual_text = false
        }
      ),
    },
    on_attach = on_attach
  }
end

nvim_lsp.elixirls.setup{
  cmd = { vim.env.HOME .. "/.elixir-ls/release/language_server.sh" };
  on_attach = on_attach
}

-- set the path to the sumneko (lua lsp) installation
local sumneko_root_path = vim.env.HOME .. '/.lua-ls'
local sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'

nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
  on_attach = on_attach
}
