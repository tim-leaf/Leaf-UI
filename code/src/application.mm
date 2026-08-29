//
//  application.mm
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "application.hpp"
#include <iostream>

leaf::application::application() {
	_native = [NSApplication sharedApplication];

	[get_native() setActivationPolicy:NSApplicationActivationPolicyRegular];

	[get_native() setDelegate:static_cast     //
	              <id<NSApplicationDelegate>> //
	              (_delegate.get_native())];

	// Use the customized (or not) menu bar
	_menu_bar = leaf::menu_bar::create();
}

std::unique_ptr<leaf::application> leaf::application::create() {
	return std::unique_ptr<application>(new application());
}

leaf::application::~application() {
	[_native release]; //
}

NSApplication *leaf::application::get_native() const {
	return static_cast<NSApplication *>(_native); //
}

int leaf::application::run() {
	[get_native() setMainMenu:_menu_bar->get_native()];

	[get_native() run];
	return 0;
}

void leaf::application::quit() {
	[get_native() terminate:nil]; //
}

void leaf::application::add_window(std::shared_ptr<window> n_window) {
	n_window->set_owner(this);
	windows.push_back(n_window);
}

void leaf::application::remove_window(window *target) {
	auto it = std::find_if(windows.begin(), windows.end(),
	                       [target](const std::shared_ptr<window> &win) { //
		                       return win.get() == target;
	                       });

	if (it != windows.end()) {
		windows.erase(it);
	}
}

void leaf::application::add_menu(std::unique_ptr<menu> n_menu) {
	_menu_bar->add_menu(std::move(n_menu));
}

#pragma mark - App Delegate methods override
void leaf::application::set_on_quit(std::function<void()> new_on_quit) {
	_delegate.on_quit = new_on_quit; //
}

void leaf::application::set_on_hide(std::function<void()> new_on_hide) {
	_delegate.on_hide = new_on_hide; //
}

void leaf::application::set_should_terminate_on_all_windows_closed(
    std::function<bool()> new_action) {
	_delegate.should_terminate_after_last_window_closed = new_action;
}
#pragma mark App Delegate methods override -
