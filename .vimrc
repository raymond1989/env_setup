set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

syntax enable
syn on                  " 打开语法高亮
:set gfn=Menlo:h13
"colorscheme desert
:let g:zenburn_high_Contrast=0
:colors zenburn
let mapleader=","
set tabstop=2             " 设置tab键的宽度
set shiftwidth=2           " 换行时行间交错使用4个空格
set autoindent             " 自动对齐
set backspace=2           " 设置退格键可用
set expandtab
set smartindent            " 智能对齐方式
set ai!                   " 设置自动缩进
set nu!                   " 显示行号
set showmatch            " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set smartindent
set ruler                 " 在编辑过程中，在右下角显示光标位置的状态行
set incsearch              " 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
                        " 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
                        " 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
                        " 找要匹配的单词时，别忘记回车
set vb t_vb=             " vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set backupdir=/tmp "设置备份文件目录
set directory=/tmp "设置临时文件目录
set ignorecase "检索时忽略大小写
set hls "检索时高亮显示匹配项
set helplang=cn "帮助系统设置为中文

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠                
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"                            " 用空格键来开关折叠
"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
"""""""""""""设置开启ctags""""""""""""" 
set tags=tags; 
set autochdir
"refresh ctags
map <C-9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

"setup bundle
call pathogen#infect() 
"setup tagbar 
nmap <D-8> :TagbarToggle<CR> 
let g:tagbar_width=30                       "设置窗口宽度
" Open and close the NERD_tree.vim separately
"nmap <F7> <ESC>:NERDTreeToggle<RETURN>
map <D-7> :NERDTreeToggle <CR>
" 在文件浏览器中定位当前文件
 map <D-!> :NERDTreeFind <CR>
" 关闭文件时同时关闭文件浏览器
 "let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize=24

" 打开文件定位窗口
nnoremap <slient> <D-R> :CommandT<CR>
" " 打开最近打开的文件列表
nnoremap <slient> <D-E> :CommandTBuffer<CR>
" // The switch of the Source Explorer

nmap <D-3> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l 

"nmap <C-I> <C-W>j:call g:SrcExpl_Jump()<CR>
"nmap <C-O> :call g:SrcExpl_GoBack()<CR> 

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
" let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" //  create/update a tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>" 

" omnicppcomplete
"set nocp
"filetype plugin on
"set completeopt=menu 
"set tags+=~/.vim/cpp

"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

" complete ()
":inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
"":inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i

":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
      return "\<Right>"
  else
      return a:char
  endif
endfunction

"对NERD_commenter的设置
let NERDShutUp=1
filetype plugin on

" setting for cscope
if has("cscope")

              set csprg=/usr/local/bin/cscope

              set csto=0

              set cst

              set nocsverb

              " add any database in current directory

              if filereadable("cscope.out")

                  cs add cscope.out

              " else add database pointed to by environment

              elseif $CSCOPE_DB != ""

                  cs add $CSCOPE_DB

              endif

              set csverb

       endif
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>

    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>

    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>

    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>

    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

    nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"make
nmap <Leader>m :wa<CR>:make<CR>:cw<CR>
"copy to system clipboard
vnoremap <Leader>y "+y
"paste from system clipboard
nmap <Leader>p "+p

"clang_complete
let g:clang_auto_select=2
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=1
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_close_preview=1
"let g:clang_use_library=1
"let g:clang_library_path=
let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'

let g:neocomplcache_enable_at_startup = 1
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
  let g:clang_library_path=s:clang_library_path
endif
