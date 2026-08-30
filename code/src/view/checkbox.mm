//
//  checkbox.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#include "checkbox.hpp"

#pragma mark - construction / destruction
void leaf::checkbox::init_callback() {
	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];
}

leaf::checkbox::checkbox() {
	_native = [[NSButton alloc] init]; //
	[get_native() setButtonType:NSButtonTypeSwitch];

	init_callback();

	set_checked(false);
}

std::shared_ptr<leaf::checkbox> leaf::checkbox::create() {
	return std::shared_ptr<checkbox>(new checkbox()); //
}

leaf::checkbox::checkbox(const CGRect frame) {
	_native = [[NSButton alloc] initWithFrame:frame]; //
	[get_native() setButtonType:NSButtonTypeSwitch];

	init_callback();

	set_checked(false);
}

std::shared_ptr<leaf::checkbox> leaf::checkbox::create //
    (const CGRect frame) {

	return std::shared_ptr<checkbox>(new checkbox(frame)); //
}

leaf::checkbox::~checkbox() { [_native release]; }

#pragma mark - setters / getters
NSButton *leaf::checkbox::get_native() const {
	return static_cast<NSButton *>(_native); //
}

void leaf::checkbox::set_title(const std::string &n_title) {
	NSString *ns_n_title = [NSString stringWithUTF8String:n_title.c_str()];
	[get_native() setTitle:ns_n_title];
}

void leaf::checkbox::set_action(std::function<void()> n_action) {
	_callback->set_action(n_action);
}

void leaf::checkbox::set_checked(bool n_value) {
	[get_native() setState:n_value //
	                           ? NSControlStateValueOn
	                           : NSControlStateValueOff];
}

bool leaf::checkbox::is_checked() const {
	return get_native().state == NSControlStateValueOn;
}
