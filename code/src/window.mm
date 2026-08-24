//
//  window.mm
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "window.hpp"

leaf::window::window(CGRect dimensions, style_mask st_mask) {

	NSRect frame = NSRectFromCGRect(dimensions);
	NSWindowStyleMask ns_style_mask = NSWindowStyleMask(UInt(st_mask));

	_native = [[NSWindow alloc] initWithContentRect:frame
	                                      styleMask:ns_style_mask
	                                        backing:NSBackingStoreBuffered
	                                          defer:true];
}

leaf::window::~window() { //
	[_native release];
}

void leaf::window::show() { [_native makeKeyAndOrderFront:nil]; }
void leaf::window::hide() { [_native orderOut:nil]; }

void leaf::window::close() { [_native close]; }

void leaf::window::set_title(const std::string &title) {
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];
	[_native setTitle:ns_title];
}
