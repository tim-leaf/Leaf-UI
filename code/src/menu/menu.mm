//
//  menu.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "menu.hpp"

#pragma mark - construction / destruction
leaf::menu::menu(const std::string &title) {
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];

	_native = [[NSMenu alloc] initWithTitle:ns_title];
}

std::shared_ptr<leaf::menu> leaf::menu::create(const std::string &title) {
	return std::shared_ptr<leaf::menu>(new menu(title));
}

leaf::menu::~menu() { [_native release]; }

#pragma mark - setters / getters
NSMenu *leaf::menu::get_native() const {
	return static_cast<NSMenu *>(_native); //
}

void leaf::menu::add_menu_item(std::shared_ptr<menu_item> n_menu_item) {
	menu_items.push_back(n_menu_item);

	[get_native() addItem:menu_items.back()->get_native()];
}
