" Vim syntax file
" Language:	Taskpaper (http://hogbaysoftware.com/projects/taskpaper)
" Maintainer:	David O'Callaghan <david.ocallaghan@cs.tcd.ie>
" URL:		https://github.com/davidoc/taskpaper.vim
" Last Change:  2012-03-07

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

" Define tag styles
if !exists('g:task_paper_styles')
    let g:task_paper_styles = {'FAIL': 'guibg=Red guifg=White'}
endif

syn case ignore

syn match taskpaperIndent		/\t/
syn match taskpaperComment		/^.*$/ contains=taskpaperContext
syn match taskpaperProject		/^.\+:\(\s\+@[^ \t(]\+\(([^)]*)\)\?\)*$/ contains=taskpaperContext
syn match taskpaperListItem		/^\t*-\s\+/ contains=taskpaperTaskLeader
syn match taskpaperContext		/\s\zs@[^ \t(]\+\(([^)]*)\)\?/
syn match taskpaperDone			/^.*\s@done\(\(\s\|([^)]*)\).*\)\?$/ contains=taskpaperDoneLeader
syn match taskpaperCancelled		/^.*\s@cancelled\(\(\s\|([^)]*)\).*\)\?$/ contains=taskpaperCancelledLeader
syn match taskpaperTaskLeader		'^\s*\zs-' conceal cchar=▢
syn match taskpaperDoneLeader		'^\s*\zs-' conceal cchar=✔
syn match taskpaperCancelledLeader	'^\s*\zs-' conceal cchar=✕

syn sync fromstart

"highlighting for Taskpaper groups
HiLink taskpaperListItem	Identifier
" HiLink taskpaperContext	Identifier
" HiLink taskpaperProject	Title
" HiLink taskpaperDone		NonText
" HiLink taskpaperCancelled	NonText
HiLink taskpaperContext		String
HiLink taskpaperProject		Identifier
HiLink taskpaperTaskLeader	Conceal
HiLink taskpaperDoneLeader	Conceal
HiLink taskpaperDone		Comment
HiLink taskpaperCancelled	Comment
HiLink taskpaperCancelledLeader	Conceal
HiLink taskpaperComment		Comment
HiLink taskpaperIndent		Comment

call taskpaper#tag_style_dict(g:task_paper_styles)

let b:current_syntax = "taskpaper"

delcommand HiLink
" vim: ts=8
