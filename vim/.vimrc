" Configuración inicial de Vim
set number
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
"set showmode
set wildmenu
" set t_ti= t_te=
set mouse=
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set nobackup
set nowritebackup
set updatetime=500

" La columna extra es para que el linter de CoC pueda marcar las líneas que contienen errores
set signcolumn=yes

let g:airline_powerline_fonts = 1
let g:mapleader='\'

" Plugins
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
call plug#end()

" Atajos de teclas
nnoremap <leader>n :NERDTreeToggle<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Airline necesita las fuentes Powerline. Revisar https://github.com/vim-airline/vim-airline
let g:airline_theme='bubblegum'

" Configuración de CoC
let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-html', 'coc-css', 'coc-tsserver', 'coc-sh', 'coc-stylelintplus', 'coc-emmet']
autocmd FileType markdown let b:coc_suggest_disable = 1

" Con TAB autocompleta
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Con CR acepta el autocompletado
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent><nowait> <leader>d  :<C-u>CocList diagnostics<cr>

" Configuración de VimWiki
let g:vimwiki_list = [
\ {
\ 	'syntax': 'markdown',
\ 	'ext': 'md',
\ 	'path': '/mnt/hdd/Nextcloud/Notoj'
\ }
\ ]
let g:vimwiki_global_ext=0
" autocmd VimEnter * NERDTree | wincmd p

