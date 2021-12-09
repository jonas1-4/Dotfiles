autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = "\<C-y>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

let g:completion_enable_auto_signature = 0

let g:completion_matching_strategy_list = ['substring', 'exact']

let g:completion_enable_snippet = 'vim-vsnip'

" Avoid showing message extra message when using completion
set shortmess+=c
