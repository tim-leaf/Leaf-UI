//
//  menu.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "menu.hpp"

leaf::menu::menu(const std::string &title) {
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];

	_native = [[NSMenu alloc] initWithTitle:ns_title];
}

std::unique_ptr<leaf::menu> leaf::menu::create(const std::string &title) {
	return std::unique_ptr<leaf::menu>(new menu(title));
}

leaf::menu::~menu() { [_native release]; }

NSMenu *leaf::menu::get_native() const {
	return static_cast<NSMenu *>(_native); //
}

void leaf::menu::add_menu_item(std::unique_ptr<menu_item> n_menu_item) {
	menu_items.push_back(std::move(n_menu_item));

	[static_cast<NSMenu *>(_native) addItem:menu_items.back()->get_native()];
}
