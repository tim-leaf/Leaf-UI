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

	[get_native() setDelegate:static_cast //
	              <id<NSWindowDelegate>>  //
	              (_delegate.get_native())];
}

leaf::window::~window() { //
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

void leaf::window::set_on_close //
    (std::function<void()> n_action) {

	_delegate.on_close = n_action;
}

void leaf::window::add_view(std::shared_ptr<view> view) {
	views.push_back(view);

	[[get_native() contentView] addSubview:view->get_native()];
}
