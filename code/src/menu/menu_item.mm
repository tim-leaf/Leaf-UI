//
//  menu_item.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "menu_item.hpp"

leaf::menu_item::menu_item //
    (const std::string &title, std::function<void()> action) {

	// Init callback
	_callback = leaf::callback::create(action);
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];

	_native = [[NSMenuItem alloc] initWithTitle:ns_title
	                                     action:@selector(invoke:)
	                              keyEquivalent:@""];

	[static_cast<NSMenuItem *>(_native) setTarget:_target];
}

std::unique_ptr<leaf::menu_item> //
    leaf::menu_item::create      //
    (const std::string &title, std::function<void()> action) {
	return std::unique_ptr<menu_item>(new menu_item(title, action));
}

leaf::menu_item::~menu_item() {
	[_target release];
	[_native release]; //
}

NSMenuItem *leaf::menu_item::get_native() const {
	return static_cast<NSMenuItem *>(_native); //
}

void leaf::menu_item::set_shortcut(shortcut sc) {

	NSEventModifierFlags ns_modifier_flag =
	    NSEventModifierFlags(UInt(sc.m_flag));

	NSString *ns_key = [NSString stringWithUTF8String:sc.key.c_str()];

	[static_cast<NSMenuItem *>(_native) setKeyEquivalent:ns_key];
	[static_cast<NSMenuItem *>(_native)
	    setKeyEquivalentModifierMask:ns_modifier_flag];
}
