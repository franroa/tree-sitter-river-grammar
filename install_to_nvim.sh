#!/bin/bash

# Install updated River parser to Neovim
echo "Installing updated River parser to Neovim..."

# Copy parser
cp river.so ~/.local/share/nvim/lazy/nvim-treesitter/parser/river.so
echo "✓ Copied river.so parser"

# Copy queries
cp -r queries/* ~/.local/share/nvim/lazy/nvim-treesitter/queries/river/
echo "✓ Copied highlight queries"

echo "Done! Please restart Neovim to load the updated parser."