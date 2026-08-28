//
//  window.mm
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "window.hpp"
#include "application.hpp"
#include "window_delegate.hpp"
#include <iostream>

leaf::window::window(CGRect frame, NSWindowStyleMask style_mask,
                     NSBackingStoreType backing_store, bool _defer) {

	_native = [[NSWindow alloc] initWithContentRect:frame
	                                      styleMask:style_mask
	                                        backing:backing_store
	                                          defer:_defer];

	[get_native() setRestorationClass:nil];
	[get_native() setIdentifier:nil];

	_delegate = [[leaf_window_delegate alloc] init];
	[get_native() setDelegate:_delegate];
}

leaf::window::~window() { //
	[_delegate release];
	[_native release];
}

NSWindow *leaf::window::get_native() const {
	return static_cast<NSWindow *>(_native); //
}

void leaf::window::set_owner(application *app_ptr) {
	_owner = app_ptr; //
}

void leaf::window::show() { //
	[get_native() makeKeyAndOrderFront:nil];
}
void leaf::window::hide() { //
	[get_native() orderOut:nil];
}

void leaf::window::minimize() { //
	[get_native() miniaturize:nil];
}
void leaf::window::close() { //
	[get_native() close];
}

void leaf::window::set_title(const std::string &title) {
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];
	[get_native() setTitle:ns_title];
}

void leaf::window::on_close() { //
	_owner->remove_window(this);
}

void leaf::window::add_view(std::shared_ptr<view> view) {
	views.push_back(view);

	[[get_native() contentView] addSubview:view->get_native()];
}
