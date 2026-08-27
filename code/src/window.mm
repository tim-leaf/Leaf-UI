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

leaf::window::window(CGRect dimensions, style_mask st_mask) : element({}) {

	NSRect frame = NSRectFromCGRect(dimensions);
	NSWindowStyleMask ns_style_mask = NSWindowStyleMask(UInt(st_mask));

	_native = [[NSWindow alloc] initWithContentRect:frame
	                                      styleMask:ns_style_mask
	                                        backing:NSBackingStoreBuffered
	                                          defer:true];
	[_native setRestorationClass:nil];
	[_native setIdentifier:nil];

	leaf_window_delegate *n_delegate = [[leaf_window_delegate alloc] init];

	n_delegate.owner = this;

	_delegate = n_delegate;

	[_native setDelegate:_delegate];
}

leaf::window::~window() { //
	[_native release];
}

NSView *leaf::window::get_native() {
	return [_native contentView]; //
}

void leaf::window::set_owner(application *app_ptr) {
	_owner = app_ptr; //
}

void leaf::window::show() { [_native makeKeyAndOrderFront:nil]; }
void leaf::window::hide() { [_native orderOut:nil]; }

void leaf::window::minimize() { [_native miniaturize:nil]; }
void leaf::window::close() { [_native close]; }

void leaf::window::set_title(const std::string &title) {
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];
	[_native setTitle:ns_title];
}

void leaf::window::add_widget(std::shared_ptr<widget> n_widget) {
	widgets.push_back(n_widget);

	NSView *parent = [_native contentView];
	NSView *child = n_widget->get_native();

	[parent addSubview:child];
}

void leaf::window::add_widget(std::shared_ptr<view> n_view) {
	widgets.push_back(n_view);

	[[_native contentView] addSubview:n_view->get_native()];
}

void leaf::window::on_close() { //
	_owner->remove_window(this);
}
