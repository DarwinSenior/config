set textwidth=80
set spell
set conceallevel=2

augroup cm_tex
  autocmd!
  autocmd User CmSetup call cm#register_source({
        \ 'name': 'vimtex',
        \ 'priority': 8,
        \ 'scoping': 1,
        \ 'scopes': ['tex'],
        \ 'abbreviation': 'tex',
        \ 'cm_refresh_patterns': g:vimtex#re#ncm,
        \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
        \})
augroup END
