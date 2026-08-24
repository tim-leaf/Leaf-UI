//
//  menu_item.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "menu_item.hpp"

leaf::menu_item::menu_item //
    (std::string title, std::function<void()> action) {

	// Init callback
	_callback = std::make_unique<callback>(std::move(action));
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];

	_native = [[NSMenuItem alloc] initWithTitle:ns_title
	                                     action:@selector(invoke:)
	                              keyEquivalent:@""];

	[_native setTarget:_target];
}

NSMenuItem *leaf::menu_item::get_native() {
	return _native; //
}

void leaf::menu_item::set_shortcut(shortcut sc) {

	NSEventModifierFlags ns_modifier_flag =
	    NSEventModifierFlags(UInt(sc.m_flag));

	NSString *ns_key = [NSString stringWithUTF8String:sc.key.c_str()];

	[_native setKeyEquivalent:ns_key];
	[_native setKeyEquivalentModifierMask:ns_modifier_flag];
}
