" 加载插件配置文件
if filereadable(expand("~/.vim/.vimrc.plug"))
    source ~/.vim/.vimrc.plug
endif


" 配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC


" =====================================================================
" 我的配置 字体要在终端设置
" =====================================================================
set shell=/bin/zsh
" set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ 14
set t_Co=256
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\


" =====================================================================
" 插件
" =====================================================================

" airline
let g:airline#extensions#tabline#enabled = 1
let laststatus = 2
let g:airline_powerline_fonts = 1  " 使用powerline打过补丁的字体
let g:airline_theme = 'material'  " 设置主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>

" nerdtree
"“ 自动开启
autocmd vimenter * NERDTree
"” F2 开启/关闭 nerdtree
map <F2> :NERDTreeToggle<CR>
"“ 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"” nerdtree 宽度
let g:NERDTreeWinSize = 40

" vim-material Oceanic
if (has('termguicolors'))
  set termguicolors
endif
let g:material_theme_style = 'ocean'
colorscheme material

" indentLine 缩进
let g:indent_guides_guide_size = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进

" tagbar 文件结构
let g:tagbar_width = 35
let g:tagbar_autofocus = 1
let g:tagbar_right = 1
nmap <F3> :TagbarToggle<CR>

" 快速跳转
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
nmap <Leader><Leader>j <Plug>(easymotion-j)
nmap <Leader><leader>h <Plug>(easymotion-linebackward)
nmap <Leader><Leader>k <Plug>(easymotion-k)
nmap <Leader><leader>l <Plug>(easymotion-lineforward)
nmap <Leader><leader>s <Plug>(easymotion-s)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
" =====================================================================

let mapleader = ','
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
" 开启文件类型侦测
filetype on
