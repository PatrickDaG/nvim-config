" TODO:
" sooner:
" add vim-easymotion
" mappings for leader-menu
" add mappings for vim fugitive
" add multiple cursors
" add nerdcommenter binds
" add tabularizer
"
" later:
" remap coc
" mappings for fzf
"
" ╓───────────╖
" ║  General  ║
" ╙───────────╜

" Set maximum undo levels
set undolevels=1000000
" Persistent Undo
set undofile
set undodir=~/.local/share/nvim/undo

" command history length
set history=10000

" swap file save interval
set updatetime=300

" Allow to hide buffers with unsaved changes (e.g. closing the split)
set hidden

" Ignore *.o and *~ files in wildmenu
set wildignore=*.o,*~
" Only complete the longest common prefix and list all results.
" You can use the cursor keys to select an item in this list
set wildmode=list:full

" set case handling
set ignorecase
set smartcase

" ╓──────────────────╖
" ║  Editor visuals  ║
" ╙──────────────────╜

" Enable true color in terminals
set termguicolors
" set font
set guifont=FiraCode\ Nerd\ Font\ Mono:h10.5
" full mouse support
set mouse=a

" Do not wrap text longer than the window's width
set nowrap

" Show line numbers
set number relativenumber

" Keep 2 lines around the cursor.
set scrolloff=2
set sidescrolloff=2

" Set indentation of tabs to be equal to 4 spaces.
set tabstop=4
set shiftwidth=4
set softtabstop=4


" ╓────────────────────╖
" ║  Editing behavior  ║
" ╙────────────────────╜

" r = insert comment leader when hitting <Enter> in insert mode
" q = allow explicit formatting with gq
" j = remove comment leaders when joining lines if it makes sense
set formatoptions=rqj

" Allow the curser to be positioned on cells that have no actual character;
" Like moving beyond EOL or on any visual 'space' of a tab character
set virtualedit=all

" Do not include line ends in past the-line selections
set selection=old

" Use smart auto indenting for all file types
set smartindent

" Only wait 20 milliseconds for characters to arrive (see :help timeout)
set timeoutlen=20
set ttimeoutlen=20

" Disable timeout, set ttimeout (only timeout on keycodes)
set notimeout
set ttimeout

" replace grep with ripgrep
set grepprg=rg\ --vimgrep\ --smartcase\ --follow


" ╓────────────╖
" ║  Mappings  ║
" ╙────────────╜

nnoremap <Space> <NOP>
let mapleader=' '

" Remove Ctrl + U and Ctrl + W in insert mode (which did bad things)
inoremap  <nop>
inoremap  <nop>

" Scroll with cursor locked to file position
noremap <S-Down> 
noremap <S-Up> 
noremap! <S-Down> a
noremap! <S-Up> a

" Alt + arrow keys change the current window
noremap <M-Down> <Down>
noremap <M-Up> <Up>
noremap <M-Left> <Left>
noremap <M-Right> <Right>

" Alias fold to Shift + <Left>
map <S-Left> za

" Allow saving/reading of files as root
cmap w!! SudaWrite
cmap e!! SudaRead

" ╓───────────╖
" ║  Plugins  ║
" ╙───────────╜

" Auto install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
	                   \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/vim-plug')

" -------- Visuals --------

" Statusline
Plug 'vim-airline/vim-airline'
" Onedark Theme
Plug 'joshdick/onedark.vim'
" Icons in nerdtree and many other locations
Plug 'ryanoasis/vim-devicons'


" -------- Editing --------

" Motion marks
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'haya14busa/vim-easyoperator-phrase'
" Easy commenting
"Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'
" Easy parenthesis
Plug 'tpope/vim-surround'

" Highlight search string while entering it,
" plus easymotion compatibility plugin
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Automatic alignment
Plug 'junegunn/vim-easy-align'


" -------- Functional --------

" Write as sudo
Plug 'lambdalisue/suda.vim'
" File browser
Plug 'scrooloose/nerdtree'
" Nerdtree git integration
Plug 'Xuyuanp/nerdtree-git-plugin'
" Start screen
Plug 'mhinz/vim-startify'

" Git integration
Plug 'tpope/vim-fugitive'
" Show changed lines next to numbers
Plug 'airblade/vim-gitgutter'
" Undo history (mundo supports diff preview, undotree doesn't)
"Plug 'mbbill/undotree'
Plug 'simnalamburt/vim-mundo'

" Peek registers on usage
"Plug 'junegunn/vim-peekaboo'

" Fuzzy finder with a lot of possible applications
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Best completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use fzf for previews
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" Tagbar supporting LSP
Plug 'liuchengxu/vista.vim'


" -------- Syntax --------

