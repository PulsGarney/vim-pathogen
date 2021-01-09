" ========基本设置=====================================

" 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

" use mouse everywhere
set mouse=a

" 行号
set number

" 文件类型
filetype plugin indent on

" 历史行数
set history=4096

" 背景
set t_Co=256
"set background=dark

" 语法高亮度显示
syntax enable

" 高亮行
set cursorcolumn
set cursorline

" 自动对齐、智能对齐
set autoindent
set smartindent

" 设置tab键为4个空格
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 匹配模式，匹配相应的括号
set showmatch

" 去掉错误响声
set noeb

" vim 自身命令行模式智能补全
set wildmenu

" 在编辑过程中，在右下角显示光标位置的状态行
set ruler

" 匹配高亮
set hls

" 快速匹配
set incsearch

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 不要用空格代替制表符
" set noexpandtab
set expandtab

" 在行和段开始处使用制表符
" set smarttab

" 禁止生成临时文件
set nobackup
set noswapfile

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" 总是显示状态行
set laststatus=2
  
" 在编辑过程中，在右下角显示光标位置的状态行
set ruler

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

" Leader
let mapleader = ","

" copy to system
" noremap <Leader>y "*y
" noremap <Leader>Y "+y
" noremap <Leader>p "*p
" noremap <Leader>P "+p
:vmap <C-c> "+y
:vmap <C-v> "+p


" ========插件配置=====================================

" ========Pathogen========

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags


" ========Coc========

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <Ctrl-F> to format documents with prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <C-F> :Prettier<CR>
" Use <Space-E> to open explorer
" Using Coc-explorer
noremap <space>e :CocCommand explorer<CR>
" Close Coc-explorer if it is the only window
autocmd BufEnter * if (&ft == 'coc-explorer' && winnr("$") == 1) | q | endif


" ========Space-vim-dark========

colorscheme space-vim-dark


