//
//  popup.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-31.
//

#include "popup.hpp"

#pragma mark - construction / destruction
leaf::popup::popup() {
	_native = [[NSPopUpButton alloc] init]; //
}

std::shared_ptr<leaf::popup> leaf::popup::create() {
	return std::shared_ptr<popup>(new popup()); //
}

leaf::popup::~popup() {
	[_native release]; //
}

#pragma mark - setters / getters
NSPopUpButton *leaf::popup::get_native() const {
	return static_cast<NSPopUpButton *>(_native); //
}

void leaf::popup::add_item(const std::string &title) {
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];
	[get_native() addItemWithTitle:ns_title];

	items.push_back(leaf::menu_item::create(get_native().lastItem));
}

std::shared_ptr<leaf::menu_item> leaf::popup::get_item_at(uint idx) {
	return items[idx]; //
}
