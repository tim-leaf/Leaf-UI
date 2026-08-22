//
//  menu.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "menu.hpp"

leaf::menu::menu(std::string title) {
	_menu = [[NSMenu alloc]
	    initWithTitle:[NSString stringWithUTF8String:title.c_str()]];
}

void leaf::menu::add_item(std::unique_ptr<menu_item> &item) {

	[_menu addItem:item->get_native()];

	items.push_back(std::move(item));
}

NSMenu *leaf::menu::get_native() { return _menu; }
