//
//  menu_item.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "menu_item.hpp"

#pragma mark - construction / destruction
leaf::menu_item::menu_item(NSMenuItem *n_item) {
	_native = n_item; //
	[_native retain];

	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];
}

std::shared_ptr<leaf::menu_item> //
leaf::menu_item::create(NSMenuItem *n_item) {
	return std::shared_ptr<menu_item>(new menu_item(n_item));
}

leaf::menu_item::menu_item //
    (const std::string &title, std::function<void()> action) {

	// Init callback
	_callback = leaf::callback::create(action);
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];

	_native = [[NSMenuItem alloc] initWithTitle:ns_title
	                                     action:@selector(invoke:)
	                              keyEquivalent:@""];

	[get_native() setTarget:_target];
}

std::shared_ptr<leaf::menu_item> leaf::menu_item::create //
    (const std::string &title, std::function<void()> action) {

	return std::shared_ptr<menu_item>(new menu_item(title, action));
}

leaf::menu_item::~menu_item() {
	[_target release];
	[_native release]; //
}

#pragma mark - setters / getters
NSMenuItem *leaf::menu_item::get_native() const {
	return static_cast<NSMenuItem *>(_native); //
}

void leaf::menu_item::set_shortcut(shortcut sc) {

	NSEventModifierFlags ns_modifier_flag =
	    NSEventModifierFlags(UInt(sc.m_flag));

	NSString *ns_key = [NSString stringWithUTF8String:sc.key.c_str()];

	[get_native() setKeyEquivalent:ns_key];
	[get_native() setKeyEquivalentModifierMask:ns_modifier_flag];
}

void leaf::menu_item::set_action(std::function<void()> n_action) {
	_callback->set_action(n_action); //
}
