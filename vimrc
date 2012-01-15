" Alan's Vim configuration.
" Symlinked 
"   ln -nfs /vim .vim
" 	ln -nfs /vim/gvimrc .gvimrc
"	  ln -nfs /vim/vimrc .vimrc

set nocompatible                  " Must come first because it changes other options.

let mapleader=","                 " Change the leader ky from \ to , for macbook keyboard

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

set cmdheight=2                   " set command windows height

set cursorline                    " highlight current line

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

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
map <Leader>ff :FufFile<cr>
map <Leader>fb :FufBuffer<cr>
map <Leader>ft :FufTag<cr>

" PeepOpen mappings 
nmap <silent> <c-o> :PeepOpen<cr>:   

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;
"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
"autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" NerdTree mappings 
map <leader>nn :NERDTreeToggle<cr>
set autochdir
let NERDTreeChDirMode=2
let g:NERDTreeWinPos = "left"

" ctags and windows
let Tlist_WinWidth = 50
map <leader>ll :TlistToggle<cr>
let Tagbar_WinWidth = 50
map <leader>bb :TagbarToggle<cr>

set tags+=tags;/            " got back dir tree until you find a tags file
"autocommand FileType java set tags+=$HOME/.vim/tags/java.ctags
"autocommand FileType scala set tags+=$HOME/.vim/tags/scala.ctags
"map <F8> :$HOME/tags -R --java-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <F9> :$HOME/tags -R --scala-kinds=+p --fields=+iaS --extra=+q .<CR>
