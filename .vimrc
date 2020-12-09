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

" 能够漂亮地显示.NFO文件
set encoding=utf-8
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" 自带的补全
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Leader
let mapleader = ","


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


" ========Space-vim-dark========

colorscheme space-vim-dark


" ========NERDTree========

let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'

let g:NERDTreeIndicatorMapCustom={
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
" let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 默认打开
" let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_new_tab=1
" Unfocus NERDTree when leaving a tab for descriptive tab names
let g:nerdtree_tabs_meaningful_tab_names=1
" 只剩它一个标签时关掉窗口
let g:nerdtree_tabs_autoclose=1
" 同步所有鼠标 滚动位置
let g:nerdtree_tabs_synchronize_view=1
" 保证当跳转到一个新tab时焦点在内容上
let g:nerdtree_tabs_focus_on_files=1

" Open NERDTree by default
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Close NERDTree when Exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ========Omnicppcomplete========

set completeopt=longest,menu
let OmniCpp_NameSpaceSearch=2
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteScope=1


