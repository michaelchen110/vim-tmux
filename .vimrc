" General
syntax on
set nu
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2
set autoindent
set smartindent
set clipboard=unnamed
set noeb vb t_vb=
set nocp
set nomodeline
set splitright
set splitbelow
set ignorecase
"set smartcase
set incsearch
set enc=utf8
colors elflord
set foldmarker={{,}} foldlevel=0 
autocmd FileType vim setlocal foldmethod=marker

"ctags
"autocmd BufEnter * silent! lcd %:p:h
set autochdir
set tags+=tags;/
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" insert mode shortcut
inoremap <C-CR> <Esc>o
inoremap { {}<ESC>i
inoremap {<CR> {<CR>}<Esc>O
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Yank text to the OS X clipboard" 
noremap <leader>y "*y
noremap <leader>yy "*Y
" Preserve indentation while pasting text from the OS X clipboard 
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

" normal mode shortcut
"nmap <C-]>r :!ctags -R .<CR>
nmap <Leader>n :set invnumber<CR>
nmap <C-@> :call Compile()<CR>

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
"Airline {{
    Plugin 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    " air-line
    let g:airline_powerline_fonts = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    "" airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:s14
    Plugin 'vim-airline/vim-airline-themes'
"}}

"Nerd commenter/tree {{
    Plugin 'scrooloose/nerdcommenter'
    " nerdcommenter
    map <Leader><Leader> <Leader>c<space>
    Plugin 'scrooloose/nerdtree'
    " NERDTree
    map ,, :NERDTreeToggle<CR>
"}}

"Emmet {{
    Plugin 'mattn/emmet-vim'
    " emmet
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,php,js EmmetInstall
    autocmd FileType html,css,php,js imap <expr> <tab> emmet#expandabbrintelligent("\<tab>")
"}}

" Multi-Cursors{{
    Plugin 'terryma/vim-multiple-cursors'
    " vim-multiple-cursors 
    "let g:multi_cursor_next_key='<c-n>'
    let g:multi_cursor_prev_key='<c-b>'
    "let g:multi_cursor_skip_key='<c-x>'
    "let g:multi_cursor_quit_key='<esc>'
    nnoremap <silent> <m-j> :multiplecursorsfind <c-r>/<cr>
    vnoremap <silent> <m-j> :multiplecursorsfind <c-r>/<cr>
"}}

"Easy Motion {{
    Plugin 'easymotion/vim-easymotion'
    " easymotion
    map <leader> <plug>(easymotion-prefix)
    " <leader>f{char} to move to {char}
    map  <leader>f <plug>(easymotion-bd-f)
    nmap <leader>f <plug>(easymotion-overwin-f)
    " s{char}{char} to move to {char}{char}
    nmap s <plug>(easymotion-overwin-f2)
    " move to line
    map <leader>l <plug>(easymotion-bd-jk)
    nmap <leader>l <plug>(easymotion-overwin-line)
    " move to word
    map  <leader>w <plug>(easymotion-bd-w)
    nmap <leader>w <plug>(easymotion-overwin-w)
"}}

"Neocomplete {{
    Plugin 'shougo/neocomplete.vim'
    "neocomplete
    " disable autocomplpop.
    let g:acp_enableatstartup = 0
    " use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    " define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $home.'/.vimshell_hist',
        \ 'scheme' : $home.'/.gosh_completions'
            \ }

    " define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " plugin key-mappings.
    "inoremap <expr><c-g>     neocomplete#undo_completion()
    "inoremap <expr><c-l>     neocomplete#complete_common_string()

    " recommended key-mappings.
    " <cr>: close popup and save indent.
    inoremap <silent> <cr> <c-r>=<sid>my_cr_function()<cr>
    function! s:my_cr_function()
      return (pumvisible() ? "\<c-y>" : "" ) . "\<cr>"
      " for no inserting <cr> key.
      "return pumvisible() ? "\<c-y>" : "\<cr>"
    endfunction
    " <tab>: completion.
    inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"
    " <c-h>, <bs>: close popup and delete backword char.
    "inoremap <expr><c-h> neocomplete#smart_close_popup()."\<c-h>"
    inoremap <expr><bs> neocomplete#smart_close_popup()."\<c-h>"
    " close popup by <space>.
    "inoremap <expr><space> pumvisible() ? "\<c-y>" : "\<space>"

    " autocomplpop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><tab>  pumvisible() ? "\<down>" : "\<c-x>\<c-u>"

    " enable omni completion.
    autocmd filetype css setlocal omnifunc=csscomplete#completecss
    autocmd filetype html,markdown setlocal omnifunc=htmlcomplete#completetags
    autocmd filetype javascript setlocal omnifunc=javascriptcomplete#completejs
    autocmd filetype python setlocal omnifunc=pythoncomplete#complete
    autocmd filetype xml setlocal omnifunc=xmlcomplete#completetags

    " enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " for perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}
call vundle#end()            " required
filetype plugin indent on    " required