source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" ��ֹ���������ļ�
set noundofile
set nobackup  "������
set noswapfile  "��ֹ������ʱ�ļ�

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

" ����˵�����������
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language message zh_CN.UTF-8
set fileencodings=utf-8,gb18030,ucs-bom,cp936,gb2312,big5,euc-jp,latin1
set termencoding=utf-8,gb18030,ucs-bom,cp936,gb2312,big5,euc-kr,latin1

set syntax=on
set showmatch  "������ʾƥ�������
set autochdir
set ignorecase smartcase
set showmode
set number  "��ʾ�к�
set guifont=Courier_New:h10:cANSI  "��������
set showcmd
set nocompatible
set foldenable  "�����۵�
set foldmethod=manual  "�ֶ��۵�
set completeopt=preview,menu  "���벹ȫ

set ruler  "��״̬�����
set cursorline  "ͻ����ʾ��ǰ��
set tabstop=4 "Tap���Ŀ��
set magic  "����������ʽ
set autoindent  "�̳�ǰһ�е��Զ�����
set softtabstop=4  "ͳһ����Ϊ4
set shiftwidth=4

filetype on

if has("gui_running")
	set guioptions=m  "�رղ˵���
	set guioptions=t  "�رչ�����
	set guioptions=L  "������ߵĹ�����
	set guioptions+=r  "�����ұߵĹ�����
	set guioptions+=b  "�����±ߵĹ�����
	set guioptions +=unnamed  "������а�
endif

""" �������
filetype plugin on
" ��winmanager.vim�е�ToggleWindowsManager����endǰ���� exec 'q'
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
