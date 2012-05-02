" Alan's Vim configuration.
" Symlinked 
"   ln -nfs /vim .vim
" 	ln -nfs /vim/gvimrc .gvimrc
"	  ln -nfs /vim/vimrc .vimrc

set nocompatible                  " Must come first because it changes other options.

" ########################   My settings  ############################

let mapleader=","                 " Change the leader ky from \ to , 

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.
set ofu=syntaxcomplete#Complete   " Turn on omni complete

set background=dark               " set default background
let g:solarized_termcolors=256    " required for solarised in terminal 
colorscheme solarized             " set color scheme
set colorcolumn=81                " Color column

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
" Redraws the screen to removes any search highlighting then signs
nnoremap <silent> <C-l> :nohl<cr> :SignClearAll<cr>


set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

"set cmdheight=2                   " set command windows height

set cursorline                    " highlight current line

au BufRead,BufNewFile *.hdr,*.bdy,*.vw 		setfiletype plsql   " Add  oracle plsql files

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" menu mapping
map <leader>m :set guioptions+=m<cr>
map <leader>mm :set guioptions-=m<cr>

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" File opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>
map <Leader>f :FufFile<cr>
map <Leader>b :FufBuffer<cr>
map <Leader>fh :FufHelp<cr>
map <Leader>bw :FufBufferTagWithCursorWord<cr>
map <Leader>t :FufTag<cr>
map <Leader>tw :FufTagWithCursorWord<cr>
map <Leader>tf :FufTaggedFile<cr>

" quickfix window
map <Leader>q :copen<cr>
map <Leader>qq :cclose<cr>

" PeepOpen mappings 
"map <leader>po :PeepOpen<cr>

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" set search file/dirs to ignore
let Grep_Skip_Dirs = 'CVS .svn .git out bin target'
"set wildignore+=tmp\*,out\*,bin\*,target\*,.metadata\*,.settings\*,.svn\*,.git\*,*.o,*.obj,.git,.classpath,*.class,*.jar,*.ear,*.war,*.dll
"map <Leader>s :vimgrep //gj C:\Strategy\**\*.{java,hdr,bdy,xml,properties}
"map <Leader>s :Ack --java --html --xml --ignore-dir=out --ignore-dir=target "%" "C:\Strategy\Java"
map <Leader>s :Ack --ignore-dir=out --ignore-dir=target "text" "dir"
map <Leader>sr :%s///gc 
" replace grep with ack
"set grepprg=ack 

" NerdTree mappings 
map <leader>n :NERDTreeToggle<cr>
map <leader>nn :NERDTreeFind<cr>
set autochdir
let NERDTreeChDirMode=2
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=80 
let g:NERDTreeQuitOnOpen=1          "Quit after opening a file

" ctags and windows
map <leader>l :TlistToggle<cr>
let Tlist_WinWidth = 50
map <leader>o :TagbarToggle<cr>
let g:tagbar_width = 50
let g:tagbar_autofocus = 1          " focus on open
let g:tagbar_autoclose = 1          " close on method select
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

" ctags
set tags+=tags;/                          " got back dir tree until you find a tags file
autocmd FileType java set tags+=$JAVA_HOME/src/tags,$PLAY_HOME/framework/src/tags
autocmd FileType scala set tags+=$SCALA_HOME/src/tags 
" Reuild tags for everything under pwd
map <F10> :!ctags -R -f tags --langmap=sql:+.hdr.bdy.vw --fields=+iaS --extra=+q --exclude=out --exclude=bin --exclude=target --exclude=.svn --exclude=.git <cr>

" Add  oracle plsql files
au BufRead,BufNewFile *.hdr,*.bdy,*.vw 		setfiletype plsql 

" eclim 
autocmd FileType java nnoremap <silent> <buffer> <leader>ji :JavaImport<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>jd :JavaDocSearch -x declarations<cr>
autocmd FileType java nnoremap <silent> <buffer> <leader>js :JavaSearchContext<cr>
inoremap <C-Space> <C-x><C-u>

" ctrlp
"let g:ctrlp_max_height = 30
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_dotfiles = 0
let g:ctrlp_root_markers = ['.root']
let g:ctrlp_custom_ignore = {
  \ 'dir':  'out$\|bin$\|target$\|tmp$', 
  \ 'file': '.exe$\|.dll$\|.class$\|.jar$\|.ear$\|.war$\|tags$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                        \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

