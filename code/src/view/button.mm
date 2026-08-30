//
//  button.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-27.
//

#include "button.hpp"

#pragma mark - construction / destruction
leaf::button::button() {
	_native = [[NSButton alloc] init]; //

	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];
}

std::shared_ptr<leaf::button> leaf::button::create() {
	return std::shared_ptr<button>(new button());
}

leaf::button::button(const CGRect frame) {
	_native = [[NSButton alloc] initWithFrame:frame]; //

	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];
}

std::shared_ptr<leaf::button> leaf::button::create(const CGRect frame) {
	return std::shared_ptr<button>(new button(frame));
}

leaf::button::~button() {
	[_target release];
	[_native release]; //
}

#pragma mark - setters / getters
NSButton *leaf::button::get_native() const {
	return static_cast<NSButton *>(_native); //
}

void leaf::button::set_title(const std::string &title) {
	NSString *ns_title = [NSString stringWithUTF8String:title.c_str()];

	[get_native() setTitle:ns_title];
}

void leaf::button::set_action(std::function<void()> n_action) {
	_callback->set_action(n_action); //
}
