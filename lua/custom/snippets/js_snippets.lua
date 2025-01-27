local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local filetypes = { 'javascript', 'typescript', 'typescriptreact' }

for _, ft in ipairs(filetypes) do
  ls.add_snippets(ft, {
    s('_desc', {
      t "describe('",
      i(1, 'description'),
      t { "', () => {", '\t' },
      i(2, '// test cases go here'),
      t { '', '})' },
    }),
  })

  ls.add_snippets(ft, {
    s('_t', {
      t "it('",
      i(1, 'it should'),
      t { "', () => {", '\t' },
      i(2, '// test implementation'),
      t { '', '})' },
    }),
  })

  -- async variant of test()
  ls.add_snippets(ft, {
    s('_ta', {
      t "it('",
      i(1, 'it should'),
      t { "', async () => {", '\t' },
      i(2, '// test implementation'),
      t { '', '})' },
    }),
  })

  ls.add_snippets(ft, {
    s('_ex', {
      t 'expect(',
      i(1, 'target'),
      t { ').' },
      i(2, ''),
    }),
  })
end
