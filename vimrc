call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set foldmethod=indent
set foldlevel=99

let python_highlight_all = 1

set statusline =

" source ~/.vim/ropevim/ftplugin/python/ropevim.vim

" Add rope complenition
au BufRead,BufNewFile *.py,*pyw let ropevim_vim_completion=1
let rope_vim_completion=1

function! TabWrapperRope()
  if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-R>=RopeCodeAssistInsertMode()\<CR>"
  endif
endfunction

au BufRead,BufNewFile *.py,*pyw imap <Tab> <C-R>=TabWrapperRope()<CR>
au BufRead,BufNewFile *.py,*pyw imap <silent><C-Space> <ESC>l:RopeCodeAssist<CR>
au BufRead,BufNewFile *.py,*pyw nmap <silent><C-Space> :RopeCodeAssist<CR>
au BufRead,BufNewFile *.py,*pyw nnoremap <silent>, :call RopeShowDoc()<CR>

source ~/.vim/bufexplorer/bufexplorer.vim

source ~/.vim/makegreen/makegreen.vim
autocmd BufNewFile,BufRead *.py compiler nose
let $DJANGO_SETTINGS_MODULE = "settings"

" CTRL-F10 - quick exit
nmap <C-F10> :xa<cr>
vmap <F10> <esc>:xa<cr>i
imap <F10> <esc>:xa<cr>i

" F2 - quick save
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - highlight all occurrences of the current word
nnoremap <F3> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

source ~/.vim/nerdtree/plugin/NERD_tree.vim

" F5 - buffers list
nmap <F5> <esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - previous buffer
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - next buffer
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" NERDTree
map <C-o> <esc>:NERDTree<cr>
vmap <C-o> <esc>:NERDTree<cr>
imap <C-o> <esc><esc>:NERDTree<cr>
let NERDTreeIgnore = ['\.pyc$', '\.log$', '\.bat$', '\.sh$']

" Makegreen
map <C-t> <esc>Makegreen<cr>

" Ropevim
map <leader>g :RopeGotoDefinition<CR>
map <leader>m :RopeMove<CR>
map <leader>r :RopeRename<CR>
map <leader>f :RopeFindOccurrences<CR>

" TagList
nnoremap <silent> <C-F8> :TlistOpen<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
map <C-F7> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
