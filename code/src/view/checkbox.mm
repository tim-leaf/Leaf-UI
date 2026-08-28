//
//  checkbox.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#include "checkbox.hpp"

leaf::checkbox::checkbox(bool &state) : _state(state) {
	_native = [[NSButton alloc] init]; //
	[get_native() setButtonType:NSButtonTypeSwitch];

	_callback = leaf::callback::create();
	_callback->set_action(
	    [&] { _state = get_native().state == NSControlStateValueOn; });

	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];

	set_checked(state);
}

std::shared_ptr<leaf::checkbox> leaf::checkbox::create(bool &state) {
	return std::shared_ptr<checkbox>(new checkbox(state)); //
}

leaf::checkbox::checkbox(bool &state, CGRect frame) : _state(state) {
	_native = [[NSButton alloc] initWithFrame:frame]; //
	[get_native() setButtonType:NSButtonTypeSwitch];

	_callback = leaf::callback::create();
	_callback->set_action(
	    [&] { _state = get_native().state == NSControlStateValueOn; });

	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];

	set_checked(state);
}

std::shared_ptr<leaf::checkbox> leaf::checkbox::create //
    (bool &n_state, CGRect frame) {
	return std::shared_ptr<checkbox>(new checkbox(n_state, frame)); //
}

leaf::checkbox::~checkbox() { [_native release]; }

#pragma mark - setters / getters
NSButton *leaf::checkbox::get_native() const {
	return static_cast<NSButton *>(_native); //
}

void leaf::checkbox::set_checked(bool n_value) {
	_state = n_value;

	[get_native() setState:_state //
	                           ? NSControlStateValueOn
	                           : NSControlStateValueOff];
}

void leaf::checkbox::set_title(const std::string &n_title) {
	NSString *ns_n_title = [NSString stringWithUTF8String:n_title.c_str()];
	[get_native() setTitle:ns_n_title];
}

bool leaf::checkbox::is_checked() const {
	return get_native().state == NSControlStateValueOn;
}
