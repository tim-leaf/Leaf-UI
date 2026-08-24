//
//  application.mm
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "application.hpp"

leaf::application::application() {
	_native = [NSApplication sharedApplication];

	[_native setActivationPolicy:NSApplicationActivationPolicyRegular];
	[_native setDelegate:_delegate.get_native()];

	// Use the customized (or not) menu bar
	_menu_bar = std::make_unique<menu_bar>();
	default_menu_bar();
}

void leaf::application::default_menu_bar() {
	auto app_menu = std::make_unique<menu>("App");

	// Quit App Item
	auto quit_item =
	    std::make_unique<menu_item>("Quit App", [&]() { this->quit(); });
	quit_item->set_shortcut(shortcut{modifier_flag::command, "q"});

	app_menu->add_menu_item(std::move(quit_item));

	// Close Window Item
	auto close_window = std::make_unique<menu_item>("Close Window", [&]() {
		if (windows.back())
			windows.back()->close();
	});
	close_window->set_shortcut(shortcut{modifier_flag::command, "w"});

	app_menu->add_menu_item(std::move(close_window));

	// Set final menu bar
	_menu_bar->add_menu(std::move(app_menu));
}

int leaf::application::run() {
	[_native setMainMenu:_menu_bar->get_native()];

	[_native run];

	return 0;
}

void leaf::application::quit() { //
	[_native terminate:nil];
}

void leaf::application::add_window(std::unique_ptr<window> n_window) {
	windows.push_back(std::move(n_window));
}

void leaf::application::add_menu(std::unique_ptr<menu> n_menu) {
	_menu_bar->add_menu(std::move(n_menu));
}

#pragma mark - App Delegate methods override
void leaf::application::set_on_quit(std::function<void()> new_on_quit) {
	_delegate.on_quit = new_on_quit; //
}

void leaf::application::set_should_terminate_on_all_windows_closed(
    std::function<bool()> new_action) {
	_delegate.should_terminate_after_last_window_closed = new_action;
}
