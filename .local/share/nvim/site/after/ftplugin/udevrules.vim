if has('nvim')
    nnoremap <buffer> <F10> :edit ~/.local/share/nvim/site/after/ftplugin/udevrules.vim<CR>
    nnoremap <buffer> <F22> :source ~/.local/share/nvim/site/after/ftplugin/udevrules.vim<CR>
else
    nnoremap <buffer> <F10> :edit ~/.vim/after/ftplugin/udevrules.vim<CR>
    nnoremap <buffer> <S-F10> :source ~/.vim/after/ftplugin/udevrules.vim<CR>
endif

"SPELLING CONFIGURATION
setlocal spelllang=en
setlocal spellfile=~/.vim/spell/en.utf-8.add,~/.local/share/nvim/site/spell/udevrules.utf-8.add
"setlocal spellfile+=~/.vim/spell/udevrules.utf-8.add

augroup udevrules_1
    autocmd!
    autocmd BufWritePost <buffer> source ~/.local/share/nvim/site/after/ftplugin/udevrules.vim
augroup END

