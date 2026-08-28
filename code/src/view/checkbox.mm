//
//  checkbox.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#include "checkbox.hpp"

#pragma mark - construction / destruction
void leaf::checkbox::init_callback() {
	_callback = leaf::callback::create([&] {
		state_ref = get_native().state == NSControlStateValueOn; //
	});

	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];
}

leaf::checkbox::checkbox(bool &state) : state_ref(state) {
	_native = [[NSButton alloc] init]; //
	[get_native() setButtonType:NSButtonTypeSwitch];

	init_callback();

	set_checked(state);
}

std::shared_ptr<leaf::checkbox> leaf::checkbox::create(bool &state) {
	return std::shared_ptr<checkbox>(new checkbox(state)); //
}

leaf::checkbox::checkbox(bool &state, CGRect frame) : state_ref(state) {
	_native = [[NSButton alloc] initWithFrame:frame]; //
	[get_native() setButtonType:NSButtonTypeSwitch];

	init_callback();

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

void leaf::checkbox::add_action(std::function<void()> n_action) {
	auto previous_action = _callback->get_action();

	std::function<void()> final_action = //
	    [previous_action, n_action]() {
		    previous_action();
		    n_action();
	    };

	_callback->set_action(final_action);
}

bool leaf::checkbox::get_state() const {
	return state_ref; //
}

void leaf::checkbox::set_checked(bool n_value) {
	state_ref = n_value;

	[get_native() setState:state_ref //
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
