if filereadable(expand("~/.vim/.vimrc.plug"))
    source ~/.vim/.vimrc.plug
endif


" 配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC


" =====================================================================
" 键位配置
" =====================================================================
" Leader 键
let mapleader = '\'
" 全选当前文档
nmap <C-a> ggvG$
" Ctrl-s 保存
nnoremap <silent><c-s> :<c-u>update<cr><Esc>
vnoremap <silent><c-s> <c-c>:update<cr>gv<Esc>
inoremap <silent><c-s> <c-o>:update<cr><Esc>
" 切换窗口
nnoremap <silent><c-h> <c-w>h
nnoremap <silent><c-j> <c-w>j
nnoremap <silent><c-k> <c-w>k
nnoremap <silent><c-i> <c-w>i
" 跳行尾
nnoremap <silent>¬ $
vnoremap <silent>¬ $
inoremap <silent>¬ <Esc>$a
" 跳行首
nnoremap <silent>˙ ^
vnoremap <silent>˙ ^
inoremap <silent>˙ <Esc>^a
" 将该行向上移动
nnoremap <silent>˚ :m -2<Esc>
" 将该行向下移动
nnoremap <silent>∆ :m +1<Esc>


" =====================================================================
" 我的配置 字体要在终端设置
" =====================================================================
set shell=/bin/zsh
set guifont=JetBrains\ Mono\ Bold\ Nerd\ Font\ Complete\ Mono:h12
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


" =====================================================================
" 插件配置
" =====================================================================

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> airline
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

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  LeaderF
"" 自动生成gtags
let g:LF_GtagsAutoGenerate = 1
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.vscode', '.idea']
let g:Lf_ShowHidden = 1
let g:Lf_WindowHeight = 0.30

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> nerdtree
" 自动开启
" autocmd vimenter * NERDTree
" F2 开启/关闭 nerdtree
" map <F2> :NERDTreeToggle<CR>
" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree 宽度
let g:NERDTreeWinSize = 35

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> defx
map <F2> :Defx -search=`expand('%:p')` -toggle <CR>
" 自动开启
func! ArgFunc() abort
    let s:arg = argv(0)
    if isdirectory(s:arg)
        return s:arg
    else
        return fnamemodify(s:arg, ':h')
    endif
endfunc
autocmd VimEnter * Defx `ArgFunc()` -no-focus -search=`expand('%:p')`
" autocmd vimenter * Defx
" 设置defx树的一些格式
call defx#custom#option('_', {
      \ 'columns': 'icons:indent:filename:size',
      \ 'winwidth': 35,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'resume': 1,
      \ })
" Exit Vim if defxTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:defx') |
\ quit | endif
" 在新tab页打开文件
func! MyT(context) abort
    if isdirectory(get(a:context.targets, 0)) == 0
        call defx#call_action('drop', 'tabe')
    endif
endfun
" cd 目录
func! MyCD(context) abort
    if isdirectory(get(a:context.targets, 0))
        execute 'cd' . get(a:context.targets, 0)
    else
        execute 'cd' . fnamemodify(defx#get_candidate().action__path, ':h')
    endif
endfunc
" Avoid the white space highting issue
autocmd FileType defx match ExtraWhitespace /^^/
" Keymap in defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> cd defx#do_action('call', 'MyCD')
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> .. defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> I defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>defx.git
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>defx.icon
let g:defx_icons_enable_syntax_highlight = 1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> nerdtree-git-plugin
" 是否显示忽略文件 1- 显示 0- 不显示 默认 0
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" vim-material Oceanic
" let g:material_style='oceanic'
" set background=dark
" colorscheme vim-material

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> material.vim
if (has('termguicolors'))
  set termguicolors
endif
let g:material_theme_style = 'ocean'
colorscheme material
" colorscheme darkside

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> indentLine 缩进
let g:indent_guides_guide_size = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  tagbar 文件结构
let g:tagbar_width = 35
let g:tagbar_autofocus = 1
let g:tagbar_right = 1
nmap <F3> :TagbarToggle<CR>

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> vim-easymotion 快速跳转
let g:EasyMotion_smartcase = 1
nmap ss <Plug>(easymotion-s2)
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
"nmap <Leader><Leader>j <Plug>(easymotion-j)
"nmap <Leader><leader>h <Plug>(easymotion-linebackward)
"nmap <Leader><Leader>k <Plug>(easymotion-k)
"nmap <Leader><leader>l <Plug>(easymotion-lineforward)
"nmap <Leader><leader>s <Plug>(easymotion-s)
" 重复上一次操作, 类似repeat插件, 很强大
" map <Leader><leader>. <Plug>(easymotion-repeat)

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> coc.vim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>: coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> far.vim
let g:far#enable_undo = 1
let g:far#source = 'rg'

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> python-syntax
let g:python_highlight_all = 1

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> https://github.com/skywind3000/vim-terminal-help"
let g:terminal_key = '≠'
let g:terminal_height = 16
let g:terminal_list = 2048
tnoremap œ <c-\><c-n>
