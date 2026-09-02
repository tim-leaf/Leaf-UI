//
//  menu_bar.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "menu_bar.hpp"

#pragma mark - construction / destruction
leaf::menu_bar::menu_bar() {
	_native = [[NSMenu alloc] init]; //
}

std::shared_ptr<leaf::menu_bar> leaf::menu_bar::create() {
	return std::shared_ptr<leaf::menu_bar>(new menu_bar());
}

leaf::menu_bar::~menu_bar() {
	[_native release]; //
}

#pragma mark - setters / getters
NSMenu *leaf::menu_bar::get_native() const {
	return static_cast<NSMenu *>(_native); //
}

void leaf::menu_bar::add_menu(std::shared_ptr<menu> n_menu) {
	menus.push_back(n_menu);

	NSMenuItem *item = [[NSMenuItem alloc] init];

	[item setSubmenu:menus.back()->get_native()];

	[get_native() addItem:item];
}
