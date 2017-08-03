" 2017/08/03 08:16:34, AA: From https://gist.github.com/jeetsukumaran/96474ebbd00b874f0865
" Notes:
"   (1) To enhance the ergonomics of this sufficiently to make it practical, at
"       least, until your brain grows a new lobe dedicated to counting line offsets
"       in the background while you work, you should either make sure you have
"       something like the following in your `~/.vimrc`:
"
"           set number
"           if has('autocmd')
"           augroup vimrc_linenumbering
"               autocmd!
"               autocmd WinLeave *
"                           \ if &number |
"                           \   set norelativenumber |
"                           \ endif
"               autocmd BufWinEnter *
"                           \ if &number |
"                           \   set relativenumber |
"                           \ endif
"               autocmd VimEnter *
"                           \ if &number |
"                           \   set relativenumber |
"                           \ endif
"           augroup END
"           endif
"
"       or you have installed a plugin like
"       (vim-numbers)[https://github.com/myusuf3/numbers.vim].
"
"   (2) You might want to relax the constraint for horizontal motions, or
"       add other motions. You can customize the list of motions by
"       specifying the keys in the
"       `g:keys_to_disable_if_not_preceded_by_count` variable. For example,
"       the following only enforces count-prefixed motions for "j" and "k":
"
"         let g:keys_to_disable_if_not_preceded_by_count = ["j", "k"]

let g:lastmove = 1
function! DisableIfNonCounted(move) range
    if g:lastmove != a:move
        let g:lastmove = a:move
        return a:move
    else
        if v:count
            let g:lastmove = a:move
            return a:move
        else
            " You can make this do something annoying like:
               " echoerr "Count required!"
               " sleep 2
            return ""
        endif
    endif
    let g:lastmove = a:move
endfunction

function! SetDisablingOfBasicMotionsIfNonCounted(on)
    let keys_to_disable = get(g:, "keys_to_disable_if_not_preceded_by_count", ["j", "k", "l", "h"])
    if a:on
        for key in keys_to_disable
            execute "noremap <expr> <silent> " . key . " DisableIfNonCounted('" . key . "')"
        endfor
        let g:keys_to_disable_if_not_preceded_by_count = keys_to_disable
        let g:is_non_counted_basic_motions_disabled = 1
    else
        for key in keys_to_disable
            try
                execute "unmap " . key
            catch /E31:/
            endtry
        endfor
        let g:is_non_counted_basic_motions_disabled = 0
    endif
endfunction

function! ToggleDisablingOfBasicMotionsIfNonCounted()
    let is_disabled = get(g:, "is_non_counted_basic_motions_disabled", 0)
    if is_disabled
        call SetDisablingOfBasicMotionsIfNonCounted(0)
    else
        call SetDisablingOfBasicMotionsIfNonCounted(1)
    endif
endfunction

command! ToggleDisablingOfNonCountedBasicMotions :call ToggleDisablingOfBasicMotionsIfNonCounted()
command! DisableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(1)
command! EnableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(0)

DisableNonCountedBasicMotions
