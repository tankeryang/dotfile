" defx.vim
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
      \ 'winwidth': 40,
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


" defx.git
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


" defx.icon
let g:defx_icons_enable_syntax_highlight = 1