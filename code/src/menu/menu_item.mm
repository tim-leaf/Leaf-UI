//
//  menu_item.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "menu_item.hpp"
#include <iostream>
#include <memory>

leaf::menu_item::menu_item(const std::string &title,
                           std::function<void()> function) {

	_callback = std::make_unique<callback>(std::move(function));

	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	_item = [[NSMenuItem alloc]
	    initWithTitle:[NSString stringWithUTF8String:title.c_str()]
	           action:@selector(invoke:)
	    keyEquivalent:@"" //
	];

	[_item setTarget:_target];
}

NSMenuItem *leaf::menu_item::get_native() { return _item; }

// shortcuts
void leaf::menu_item::set_shortcut(shortcut sh_cut) {
	NSString *key = [NSString stringWithFormat:@"%c", sh_cut.key];

	[_item setKeyEquivalent:key];

	NSEventModifierFlags mask = static_cast<UInt>(sh_cut.mod);
	[_item setKeyEquivalentModifierMask:mask];
}