" Show invalid whitespace
Plug 'ntpeters/vim-better-whitespace'
" Rainbow parenthesis
Plug 'luochen1990/rainbow'

" Better rust syntax
Plug 'rust-lang/rust.vim', {'for': 'rust'}
" Better python syntax
Plug 'vim-python/python-syntax', {'for': 'python'}
" Better C++ syntax
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
" Better latex syntax
Plug 'lervag/vimtex'
" CYP syntax highlighting
Plug 'HE7086/cyp-vim-syntax'
" Better markdown
Plug 'plasticboy/vim-markdown'
" haskell syntax highlighting
Plug 'neovimhaskell/haskell-vim'


" -------- coc extensions --------

" Install some coc extensions by default
let g:coc_global_extensions = [
	\ 'coc-clangd',
	\ 'coc-cmake',
	\ 'coc-highlight',
	\ 'coc-java',
	\ 'coc-json',
	\ 'coc-python',
	\ 'coc-rls',
	\ 'coc-tabnine',
	\ 'coc-texlab',
	\ ]

call plug#end()

filetype plugin indent on
syntax enable


" ╓───────────╖
" ║  General  ║
" ╙───────────╜

" Set color scheme
colorscheme onedark


" ╓───────────────────╖
" ║  Plugin: haskell  ║
" ╙───────────────────╜
"
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


" ╓───────────────────╖
" ║  Plugin: Airline  ║
" ╙───────────────────╜

" Airline settings
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'


" ╓────────────────────╖
" ║  Plugin: NERDTree  ║
" ╙────────────────────╜

" Delete buffers for files deleted with NERDTree
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1

" Open NERDTree and Startify automatically if no arguments are given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if !argc() && !exists("s:std_in") | Startify | wincmd w | endif

" Mappings
nnoremap <leader>t :NERDTreeToggle<Enter>
nnoremap <silent> <leader>T :NERDTreeFind<CR>


" ╓────────────────────╖
" ║  Plugin: Startify  ║
" ╙────────────────────╜

" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
	let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
	let bookmarks = bookmarks[0:-2] " Slices an empty last line
	return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

" Returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
	let files = systemlist('git ls-files -m 2>/dev/null')
	return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
	let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
	return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Set file lists
let g:startify_lists = [
	\ { 'type': function('s:gitModified'),       'header': ['   Git Modified']},
	\ { 'type': function('s:gitUntracked'),      'header': ['   Git Untracked']},
	\ { 'type': 'dir',                           'header': ['   Recent in '. getcwd()]},
	\ { 'type': 'files',                         'header': ['   Recent']},
	\ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
	\ { 'type': 'sessions',                      'header': ['   Sessions']},
	\ { 'type': 'bookmarks',                     'header': ['   Bookmarks']},
	\ { 'type': 'commands',                      'header': ['   Commands']},
	\ ]

" Custom commands
let g:startify_commands = [
	\ { 'c':  ['Check health', ':checkhealth']},
	\ { 'ps': ['Plug status', ':PlugStatus']},
	\ { 'pu': ['Plug update', ':PlugUpdate | PlugUpgrade']},
	\ { 'cu': ['Update coc plugins', ':CocUpdate']},
	\ ]

" Startify file icons
function! StartifyEntryFormat()
	return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" Change highlight links for better colors
hi link StartifyBracket Comment
hi link StartifyFile    Directory
hi link StartifyFooter  Comment
hi link StartifyHeader  Comment
hi link StartifyNumber  Number
hi link StartifyPath    Normal
hi link StartifySection Title
hi link StartifySelect  Statement
hi link StartifySlash   Comment
hi link StartifySpecial Identifier
hi link StartifyVar     StartifyPath


" ╓─────────────────╖
" ║  Plugin: Mundo  ║
" ╙─────────────────╜

" Reduce window width a little bit
let g:mundo_width = 40
" Show the diff on the bottom to increase available space
let g:mundo_preview_bottom = 1
" Reduce preview delay to 200ms to gain a bit responsiveness
let g:mundo_auto_preview_delay = 200

" Mappings
nmap <leader>u :MundoToggle<CR>


" ╓───────────────╖
" ║  Plugin: FzF  ║
" ╙───────────────╜

" Define some actions
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit' }

" Default fzf layout
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors = {
	\ 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Comment'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment']
	\ }

" Allow opening files in multiple buffers
let g:fzf_buffers_jump = 0

" Set bat theme to ansi colors, which will basically respect the current colorscheme
let $BAT_THEME='ansi'


