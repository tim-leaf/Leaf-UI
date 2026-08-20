//
//  application.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "application.hpp"
#include <iostream>

leaf::application::application() {
	_application = [NSApplication sharedApplication];

	// Default activation policy
	set_activation_policy(activation_policy::regular);

	init_menu();
}

int leaf::application::run() {
	set_menu_bar(m_bar);

	[_application run];
	return 0;
}

void leaf::application::quit() { //
	[_application terminate:nil];
}

leaf::menu_bar *leaf::application::get_m_bar() {
	return &m_bar; //
}

void leaf::application::init_menu() {

	menu app_menu("App");

	// Quit App
	menu_item _quit_item("Quit App", [&]() { this->quit(); });
	_quit_item.set_shortcut(leaf::cmd('q'));

	app_menu.add_item(_quit_item);

	// Close Window
	menu_item _close_window_item("Close Window", [&]() {
		//									 _application.windows.firstObject.close();
		std::cout << "closing window" << '\n';
	});
	_close_window_item.set_shortcut(leaf::cmd('w'));

	app_menu.add_item(_close_window_item);

	// Set final menu bar
	m_bar.add_menu(app_menu);
}

leaf::application &leaf::application::set_menu_bar(menu_bar &m_bar) {

	[_application setMainMenu:m_bar.get_native()];
	return (*this);
}

leaf::application &leaf::application::set_activation_policy //
    (leaf::application::activation_policy act_policy) {

	[_application setActivationPolicy:get(act_policy)];
	return *(this);
}

NSApplicationActivationPolicy leaf::application::get(activation_policy a_p) {
	using leaf::application;

	switch (a_p) {
	case activation_policy::prohibited:
		return NSApplicationActivationPolicyProhibited;

	case activation_policy::accessory:
		return NSApplicationActivationPolicyAccessory;

	default:
		return NSApplicationActivationPolicyRegular;
	}
}
