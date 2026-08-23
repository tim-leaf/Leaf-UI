//
//  window.mm
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "window.hpp"
using namespace leaf;

window::window(float w, float h, style_mask st_mask) {

	NSRect frame = NSRectFromCGRect(CGRect({0, 0}, {w, h}));
	NSWindowStyleMask ns_style_mask = NSWindowStyleMask(UInt(st_mask));

	_native = [[NSWindow alloc] initWithContentRect:frame
	                                      styleMask:ns_style_mask
	                                        backing:NSBackingStoreBuffered
	                                          defer:true];
}

window::~window() { //
	[_native release];
}

void window::show() { [_native makeKeyAndOrderFront:nil]; }

void window::set_title(const std::string &title) {
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];
	[_native setTitle:ns_title];
}
