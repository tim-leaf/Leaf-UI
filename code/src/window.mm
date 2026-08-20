//
//  window.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "window.hpp"

using std::string;

leaf::window::window(string title, float width, float height,
                     window::style_mask sty_mask,
                     backing_store_type backing_type, bool defer) {

	NSRect frame = NSMakeRect(100, 100, width, height);

	_window = [[NSWindow alloc] initWithContentRect:frame
	                                      styleMask:static_cast<UInt>(sty_mask)
	                                        backing:get(backing_type)
	                                          defer:defer ? YES : NO];

	// NS Title
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];

	[_window setTitle:ns_title];
}

void leaf::window::show() { [_window makeKeyAndOrderFront:nil]; }

void leaf::window::hide() { [_window orderOut:nil]; }

void leaf::window::close() { [_window close]; }

// helper
NSBackingStoreType leaf::window::get(backing_store_type type) {
	switch (type) {
	case window::backing_store_type::buffered:
		return NSBackingStoreBuffered;

	case window::backing_store_type::retained:
		return NSBackingStoreRetained;

	case window::backing_store_type::non_retained:
		return NSBackingStoreNonretained;

	default:
		break;
	}
}
