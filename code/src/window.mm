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

leaf::window::window(const CGRect frame, const NSWindowStyleMask style_mask,
                     const NSBackingStoreType backing_store, bool _defer) {

	_native = [[NSWindow alloc] initWithContentRect:frame
	                                      styleMask:style_mask
	                                        backing:backing_store
	                                          defer:_defer];

	[get_window_native() setRestorationClass:nil];
	[get_window_native() setIdentifier:nil];

	[get_window_native() setDelegate:static_cast //
	                     <id<NSWindowDelegate>>  //
	                     (_delegate.get_native())];

	content_view = leaf::shared_view::create(get_window_native().contentView);
}

std::shared_ptr<leaf::window>
leaf::window::create(const CGRect frame, const NSWindowStyleMask style_mask,
                     const NSBackingStoreType backing_store, bool _defer) {
	return std::shared_ptr<window>(
	    new window(frame, style_mask, backing_store, _defer) //
	);
}

leaf::window::~window() { //
	[_native release];
}

NSWindow *leaf::window::get_window_native() const {
	return static_cast<NSWindow *>(_native); //
}

NSView *leaf::window::get_native() const {
	return static_cast<NSView *>(get_window_native().contentView); //
}

void leaf::window::set_owner(application *app_ptr) {
	_owner = app_ptr; //
}

void leaf::window::show() { //
	[get_window_native() makeKeyAndOrderFront:nil];
}
void leaf::window::hide() { //
	[get_window_native() orderOut:nil];
}

void leaf::window::minimize() { //
	[get_window_native() miniaturize:nil];
}
void leaf::window::close() { //
	[get_window_native() close];
}

void leaf::window::set_title(const std::string &title) {
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];
	[get_window_native() setTitle:ns_title];
}

void leaf::window::set_on_close //
    (std::function<void()> n_action) {

	_delegate.on_close = n_action;
}

void leaf::window::add_view(std::shared_ptr<view> n_view) {
	views.push_back(n_view);
	n_view->set_superview(this->content_view.get());

	[content_view->get_native() addSubview:n_view->get_native()];
}
