class mysublimetext {
	include sublime_text_3
	include sublime_text_3::package_control
	sublime_text_3::package { 'BracketHighlighter': source => 'facelessuser/BracketHighlighter' }
	sublime_text_3::package { 'dotfiles-syntax-highlighting-st2': source => 'mattbanks/dotfiles-syntax-highlighting-st2' }
	sublime_text_3::package { 'emmet-sublime': source => 'sergeche/emmet-sublime' }
	sublime_text_3::package { 'Material Theme': source => 'equinusocio/material-theme' }
	sublime_text_3::package { 'Sublime-HTMLPrettify': source => 'victorporof/Sublime-HTMLPrettify'}
	sublime_text_3::package { 'sublime-text-puppet': source => 'eklein/sublime-text-puppet' }
	sublime_text_3::package { 'sublime-tmux-syntax-highlight': source => 'keqh/sublime-tmux-syntax-highlight' }
	sublime_text_3::package { 'tern-meteor-sublime': source => 'Slava/tern-meteor-sublime' }
	sublime_text_3::package { 'TrailingSpaces': source => 'SublimeText/TrailingSpaces' }
}