set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set number
set tabstop=4
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Add plugins here
Plugin 'mhartington/oceanic-next'
Plugin 'sainnhe/gruvbox-material'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'zhou13/vim-easyescape'
call vundle#end()
filetype plugin indent on     

" Color scheme usage
if (has("termguicolors"))
 set termguicolors
endif

syntax enable

" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
set background=dark
let g:gruvbox_material_background = 'soft'

" For better performance
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
" colorscheme oceanicnext

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" Color scheme for airline
let g:airline_theme='gruvbox_material'

" Add NERDTree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Add fzf ctrlP integration "
set rtp+=~/.fzf.zsh
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

nmap <C-P> :GFiles<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
     \ quit | endif
" Quick way to source vimrc (use \then 1)
nnoremap <silent> <leader> 1: source ~/.vimrc \| :PluginInstall<CR>

" This allows for jk/ kj to be used to return to normal mode instead of the
" exc key. I think this is better
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>
