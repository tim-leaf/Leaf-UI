//
//  menu_bar.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "menu_bar.hpp"

leaf::menu_bar::menu_bar() { _menu = [[NSMenu alloc] init]; }

void leaf::menu_bar::add_menu(std::unique_ptr<menu> &n_menu) { //

	NSMenuItem *item = [[NSMenuItem alloc] init];

	[item setSubmenu:n_menu->get_native()];

	[_menu addItem:item];

	menus.push_back(std::move(n_menu));
}

NSMenu *leaf::menu_bar::get_native() { return _menu; }
