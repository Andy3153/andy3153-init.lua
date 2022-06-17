--
-- vimtex configuration
--

-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
g.vimtex_view_method = 'zathura'

-- VimTeX uses latexmk as the default compiler backend. If you use it, which is
-- strongly recommended, you probably don't need to configure anything. If you
-- want another compiler backend, you can change it as follows. The list of
-- supported backends and further explanation is provided in the documentation,
-- see ":help vimtex-compiler".
g.vimtex_compiler_method = 'latexmk' -- 'latexrun'

-- Most VimTeX mappings rely on localleader and this can be changed with the
-- following line. The default is usually fine and is the symbol "\".
--let maplocalleader = ","


-- Use XeLaTeX
g.vimtex_compiler_latexmk =
{
  executable = 'latexmk',
  options =
  {
    '-xelatex',
    '-shell-escape',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  }
}
