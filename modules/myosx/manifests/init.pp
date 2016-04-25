class myosx {
	include osx::disable_app_quarantine
	include osx::dock::clear_dock
	include osx::finder::unhide_library
	include osx::global::disable_key_press_and_hold
	include osx::global::enable_keyboard_control_access
	include osx::global::enable_standard_function_keys
	include osx::global::expand_print_dialog
	include osx::global::expand_save_dialog
	include osx::software_update
	class { 'osx::dock::position': position => 'left'}
	class { 'osx::dock::icon_size': size => 36}
}