//
//  menu_bar.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "menu_bar.hpp"

leaf::menu_bar::menu_bar() {
	_native = [[NSMenu alloc] init]; //
}

NSMenu *leaf::menu_bar::get_native() {
	return _native; //
}

void leaf::menu_bar::add_menu(std::unique_ptr<menu> n_menu) {
	menus.push_back(std::move(n_menu));

	NSMenuItem *item = [[NSMenuItem alloc] init];

	[item setSubmenu:menus.back()->get_native()];

	[_native addItem:item];
}
