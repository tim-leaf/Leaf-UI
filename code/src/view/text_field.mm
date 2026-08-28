//
//  text_field.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#include "text_field.hpp"

#pragma mark - construction / destruction
leaf::text_field::text_field() {
	_native = [[NSTextField alloc] init];

	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];
}

std::shared_ptr<leaf::text_field> leaf::text_field::create() {
	return std::shared_ptr<text_field>(new text_field());
}

leaf::text_field::text_field(CGRect frame) {
	_native = [[NSTextField alloc] initWithFrame:frame]; //

	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];
}

std::shared_ptr<leaf::text_field> leaf::text_field::create(CGRect frame) {
	return std::shared_ptr<text_field>(new text_field(frame));
}

leaf::text_field::~text_field() {
	[_target release];
	[_native release]; //
}

#pragma mark - getters / setters
NSTextField *leaf::text_field::get_native() const {
	return static_cast<NSTextField *>(_native); //
}

void leaf::text_field::set_action(std::function<void()> action) {
	_callback->set_action(action); //
}

void leaf::text_field::set_text(const std::string &n_text) {
	NSString *ns_n_text = [NSString stringWithUTF8String:n_text.c_str()];
	[get_native() setStringValue:ns_n_text];
}

std::string leaf::text_field::get_text() const {
	NSString *ns_text = [get_native() stringValue];
	return std::string([ns_text UTF8String]);
}
