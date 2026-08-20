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

void leaf::menu::add_item(menu_item &item) {
	auto item_ptr = std::make_unique<menu_item>(std::move(item));

	[_menu addItem:item_ptr->get_native()];

	items.push_back(std::move(item_ptr));
}

NSMenu *leaf::menu::get_native() { return _menu; }
