" 加载插件配置文件
if filereadable(expand("~/.vim/.vimrc.plug"))
    source ~/.vim/.vimrc.plug
endif
" 配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC


" =====================================================================
" 键位配置 字体要在终端设置
" =====================================================================
" Leader 键
let mapleader = '\'
" 全选当前文档
nmap <C-a> ggvG$
" Ctrl-s 保存
nnoremap <silent><c-s> :<c-u>update<cr><Esc>
vnoremap <silent><c-s> <c-c>:update<cr>gv<Esc>
inoremap <silent><c-s> <c-o>:update<cr><Esc>
" 跳行尾
nnoremap <silent><M-l> $
vnoremap <silent><M-l> $
inoremap <silent><M-l> <Esc>$a
" 跳行首
nnoremap <silent><M-h> ^
vnoremap <silent><M-h> ^
inoremap <silent><M-h> <Esc>^a
" 将该行向上移动
nnoremap <silent><M-k> :m -2<Esc>
" 将该行向下移动
nnoremap <silent><M-j> :m +1<Esc>


" =====================================================================
" VIM 常规配置 字体要在终端设置
" =====================================================================
set shell=/bin/zsh
" set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ 14
set t_Co=256
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
" 显示行号
set number
" 显示相对行号
set relativenumber
" 显示标尺
set ruler
" 显示空格和tab
set list listchars=tab:>-,trail:·
" 开启光亮光标行
set cursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=grey guibg=darkred guifg=white
"开启高亮光标列
set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=grey guibg=darkred guifg=white
" 开启实时搜索功能
set incsearch
" 高亮显示搜索结果
set hlsearch
" 历史记录
set history=1000
" 显示输入命令
set showcmd
" 启动显示状态行
set laststatus=2
" 语法高亮
" syntax on
set fileencoding=utf-8
set termencoding=utf-8
set fileformat=unix
set encoding=utf-8
" 代码折叠
set foldmethod=syntax
" 自动对齐
set autoindent
set smartindent
" 去掉vi一致性的模式，解决backspace的问题
set nocompatible
set backspace=indent,eol,start
set backspace=2
" 命令行模式自动补全
set wildmenu
" tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" 禁用自动备份
set nobackup
set nowritebackup
set noswapfile
" 共享剪贴板
set clipboard+=unnamed
" 自动保存文件
set autowriteall
" 开启文件类型侦测
set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters
filetype on
let g:python_highlight_all = 1


" =====================================================================
" 插件配置
" =====================================================================
for f in split(glob('~/.vim/plug.vimrc.d/*.vimrc'), '\n')
    exe 'source' f
endfor