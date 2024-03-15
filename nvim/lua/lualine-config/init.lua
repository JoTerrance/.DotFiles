  require('lualine').setup({
    options = {
      theme = 'vscode', 
      icons_enabled = BlindReturn( false, true),
      component_separators = BlindReturn({left = '', right = ''} ,{ left = '', right = ''}),
      section_separators = BlindReturn({left = '', right = ''} , { left = '', right = ''}),
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
      extensions = {'nvim-tree'}
  })
