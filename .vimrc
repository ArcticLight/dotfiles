" Indicate that vim should run our plugins and always use syntax highlighting for all identified file types
set nocompatible | filetype indent plugin on | syn on

set omnifunc=syntaxcomplete#Complete

" set the hybrid color scheme for vim running in the terminal window
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" define some commands for wrapping and not wrapping a line or paragraph
command Wrap set textwidth=120
command NoWrap set textwidth=0>

" Make sure that you can load the dot files when you are searching the file system
let g:ctrlp_show_hidden = 1

" Ignore these directories in all programs like ctrlp
set wildignore+=*/build/**
set wildignore+=*/.git/*
set wildignore+=*.class
set wildignore+=*/tmp/*

" change the mapleader from \ to , -- this makes it easier to perform compilation in LaTeX 
let maplocalleader=","

" VAM is a plugin management system for Vim and it is one of the ones that I will demonstrate the use of
       fun! EnsureVamIsOnDisk(plugin_root_dir)
          " windows users may want to use http://mawercer.de/~marc/vam/index.php
          " to fetch VAM, VAM-known-repositories and the listed plugins
          " without having to install curl, 7-zip and git tools first
          " -> BUG [4] (git-less installation)
          let vam_autoload_dir = a:plugin_root_dir.'/vim-addon-manager/autoload'
          if isdirectory(vam_autoload_dir)
            return 1
          else
            if 1 == confirm("Clone VAM into ".a:plugin_root_dir."?","&Y\n&N")
              " I'm sorry having to add this reminder. Eventually it'll pay off.
              call confirm("Remind yourself that most plugins ship with ".
                          \"documentation (README*, doc/*.txt). It is your ".
                          \"first source of knowledge. If you can't find ".
                          \"the info you're looking for in reasonable ".
                          \"time ask maintainers to improve documentation")
              call mkdir(a:plugin_root_dir, 'p')
              execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.
                          \       shellescape(a:plugin_root_dir, 1).'/vim-addon-manager'
              " VAM runs helptags automatically when you install or update 
              " plugins
              exec 'helptags '.fnameescape(a:plugin_root_dir.'/vim-addon-manager/doc')
            endif
            return isdirectory(vam_autoload_dir)
          endif
        endfun

        fun! SetupVAM()
          " Set advanced options like this:
          " let g:vim_addon_manager = {}
          " let g:vim_addon_manager.key = value
          "     Pipe all output into a buffer which gets written to disk
          " let g:vim_addon_manager.log_to_buf =1

          " Example: drop git sources unless git is in PATH. Same plugins can
          " be installed from www.vim.org. Lookup MergeSources to get more control
          " let g:vim_addon_manager.drop_git_sources = !executable('git')
          " let g:vim_addon_manager.debug_activation = 1

          " VAM install location:
          let c = get(g:, 'vim_addon_manager', {})
          let g:vim_addon_manager = c
          let c.plugin_root_dir = expand('$HOME/.vim/vim-addons', 1)
          if !EnsureVamIsOnDisk(c.plugin_root_dir)
            echohl ErrorMsg | echomsg "No VAM found!" | echohl NONE
            return
          endif
          let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'

          " Tell VAM which plugins to fetch & load -- this is a long list! -- scroll to the right to see them all!
      	  call vam#ActivateAddons(["FuzzyFinder", "SuperTab%182", "The_NERD_Commenter", "tComment", "LaTeX_Box", "Bookmarking", "vim-signature", "fugitive", "csv", "vimproc", "SQLComplete"], {'auto_install' : 0})
          " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})

          " Addons are put into plugin_root_dir/plugin-name directory
          " unless those directories exist. Then they are activated.
          " Activating means adding addon dirs to rtp and do some additional
          " magic

          " How to find addon names?
          " - look up source from pool
          " - (<c-x><c-p> complete plugin names):
          " You can use name rewritings to point to sources:
          "    ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
          "    ..ActivateAddons(["github:user/repo", .. => github://user/repo
          " Also see section "2.2. names of addons and addon sources" in VAM's documentation
        endfun
        call SetupVAM()
        " experimental [E1]: load plugins lazily depending on filetype, See
        " NOTES
        " experimental [E2]: run after gui has been started (gvim) [3]
        " option1:  au VimEnter * call SetupVAM()
        " option2:  au GUIEnter * call SetupVAM()
        " See BUGS sections below [*]
        " Vim 7.0 users see BUGS section [3]

" Setting up Vundle -- the vim plugin bundler -- and another plugin management tool that I will demonstrate
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    " Add any bundles that you want to install to this location
	Bundle 'https://github.com/yuratomo/gmail.vim.git'
	Bundle 'https://github.com/altercation/vim-colors-solarized.git'
	Bundle 'https://github.com/vim-scripts/Xoria256m.git'
	Bundle 'https://github.com/scrooloose/nerdtree.git'
	Bundle 'https://github.com/vim-scripts/dbext.vim.git'
	Bundle 'https://github.com/kien/ctrlp.vim.git'
	Bundle 'https://github.com/xolox/vim-misc.git'
	Bundle 'https://github.com/xolox/vim-session.git'
	Bundle 'https://github.com/majutsushi/tagbar'
	Bundle 'https://github.com/gerw/vim-latex-suite.git'
	Bundle 'https://github.com/gregsexton/gitv.git'
	" Bundle 'https://github.com/mhinz/vim-startify.git'

	" I found that this plugin seemed to slow down the screen redraws and thus I no longer use it
	" Bundle 'https://github.com/airblade/vim-gitgutter.git'

	" if iCanHazVundle == 0
    "     echo "Installing Bundles, please ignore key map error messages"
    "     echo ""
    "     :BundleInstall
    " endif

" Latex Box Plugin that is useful for editing LaTeX in Vim
let g:LatexBox_latexmk_options="-pdf"
let g:LatexBox_output_type="pdf"
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -pdf -pvc $*'
let g:Tex_DefaultTargetFormat='pdf'
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""
let g:LatexBox_autojump=1

" Add some configurations for SuperTab182 to support tab completion is git
" commit messages and with many other types of files. You have to say which one you want to use in some situations,
" though.  Note that we use SuperTab for different types of tab completion -- Java, LaTeX, others
let g:SuperTabDefaultCompletionType = "<c-x><c-u>,<c-x><c-o>"

" note that menu provides a substantially better configuration for viewing
" the autocompletion output that is available in gvim
set cot=menu

" Adding in a bunch of additional commands from: 
" http://nvie.com/posts/how-i-boosted-my-vim/  

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000  " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set pastetoggle=<F2> " allow vim to paste a large amount of source code or tex

" ULtimately, I decided that it was better for us to not use this feature by default
"set hidden        " allow a new buffer to be opened even if current one is not saved

" do not prompt to save for the session management each time
let g:session_autosave = 'no'

" to use the sessions program, you need to uncomment this line and change it to something in your home account
" let g:session_directory = '/home/gkapfham/.vim/sessions'

" database connections for work with ShemaAnalyst and different database
" applications (e.g., TweetComplete) 

" SQLite
let g:dbext_default_profile_sqlite_customer = 'type=SQLITE:dbname=/home/gkapfham/working/databases/customer.db'
let g:dbext_default_profile_sqlite_tweetcomplete_testing = 'type=SQLITE:dbname=/home/gkapfham/working/software/TweetComplete/databases/tweetcomplete-testing.db'
let g:dbext_default_profile_sqlite_tweetcomplete = 'type=SQLITE:dbname=/home/gkapfham/working/software/TweetComplete/databases/tweetcomplete.db'

" turn on spell checking so that I can do this for Latex documents
"set spell spelllang=en_us
"set mousemodel=popup


" --> My Edit - Nope: Do none of these things. I don't like spellcheck,
"  it tends to make source code a red highlighted mess.
" turn of spell checking for some types of buffers, mostly Java and other
" programming languages
"au BufNewFile,BufRead,BufEnter *.c      set nospell
"au BufNewFile,BufRead,BufEnter *.h      set nospell
"au BufNewFile,BufRead,BufEnter *.cpp    set nospell
"au BufNewFile,BufRead,BufEnter *.hpp    set nospell
"au BufNewFile,BufRead,BufEnter *.java   set nospell
"au BufNewFile,BufRead,BufEnter *.sh     set nospell
"au BufNewFile,BufRead,BufEnter *.xml     set nospell
"au BufNewFile,BufRead,BufEnter *.sql     set nospell

" Give a special key for turning on and off the Tagbar, a great feature for browsing source code, such as Java programs
nmap <F12> :TagbarToggle<CR>

" Stop vim from redrawing the screen during complex operations, supposed to make the user interface much smoother, let's try!
set lazyredraw
set nocursorcolumn
set nocursorline
syntax sync minlines=256

" Make the source code history browsing feature open windows horizontally, as this supports better browsing
let g:Gitv_OpenHorizontal=1

" set the status line to contain additional information (displayed during
" save, etc)
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

" Do not display the welcome message / splash screen when opening gvim or vim
" with no specified file
set shortmess=I

" This plugin seems to cause screen redraws to progress slowly, so I am no longer using it
" let g:gitgutter_sign_column_always=1

" " some additional settings for the use of CTRLP -- I found that there was an
" easier and better way to do this and thus I no longer need these code segments
" runtime! plugin/ctrlp.vim
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git/|\bin/|\build/|/tmp/',
"   \ 'file': '\.*$\'
"   \ }
"

" extra commands that are not needed for CTRLP and reloading the vimrc file

" set wildignore+=*/bin/**

"set wildignore+=.*
" do not use a cache for ctrlp
"let g:ctrlp_use_caching = 0
"let g:ctrlp_dotfiles = 0

" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\build$\|\bin$\|\tmp$',
"   \ }
" 
" seems to do kinda strange things, but it works, unsafe for right now.

" command Reload :so! $MYVIMRC

" These features are no longer needed with the current configuration of eclim in Vim
" disable the extra menu at the top of the screen in eclim autocomplete
" this makes it significantly faster to display autocompletions in gvim!

" this flag enables you to open other files even if the current one is not
" saved this is a very important feature for me to use regularly

"set cot-=preview




