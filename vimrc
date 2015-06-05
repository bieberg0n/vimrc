" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"if has("syntax")
"  syntax on
"endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=v		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"快捷键{
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
map <F4> :w<CR>:!clear&&sh % <CR>
"map <F7> :w<CR>
set nu
"map <F5> :w<CR>:!clear&&jikes -encoding UTF-8  %&&java %:r <CR>
map <F9> :w !sudo tee % > /dev/null
map <F5> :w<CR>
imap <F5> <Esc>:w<CR>a
map <F6> :w<CR>:!clear&&python3.2 % <CR>
"map <F9> :e!<CR>
map <F12> :qa<CR>
map <F7> :w<CR>:!clear&&python % <CR>
map <c-j> <C-W>j
map <c-k> <C-W>k
map <c-h> <C-W>h
map <c-l> <C-W>l
"}
"
set nocompatible "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
syntax on "打开高亮
"if has("autocmd")
"    filetype plugin indent on "根据文件进行缩进
"    augroup vimrcEx
"        au!
"        autocmd FileType text setlocal textwidth=78
"        autocmd BufReadPost *
"                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
"                    \ exe "normal! g`\"" |
"                    \ endif
"    augroup END
"else
    "智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，但是效果会比只支持C/C++的cindent效果会差一点，但笔者并没有看出来
"    set autoindent " always set autoindenting on 
"endif " has("autocmd")
"set vb t_vb=
"set nowrap "不自动换行
set hlsearch "高亮显示结果
set incsearch "在输入要搜索的文字时，vim会实时匹配
set backspace=indent,eol,start whichwrap+=<,>,[,] "允许退格键的使用
"防止linux终端下无法拷贝
"if has('mouse')
set mouse=v
"endif
au GUIEnter * simalt ~x
"字体的设置
"set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI "记住空格用下划线代替哦
"set gfw=幼圆:h10:cGB2312`'")"'))"
"
"
"set some bindings up for 'compile' of python 
"au BufNewFile,BufRead *.py :set filetype=python
autocmd FileType python set omnifunc=pythoncomplete#Complete
au BufNewFile,BufRead pdnsd.conf :set filetype=c
au FileType python :set makeprg=python\ % 
au FileType python :TagbarToggle
"au FileType c :set ft=c
"au BufNewFile,BufRead *.py :set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
au FileType python :set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
"au BufNewFile,BufRead *.py nmap <buffer> <F8> :up!<cr>:make<cr> 
"au BufNewFile,BufRead *.py vmap <buffer> <F8> :<c-u>up!<cr>:make<cr> 
"au FileType python nmap <buffer> <F8> :up!<cr>:make<cr><cr>
"au FileType python :copen
"F8 '编译' 
"au BufNewFile,BufRead *.py nmap <buffer> <F12> :cl<cr> 
""F12 列出错误行号 
"
set helplang=cn
"
"Mactalk{
set ai "自动缩进
set bs=2 "在insert模式下用退格键删除
set laststatus=2 "总是显示状态行
"set expandtab "tab设置用空格代替制表符
set shiftwidth=4 
set tabstop=4 "让一个tab等于4个空格
set autoread "文件修改过自动重读
"set ignorecase "检索时忽略大小写
set fileencodings=utf-8,gbk "用utf-8或gbk打开文件
"set hls "检索时高亮显示匹配项
"set foldmethod=syntax "代码折叠
"标签页配置
let mapleader = ' '
nnoremap L gt
nnoremap H gT
nnoremap <leader>t : tabe<CR>
map <leader>q <C-W>q
noremap \ ,
nmap <leader>l :noh<CR>
"conf for plugins {{ 插件相关的配置
"powerline{
"set guifont=PowerlineSymbols\ for\ Powerline
"let g:Powerline_symbols = 'unicode'
"let Powerline_symbols = 'compatible' 
"set encoding=utf8
"}
"pathogen是Vim用来管理插件的插件
""pathogen{
"call pathogen#infect()
execute pathogen#infect()
"}
"
""}}
set ruler
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
"set background=dark "背景使用黑色
set magic
:hi Search cterm=bold ctermfg=55 ctermbg=231 gui=bold guifg=#5f00af guibg=#ffffff
set cursorline "光标所在行下划线
set cursorcolumn "光标所在列高亮
:hi CursorColumn ctermbg=236 "高亮当前列的背景颜色
:hi CursorLine cterm=none ctermbg=236 "高亮当前行的背景颜色
set ttimeoutlen=50
"runtime macros/matchit.vim

"F2开启粘贴模式{
"nnoremap <F2> :set invpaste paste?<CR>
nnoremap <F2> :set nonu! nu?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
"}

"vundle配置{
set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"Plugin 'gmarik/vundle'

"my Bundle here:
"
" original repos on github
"Plugin 'scrooloose/syntastic'
Plugin 'kevinw/pyflakes-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'codepiano/ctrlp.vim'
"Plugin 'Yggdroot/indentLine'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/matchit.zip'
Plugin 'scrooloose/nerdcommenter'
Plugin 'hdima/python-syntax'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
"Plugin 'altercation/vim-colors-solarized'
"..................................
" vim-scripts repos
Plugin 'showcolor.vim'
Plugin 'jreybert/vim-largefile'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................
filetype plugin indent on "启动自动补全
"}

"syntastic配置{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"}

"pyflakes{
":hi PyFlakes cterm=underline
:hi PyFlakes ctermfg=55 ctermbg=231 gui=bold guifg=#5f00af guibg=#ffffff
"}

"supertab配置{
let g:SuperTabRetainCompletionType=2
" 0 - 不记录上次的补全方式
" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabDefaultCompletionType="<C-X><C-n>" "设置按下<Tab>后默认的补全方式
let g:SuperTabMappingForward = "<tab>"
let g:SuperTabMappingBackward= "s-tab" "按shift+tab输出制表符

"rainbow_parentheses配置{
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"}

"indentLines{
"nmap <leader>l :IndentLinesToggle<CR>
"let g:indentLine_char = 'c'
"let g:indentLine_enabled = 1
"let g:indentLine_color_gui = '#A4E57E'
"let g:indentLine_color_term = 239
"let g:indentLine_char = '┆'
"}

"indent_guides{
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
"}

"solarized{
"syntax enable
"set background=dark
"colorscheme solarized
"}

"tagbar{
nmap <F8> :TagbarToggle<CR>
"}

"NeoComplCache{
"let g:NeoComplCache_DisableAutoComplete = 1
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
let g:neocomplcache_enable_at_startup = 1
:hi Pmenu ctermfg=55 ctermbg=231
"}

"airline{
set t_Co=256
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"}
