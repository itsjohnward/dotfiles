#!/bin/sh
set -e

echo "Installing neovim..."
# Download latest pre-built Neovim release and extract to /usr/local
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT
ASSET="nvim-linux-x86_64.tar.gz"
URL="https://github.com/neovim/neovim/releases/latest/download/${ASSET}"
echo "Downloading Neovim from $URL"
curl -fsSL -o "$TMPDIR/$ASSET" "$URL"
sudo tar -xzf "$TMPDIR/$ASSET" -C /usr/local --strip-components=1
# Make sure traditional commands point to neovim
sudo ln -sf /usr/local/bin/nvim /usr/local/bin/vim
sudo ln -sf /usr/local/bin/nvim /usr/local/bin/vi
sudo ln -sf /usr/local/bin/nvim /usr/local/bin/editor

echo "Neovim installed to /usr/local"

# Set up vim plugins
mkdir -p ~/.config/nvim

cat > ~/.config/nvim/init.vim << 'EOF'
" Install vim-plug if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Telescope - fuzzy finder (using latest stable)
" Note: For specific version compatibility, you can pin to a tag like: { 'tag': '0.1.x' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" ALE - Linting
Plug 'dense-analysis/ale'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Git integration
Plug 'tpope/vim-fugitive'

" Avante/CodeCompanion - AI code assistance (optional, requires additional setup)
" Plug 'avante-nvim/avante.nvim'

call plug#end()

" Telescope keybindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ALE configuration
" Note: Install linters/fixers separately (e.g., npm i -g eslint prettier, pip install black flake8)
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['flake8', 'pylint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1

" Tmux navigator configuration
let g:tmux_navigator_no_mappings = 0
EOF

echo "Neovim configured with plugins. Run ':PlugInstall' in neovim to install plugins."