" Mappings
nnoremap <silent> <leader>s :Files<CR>
nmap <TAB> :Buffers<CR>
nmap <leader>c :Commands<CR>
"nmap <leader>t :BTags<CR>
nmap <leader>? :Rg<CR>
nmap <leader>gb :BCommits<CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>/ :History/<CR>
nmap <leader>: :History:<CR>
":Files [PATH]     Files (runs $FZF_DEFAULT_COMMAND if defined)
":GFiles [OPTS]    Git files (git ls-files)
":GFiles?          Git files (git status)
":Buffers          Open buffers
":Colors           Color schemes
":Ag [PATTERN]     ag search result (ALT-A to select all, ALT-D to deselect all)
":Rg [PATTERN]     rg search result (ALT-A to select all, ALT-D to deselect all)
":Lines [QUERY]    Lines in loaded buffers
":BLines [QUERY]   Lines in the current buffer
":Tags [QUERY]     Tags in the project (ctags -R)
":BTags [QUERY]    Tags in the current buffer
":Marks            Marks
":Windows          Windows
":Locate PATTERN   locate command output
":History          v:oldfiles and open buffers
":History:         Command history
":History/         Search history
":Snippets         Snippets (UltiSnips)
":Commits          Git commits (requires fugitive.vim)
":BCommits         Git commits for the current buffer
":Commands         Commands
":Maps             Normal mode mappings
":Helptags         Help tags 1
":Filetypes        File types


" ╓───────────────────╖
" ║  Plugin: Rainbow  ║
" ╙───────────────────╜

" Enable rainbow parenthesis
let g:rainbow_active = 1

" Configure color settings
let g:rainbow_guifgs = ['#cc9c66', '#6695cc', 'firebrick', '#54a5a8']

" Set global configuration
" Disable rainbow parenthesis for the nerdtree window, Mundo, fzf windows,
" and for cmake where it doesn't work
let g:rainbow_conf = {
	\ 'guifgs': g:rainbow_guifgs,
	\ 'separately': {
	\     'nerdtree': 0,
	\     'cmake': 0,
	\     'fzf': 0,
	\     'Mundo': 0,
	\ }}


" ╓─────────────────────╖
" ║  Plugin: incsearch  ║
" ╙─────────────────────╜

" Use incsearch as default search
"map / <Plug>(incsearch-forward)

" Use ? as combined fuzzy and fuzzyspell search instead of useless backward search
map <silent><expr> ? incsearch#go(<SID>config_fuzzyall())

function! s:config_fuzzyall(...) abort
	return extend(copy({
		\     'converters': [
		\         incsearch#config#fuzzy#converter(),
		\         incsearch#config#fuzzyspell#converter()
		\     ],
		\ }), get(a:, 1, {}))
endfunction


" ╓──────────────────────────╖
" ║  Plugin: vim-easymotion  ║
" ╙──────────────────────────╜

" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Use easier to reach keys first and some easy ones last for grouping
let g:EasyMotion_keys = 'asdqweyxcrfvtgbzhnujmikol'
" Use smartcase for easymotion keys for easier typing
let g:EasyMotion_smartcase = 1

" Move to {char}
map  xa <Plug>(easymotion-bd-f)
nmap xa <Plug>(easymotion-overwin-f)

" Move to {char}{char}
map  xs <Plug>(easymotion-bd-f2)
nmap xs <Plug>(easymotion-overwin-f2)

" Move to line
map  xx <Plug>(easymotion-bd-jk)
nmap xx <Plug>(easymotion-overwin-line)

" Move to word
map  xw <Plug>(easymotion-bd-w)
nmap xw <Plug>(easymotion-overwin-w)

" Move to search
map  x/ <Plug>(easymotion-sn)
omap x/ <Plug>(easymotion-tn)

" Search and move
noremap <silent><expr> x/ incsearch#go(<SID>incsearch_config())

function! s:incsearch_config(...) abort
	return incsearch#util#deepextend(deepcopy({
		\     'modules': [incsearch#config#easymotion#module({'overwin': 1})],
		\     'keymap': {"\<CR>": '<Over>(easymotion)'},
		\     'is_expr': 0
		\ }), get(a:, 1, {}))
endfunction

" Use x? as combined fuzzy and fuzzyspell search instead of useless backward search
noremap <silent><expr> x? incsearch#go(<SID>config_easyfuzzymotion())

