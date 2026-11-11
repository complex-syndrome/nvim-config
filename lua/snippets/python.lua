local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('np', {
    t 'import numpy as np',
  }),

  s('pd', {
    t 'import pandas as pd',
  }),

  s('plt', {
    t 'import matplotlib.pyplot as plt',
  }),

  s('dd', {
    t 'import dask.dataframe as dd',
  }),

  s('tf', {
    t 'import tensorflow as tf',
  }),

  s('enumerate', {
    t 'for i in enumerate(',
    i(1, 'arr'),
    t { '):', '    ' },
    i(0),
  }),

  s('super', {
    t 'super().__init__()',
  }),
}
--
-- return {
--   s('main', {
--     t {
--       'if __name__ == "__main__":',
--       '    ',
--     },
--     i(0),
--   }),
--
--   s('def', {
-- t 'def ',
-- i(1, 'function_name'),
-- t '(',
-- i(2),
-- t { '):', '    ' },
-- i(0),
--   }),
--
--   s('for', {
--     t 'for ',
--     i(1, 'item'),
--     t ' in ',
--     i(2, 'items'),
--     t { ':', '    ' },
--     i(0),
--   }),
--
--   s('class', {
--     t 'class ',
--     i(1, 'ClassName'),
--     t { ':', '    ' },
--     i(0),
--   }),
--     s('dataclass', {
--   t({
--     'from dataclasses import dataclass',
--     '',
--     '',
--     '@dataclass',
--     'class ',
--   }),
--   i(1, 'MyClass'),
--   t({
--     ':',
--     '    ',
--   }),
--   i(2, 'field: str'),
--   t({ '', '' }),
--   i(0),
-- }),
-- }
