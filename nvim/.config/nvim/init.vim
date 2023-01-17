
" Vim Config 

" cursor and line config "
set mouse=a
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

" syntax "
syntax on

" search config "
set hlsearch 
set ignorecase
set smartcase
set showmatch 

" side numbers "
set number relativenumber 


" tabs "
set tabstop      =4 
set softtabstop  =4
set shiftwidth   =4
set textwidth    =79
set expandtab
set autoindent 

" colors "
set termguicolors
" plugins "
call plug#begin('~/.config/nvim/plugged')
call plug#end()

" airline plugin configs "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" nerd tree plugin configs "

autocmd StdinReadPre * let s:std_in=1

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

map <F5> :NERDTreeToggle<CR>

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" vim maps 
let mapleader = " "
inoremap jj <esc>

" telescope maps
nnoremap tt <cmd>Telescope<cr> 
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>

command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

map <C-g> :Ag

" coc config
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ ]

" go to map 
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" List code actions available for the current buffer
nmap <leader>ca  <Plug>(coc-codeaction)

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Allows coc to format go lang files on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" vim-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" vertical split
nnore map <silent> vv <C-w>v
map <Leader>vp :VimuxPromptCommand<CR>

command! -nargs=0 Nexterror                               :call CocAction('diagnosticNext')<CR>
command! -nargs=0 Preverror                               :call CocAction('diagnosticPrevious')<CR>

" lua config
lua <<EOF
-- packages 
require('plug-config/treesitter')
require('plug-config/toggleterm')
require('plug-config/plugins')
require('plug-config/tokyonight')
require('plug-config/null-ls')
require('plug-config/gitsigns')
require('plug-config/wilder')
require('options')
EOF

