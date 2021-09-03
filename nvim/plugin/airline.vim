 "" let g:airline_extensions = []
"let g:airline#extensions#hunks#enabled=0
let g:airline_filetype_overrides = {'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],}

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
""let g:airline_right_sep = '«'
""let g:airline_right_sep = '◀'
""let g:airline_symbols.linenr = '␊'
""let g:airline_symbols.linenr = '␤'
""let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '  '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
""let g:airline_right_sep = ''
""let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
