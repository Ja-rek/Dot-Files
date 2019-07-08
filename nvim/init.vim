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

"Deoplete
let g:deoplete#enable_smart_case = 1
let b:deoplete_disable_auto_complete = 1

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
