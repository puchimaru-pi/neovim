local cmp = require('cmp')
local lspkind = require('lspkind')

 cmp.setup({
   snippet = {
     expand = function(args)
       vim.fn['vsnip#anonymous'](args.body)
     end
   },

   window = {
      completion = cmp.config.window.bordered({
        border = 'single'
    }),
      documentation = cmp.config.window.bordered({
        border = 'single'
    }),
   },

   mapping = cmp.mapping.preset.insert({
     ['<Tab>'] = cmp.mapping.select_next_item(),
     ['<S-Tab>'] = cmp.mapping.select_prev_item(),
     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
     ['<C-f>'] = cmp.mapping.scroll_docs(4),
     ['<C-Space>'] = cmp.mapping.complete(),
     ['<C-e>'] = cmp.mapping.abort(),
     ['<CR>'] = cmp.mapping.confirm({ select = true }),
   }),

 formatting = {
   format = lspkind.cmp_format({
     mode = 'symbol',
     maxwidth = 50,
     ellipsis_char = '...',
   })
  },

 sources = cmp.config.sources({
   { name = 'nvim_lsp' },
   { name = 'vsnip' },
   { name = 'nvim_lsp_signature_help' },
   { name = 'calc' },
  }, {
   { name = 'buffer', keyword_length = 2 },
  })
 })

 cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
  { name = 'nvim_lsp_document_symbol' }
  }, {
   { name = 'buffer' }
  })
 })

 cmp.setup.cmdline(':', {
 mapping = cmp.mapping.preset.cmdline(),
 sources = cmp.config.sources({
   { name = 'path' }
  }, {
   { name = 'cmdline', keyword_length = 2 }
  })
 })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.cmd('let g:vsnip_filetypes = {}')