function! s:config_easyfuzzymotion(...) abort
	return extend(copy({
		\     'converters': [
		\         incsearch#config#fuzzy#converter(),
		\         incsearch#config#fuzzyspell#converter()
		\     ],
		\     'modules': [incsearch#config#easymotion#module({'overwin': 1})],
		\     'keymap': {"\<CR>": '<Over>(easymotion)'},
		\     'is_expr': 0
		\ }), get(a:, 1, {}))
endfunction


" ╓─────────────────────────────╖
" ║  Plugin: better-whitespace  ║
" ╙─────────────────────────────╜

" Add mapping to strip trailing whitespace
nnoremap <leader>$ :StripWhitespace<CR>


" ╓─────────────────────────╖
" ║  Plugin: NERDCommenter  ║
" ╙─────────────────────────╜

" Don't create default mappings
let g:NERDCreateDefaultMappings = 0
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Trim trailing whitespace after uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Custom delimiters for some languages
let g:NERDCustomDelimiters = {
	\ 'haskell': { 'left': '--', 'leftAlt': '{-', 'rightAlt': '-}' },
	\ 'cyp': { 'left': '--', 'leftAlt': '{-', 'rightAlt': '-}' },
	\ }

" Toggle with preceding space
nmap ## <plug>NERDCommenterToggle
xmap ## <plug>NERDCommenterToggle

" Comment lines
nmap #+ <plug>NERDCommenterComment
xmap #+ <plug>NERDCommenterComment

" Uncomment lines
nmap #' <plug>NERDCommenterUncomment
xmap #' <plug>NERDCommenterUncomment

" Invert comments
nmap #~ <plug>NERDCommenterInvert
xmap #~ <plug>NERDCommenterInvert

" Nested commenting
nmap #n <plug>NERDCommenterNested
xmap #n <plug>NERDCommenterNested

" Comment to EOL
nmap #$ <plug>NERDCommenterToEOL


" ╓──────────────────────────╖
" ║  Plugin: vim-easy-align  ║
" ╙──────────────────────────╜

" Start interactive EasyAlign in visual mode (e.g. vip<leader>a)
xmap <leader>a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <leader>aip)
nmap <leader>a <Plug>(EasyAlign)


" ╓───────────────╖
" ║  Plugin: coc  ║
" ╙───────────────╜

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab to trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <C-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Enter should always accept a completion, even if it already has been
" inserted by C-n or C-p. This is desirable because there are coc callbacks
" that do additional stuff on selection (e.g. insert parenthesis after functions),
" so the user expects <CR> to do something and not to insert a line break,
" but ONLY if something has been selected in the menu.
" Additionally, `<C-g>u` will break the undo chain.
inoremap <expr> <cr> pumvisible() && coc#rpc#request('hasSelected', []) ? "\<C-y>" : "\<C-g>u\<CR>"

" When completing, Up and Down keys should insert the current match while
" moving through the popup list
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "<Up>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "<Down>"

" Navigate diagnostics
nmap <silent> <space>, <plug>(coc-diagnostic-prev)
nmap <silent> <space>. <plug>(coc-diagnostic-next)

" Goto code navigation.
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Symbol renaming.
nmap <space>r <plug>(coc-rename)

" Formatting selected code.
xmap <space>f <plug>(coc-format-selected)
nmap <space>f <plug>(coc-format)

" Applying codeAction to the selected region.
" Example: `<space>aap` for current paragraph
" xmap <space>a <plug>(coc-codeaction-selected)
" nmap <space>a <plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <space>ac <plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <space>q <plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <plug>(coc-funcobj-i)
omap if <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap af <plug>(coc-funcobj-a)
xmap ic <plug>(coc-classobj-i)
omap ic <plug>(coc-classobj-i)
xmap ac <plug>(coc-classobj-a)
omap ac <plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <plug>(coc-range-select)
xmap <silent> <C-s> <plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Choose distinctive color for cursor text highlighting
hi CocHighlightText guibg=#2a5e9b


" ╓───────────────────╖
" ║  Plugin: coc-fzf  ║
" ╙───────────────────╜

" Make coc-fzf look like normal fzf
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" Mappings
nnoremap <silent> <space><tab>   :<C-u>CocFzfList<CR>
nnoremap <silent> <space><space> :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>:       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>y       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>
"actions
"folders
"links
"lists
"services
"sources


" ╓─────────────────╖
" ║  Plugin: vista  ║
" ╙─────────────────╜

nmap <leader>v :Vista<CR>

" Don't stay in the vista window, but return to
" the buffer from where it was opened
let g:vista_stay_on_open = 0
" Don't blink the cursor when jumping
let g:vista_blink = [0, 0]
let g:vista_top_level_blink = [0, 0]

" By default use ctags as provider
let g:vista_default_executive = 'coc'
" Override executives for some filetypes
"let g:vista_executive_for = {
"	\   'python': 'coc',
"	\ }
" Enable fzf preview window
let g:vista_fzf_preview = ['right:50%']
" Enable icons
let g:vista#renderer#enable_icon = 1
" Set better indenting icons
let g:vista_icon_indent = ['└ ', '│ ']
" Fallback to ctags
let g:vista_finder_alternative_executives = ['ctags']

" Custom ctags generation commands for certain filetypes.
let g:vista_ctags_cmd = {
	\ 'haskell': 'hasktags -x -o - -c',
	\ }
