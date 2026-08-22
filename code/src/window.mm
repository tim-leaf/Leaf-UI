//
//  window.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "window.hpp"

using std::string;

leaf::window::window(window &&other) noexcept {
	_window = other._window; //
	other._window = nullptr;
}

leaf::window &leaf::window::operator=(window &&other) noexcept {
	if (this != &other) {
		_window = other._window; //
		other._window = nullptr;
	}

	return *this;
}

leaf::window::window(string title, float width, float height,
                     window::style_mask sty_mask, bool defer) {

	NSRect frame = NSMakeRect(100, 100, width, height);

	_window = [[NSWindow alloc] initWithContentRect:frame
	                                      styleMask:static_cast<UInt>(sty_mask)
	                                        backing:NSBackingStoreBuffered
	                                          defer:defer ? YES : NO];

	// NS Title
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];

	[_window setTitle:ns_title];
}

void leaf::window::show() { [_window makeKeyAndOrderFront:nil]; }

void leaf::window::hide() { [_window orderOut:nil]; }

void leaf::window::close() { [_window close]; }
