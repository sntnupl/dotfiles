


" NERDTree and NERDCommenter
map <leader>nt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
"let g:NERDTreeDirArrowExpandable = 'â–¸'
"let g:NERDTreeDirArrowCollapsible = 'â–¾'
"let g:NERDTreeIndicatorMapCustom = {
    "\ "Modified"  : "âœ¹",
    "\ "Staged"    : "âœš",
    "\ "Untracked" : "âœ­",
    "\ "Renamed"   : "âžœ",
    "\ "Unmerged"  : "â•",
    "\ "Deleted"   : "âœ–",
    "\ "Dirty"     : "âœ—",
    "\ "Clean"     : "âœ”ï¸Ž",
    "\ "Unknown"   : "?"
    "\ }

" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree

" the following will enable the default key mappings for nerd-commenter
let g:NERDCreateDefaultMappings = 1
" default mappings are articulated here: https://github.com/preservim/nerdcommenter#default-mappings
" I rely mainly on the following: <leader>c<space>: toggle current state of the selected line(s)
