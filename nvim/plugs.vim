
call plug#begin()

	Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
"	Plug 'alexbyk/vim-ultisnips-react'

	Plug 'OmniSharp/omnisharp-vim', { 'for': [ 'cs', 'csproj', 'sln', 'cshtml' ]  }
	Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
	Plug 'https://gitlab.com/mixedCase/deoplete-omnisharp.git', { 'for': [ 'cs', 'csproj', 'sln', 'cshtml' ] }
	Plug 'w0rp/ale', { 'for': [ 'cs', 'csproj', 'sln', 'cshtml' ] }
	Plug 'SirVer/ultisnips', { 'for': [ 'cs', 'csproj', 'sln', 'cshtml' ] }

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

	Plug 'tpope/vim-dispatch'
        Plug 'francoiscabrol/ranger.vim'
        Plug 'rbgrouleff/bclose.vim'
	Plug 'honza/vim-snippets'
	Plug 'bkad/CamelCaseMotion'
	Plug 'morhetz/gruvbox'
        Plug 'vim-airline/vim-airline'
        Plug 'easymotion/vim-easymotion'

call plug#end()
