" Vim syntax file for MOOS-IvP mission (.moos) and behavior (.bhv) files
" Place at: ~/.config/nvim/after/syntax/moos.vim
" Pairs with filetype detection mapping .moos/.bhv -> "moos" in polish.lua

if exists("b:current_syntax")
  finish
endif

syntax case match

" ---------- Comments ----------
syntax match moosComment "//.*$" contains=moosTodo
syntax keyword moosTodo TODO FIXME XXX contained

" ---------- ProcessConfig / Behavior block headers ----------
" ProcessConfig = pHelmIvP { ... }   or   Behavior = BHV_Waypoint { ... }
syntax match moosBlockKeyword "\<ProcessConfig\>"
syntax match moosBlockKeyword "\<Behavior\>"
syntax match moosBlockName "\(ProcessConfig\|Behavior\)\s*=\s*\zs\w\+" contains=NONE

" ---------- Braces ----------
syntax match moosBrace "[{}]"

" ---------- Keys (left side of =) ----------
" Matches start-of-line identifier before =, including [bracket] and + suffix
syntax match moosKey "^\s*\zs[A-Za-z_][A-Za-z0-9_]*\(\[[^\]]*\]\)\?\(+\)\?\ze\s*="

" ---------- Operators ----------
syntax match moosOperator "="
syntax match moosOperator "+="

" ---------- Numbers ----------
syntax match moosNumber "\<-\?\d\+\.\?\d*\>"

" ---------- Booleans ----------
syntax keyword moosBoolean true false TRUE FALSE

" ---------- Inline sub-key=value pairs (e.g. x=0, y=-20, heading=180) ----------
syntax match moosInlineKey "\<[A-Za-z_][A-Za-z0-9_]*\ze=" contained

" ---------- Strings (rare in MOOS but appear in some apps) ----------
syntax region moosString start=/"/ skip=/\\"/ end=/"/

" ---------- Variable interpolation $(VAR) ----------
syntax match moosVariable "\$([A-Za-z_][A-Za-z0-9_]*)"

" ---------- Common top-level mission keys ----------
syntax keyword moosTopKey ServerHost ServerPort Community MOOSTimeWarp LatOrigin LongOrigin

" ---------- Highlight links ----------
highlight default link moosComment      Comment
highlight default link moosTodo         Todo
highlight default link moosBlockKeyword Keyword
highlight default link moosBlockName    Type
highlight default link moosBrace        Delimiter
highlight default link moosKey          Identifier
highlight default link moosOperator     Operator
highlight default link moosNumber       Number
highlight default link moosBoolean      Boolean
highlight default link moosString       String
highlight default link moosVariable     Special
highlight default link moosTopKey       PreProc

let b:current_syntax = "moos"
