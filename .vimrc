" nnoremap <c-j> J
nmap J 5j
nmap K 5k
nmap S :w<CR> 
nmap Q :q<CR> 
nmap R :source ~/.vimrc<CR>
let g:mapleader = " "

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set exrc secure " Enable project-specific .vimrc
set nocompatible
set number relativenumber 
set cursorline " Show a line under cursor
set showcmd " Show command at bottom
set shortmess+=I " Disable the default Vim startup message.
set wildmenu " Auto completion on command mode
set autochdir " Always execute command in current director
set scrolloff=10 " Always display top and bottom 5 lines
set timeoutlen=300 ttimeoutlen=0 " Reduce delay
set laststatus=2 " Always show the bottom statusline, even only 1 window open
set backspace=indent,eol,start " Change default backspace function, to make it more intuitive
set hidden
set ignorecase smartcase " Search ignore cases
set incsearch " Start search as you type
set hlsearch " Highlight search items
nnoremap <esc> :noh<return><esc> " Disable highlight after each search
set noerrorbells visualbell t_vb= " Disable error sounds
set mouse+=a " Enable mouse
" Cursor in insert mode: bar, normal mode: block
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20

" Vim-plug
call plug#begin('~/.vim/plugged')

" GUI enhancements
Plug 'psliwka/vim-smoothie'
"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jonathanfilip/vim-lucius'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter' " Find .git as fzf's search root

" Auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
"Plug 'rhysd/vim-clang-format'
" Taglist
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
" Error checking
"Plug 'w0rp/ale'
" Auto Complete
"Plug 'Valloric/YouCompleteMe'
" Undo Tree
"Plug 'mbbill/undotree/'
" Other visual enhancement
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'
" Git
"Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
"Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" HTML, CSS, JavaScript, PHP, JSON, etc.
"Plug 'elzr/vim-json'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
"Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
"Plug 'mattn/emmet-vim'
" Python
"Plug 'vim-scripts/indentpython.vim'
" Markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plug 'vimwiki/vimwiki'
" Bookmarks
"Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'tpope/vim-surround'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'junegunn/goyo.vim' " distraction free writing mode
"Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
"Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
" Dependencies
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'kana/vim-textobj-user'
"Plug 'fadein/vim-FIGlet'

" Browser plugin
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

" coc config
let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-pairs', 'coc-json', 'coc-vimlsp', 'coc-cmake',  'coc-snippets']
" having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=10
" don't pass messages to |ins-completion-menu|.
set shortmess+=c

"if has("patch-8.1.1564")
  "" Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  "set signcolumn=yes
"endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> and <tab> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Coc-vimlsp config
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" Coc-snippets config

""""""""""""""
"Other config"
""""""""""""""

" NERDTree config
map tt :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1

" lightline config
" let g:lightline = {'colorscheme': 'powerline', 'component_function': {'filename': 'FilenameForLightline', 'gitbranch': 'FugitiveHead'}}
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'FilenameForLightline',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction

" Color scheme
set background=dark
set termguicolors     " enable true colors support
set t_Co=256   " This is may or may not needed.
let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme base16-phd
"colorscheme base16-phd
"colorscheme base16-gruvbox-dark-hard
let g:lucius_style='dark'
let g:lucius_contrast='low'
let g:lucius_contrast_bg='high'
colorscheme lucius
"colorscheme xcodelighthc

" fzf config
nnoremap <c-t> :Files<cr>
nnoremap <c-f> :Buffers<cr>
nnoremap <c-s> :Rg<cr>

" syntastic config
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint', 'gcc']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ale
let g:ale_disable_lsp = 1 " Disable ale lsp, use coc's lsp instead

" vim-lsp-cxx-highlight
let g:lsp_cxx_hl_use_text_props = 1
