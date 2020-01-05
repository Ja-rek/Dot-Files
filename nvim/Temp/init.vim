runtime! plugs.vim 

filetype plugin on
syntax on

"Color sheme
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set bg=dark

"AirLine
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"Extra
set relativenumber
set number
set cul
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul
set colorcolumn=120

"Aliases
cnoreabbrev clean e ++ff=dos

"HIE
set rtp+=~/.vim/pack/XXX/start/LanguageClient-neovim
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

let g:LanguageClient_serverCommands = {
    \ 'purescript': ['purescript-language-server', '--stdio'],
    \ 'haskell': ['hie-wrapper'],
    \ 'elm': ['elm-language-server'],
    \ }

"Paste
vnoremap p "_dP

"Custome auto complete
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap (; ();
inoremap {<CR> <CR>{<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"Coc auto completion framework
set cmdheight=2
set updatetime=300
set hidden


let g:LanguageClient_rootMarkers = {
  \ 'elm': ['elm.json'],
  \ }

"Deoplete
let g:deoplete#enable_smart_case = 1
""""let b:deoplete_disable_auto_complete = 0
let g:OmniSharp_timeout = 500
set completeopt=longest,menuone
let g:OmniSharp_want_snippet=1
""call deoplete#enable()
""call deoplete#custom#option('sources', {
""	  \ 'cs': ['omnisharp'],
""	  \})

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"

"Easy motion
nmap s <Plug>(easymotion-overwin-f)

"CamelCaseMotion
call camelcasemotion#CreateMotionMappings('<Leader>')
xmap <silent> <Leader>b <Plug>CamelCaseMotion_b

"Ranger
nnoremap <Leader>r :Ranger<CR>

"Ale
let g:ale_linters = { 'cs': ['OmniSharp'] }


let g:OmniSharp_server_stdio = 1
""let g:OmniSharp_server_stdio_quickload = 1

augroup omnisharp_commands
    autocmd!
    
    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
"nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>
