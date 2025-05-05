" Make tabs appear as 4 char wide.
set tabstop=4

" Enable syntax highlighting
syntax on

" Enables filetype detection, loads ftplugin, and loads indent
" (Not necessary on nvim and may not be necessary on vim 8.2+)
filetype plugin indent on

" Use CapsLock as Esc for less finger movements.
nnoremap <CapsLock> <Esc>
inoremap <CapsLock> <Esc>
vnoremap <CapsLock> <Esc>
cnoremap <CapsLock> <Esc>

" Set the leader key to space
let mapleader = " "

" Map <leader>em to comment/uncomment lines.
nnoremap <leader>em :.!elixir ~/.config/nvim/scripts/comment.exs<CR>
vnoremap <leader>em :!elixir ~/.config/nvim/scripts/comment.exs<CR>

" Map <leader>ea to tab-align line contents.
vnoremap <leader>ea :w !elixir ~/.config/nvim/scripts/align.exs<CR>

" Map <leader>eh to edit and expand html/heex syntax.
nnoremap <leader>et :.!hexp<CR>

" Map <leader>f to open the fuzzy file finder
nnoremap <leader>f :Files<CR>

" Map <leader>t to run Elixir tests
nnoremap <leader>t :!clear && mix test<CR>

" Map <leader>tp to run Python tests
nnoremap <leader>tp :!clear && uvx pytest<CR>

" Map <leader>tm to run Makefile tests
nnoremap <leader>tm :!clear && make test<CR>

" Map <leader>gf to format Go files
nnoremap <leader>gf :!gofmt -w .<CR>

set number
set relativenumber

" Required for syntax highlightinh of .heex files.
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" **Safe Letters for Custom Leader Key Mappings**
" These letters generally have no immediate default action in **normal mode**, making them ideal for custom mappings:
" 
" - `b`: Often used for "buffer" commands in plugins but safe for custom mappings if you’re not using those.
" - `d`: Can be repurposed for debugging or related tasks if you're okay avoiding default delete mappings.
" - `e`: Safe; commonly used for "execute" or "edit" mappings.
" - `f`: Safe; commonly used for "find" or "format" mappings.
" - `g`: Typically safe, but be mindful of built-in `g` commands (`gg`, `gw`, etc.).
" - `m`: Safe; useful for mapping "menu" or "manage."
" - `r`: Safe; often used for "run," "replace," or "reload."
" - `s`: Safe; commonly used for "save," "search," or similar operations.
" - `t`: Safe; often used for "test" or "toggle."
" - `u`: Safe; can be used for unique user-defined commands.
" - `z`: Safe for custom mappings; rarely conflicts unless using default fold commands (`zR`, `zM`, etc.).
"
" **Letters to Avoid in Normal Mode**
" Some letters have immediate or frequent built-in actions in normal mode and can conflict with custom mappings:
" 
" - `a`: Switches to insert mode ("append").
" - `c`: Starts change operations (e.g., `cw`, `cc`).
" - `d`: Deletes text when followed by a motion (e.g., `dw`, `dd`).
" - `i`: Switches to insert mode.
" - `o`: Opens a new line below the cursor.
" - `p`: Pastes text.
" - `q`: Starts recording a macro.
" - `x`: Deletes the character under the cursor.
" - `y`: Copies ("yanks") text.
" - `w`: Moves forward by a word.
" 
" **Special Cases**
" - `h`, `j`, `k`, `l` Reserved for movement and are best avoided unless you don’t use `hjkl` for navigation.
" - `g`: While generally safe, it’s part of some built-in commands like `gg`, `gw`, and `gu`. Use cautiously.
" - `z`: Used for folding (`zR`, `zM`, etc.), but if you don’t use folding, it’s safe to map.
" 
" **Best Practices**
" 1. **Choose meaningful mappings**:
"    - **`<leader>r`** for "run" commands.
"    - **`<leader>t`** for tests.
"    - **`<leader>s`** for scripts or saves.
"    - **`<leader>e`** for executing something.
" 
" 2. **Document your mappings**:
"    - Keep a comment in your `.vimrc` explaining what each mapping does to avoid confusion later.
" 
" 3. **Group by purpose**:
"    - Use logical groupings for mappings, such as `<leader>f` for file-related actions, `<leader>b` for buffers, etc.
"

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

call plug#end()
