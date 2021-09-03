" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)



" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent><leader>go <Plug>(coc-codelens-action)
vmap <silent><leader>ga  <Plug>(coc-codeaction-selected)
nmap <silent><leader>ga  <Plug>(coc-codeaction-selected)
nmap <silent><leader>a  <Plug>(coc-codeaction)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>ar <Plug>(coc-format)
au BufWrite *  <Plug>(coc-format)
nmap <silent> gg <Plug>(coc-rename)
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <silent><expr> <C-space> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"html.autoClosingTags:
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
