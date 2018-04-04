source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" 禁止生成其他文件
set noundofile
set nobackup  "不备份
set noswapfile  "禁止生成临时文件

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" 解决菜单栏乱码问题
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language message zh_CN.UTF-8
set fileencodings=utf-8,gb18030,ucs-bom,cp936,gb2312,big5,euc-jp,latin1
set termencoding=utf-8,gb18030,ucs-bom,cp936,gb2312,big5,euc-kr,latin1

set syntax=on
set showmatch  "高亮显示匹配的括号
set autochdir
set ignorecase smartcase
set showmode
set number  "显示行号
set guifont=Courier_New:h10:cANSI  "设置字体
set showcmd
set nocompatible
set foldenable  "允许折叠
set foldmethod=manual  "手动折叠
set completeopt=preview,menu  "代码补全

set ruler  "打开状态栏标尺
set cursorline  "突出显示当前行
set tabstop=4 "Tap键的宽度
set magic  "设置正则表达式
set autoindent  "继承前一行的自动缩进
set softtabstop=4  "统一缩进为4
set shiftwidth=4

filetype on

if has("gui_running")
	set guioptions=m  "关闭菜单栏
	set guioptions=t  "关闭工具栏
	set guioptions=L  "启动左边的滚动条
	set guioptions+=r  "启动右边的滚动条
	set guioptions+=b  "启动下边的滚动条
	set guioptions +=unnamed  "共享剪切板
endif

""" 插件管理
filetype plugin on
" 在winmanager.vim中的ToggleWindowsManager函数end前加入 exec 'q'
let g:NERDTree_title='NERD Tree'
let g:winManagerWindowLayout='NERDTree|TagList'
nmap wm :WMToggle<cr>

"" NERDTree
function NERDTree_Start()
	exec 'NERDTree'
endfunction

function NERDTree_IsValid()
	return 1
endfunction

"" AsyncRun
let $PYTHONUNBUFFERED=1

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
