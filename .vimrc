" 加载插件配置文件
if filereadable(expand("~/.vimrc.bundles"))
	source ~/.vimrc.bundles
endif
" 配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 我的配置
set shell=/bin/zsh
set rtp+=/Users/yang/.local/lib/python3.6/site-packages/powerline/bindings/vim
" set guifont=Monaco\ for\ Powerline:h14.5
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
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
" 高亮显示当前行
set cursorline
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
syntax on
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
" 开启文件类型侦测
filetype on
