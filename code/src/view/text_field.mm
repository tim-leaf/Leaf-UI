//
//  text_field.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#include "text_field.hpp"

#pragma mark - construction / destruction
void leaf::text_field::init_callback() {
	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setAction:@selector(invoke:)];
	[get_native() setTarget:_target];
}

leaf::text_field::text_field(const std::string &n_text) {
	_native = [[NSTextField alloc] init];

	NSString *ns_n_text = [NSString stringWithUTF8String:n_text.c_str()];
	[get_native() setStringValue:ns_n_text];

	init_callback();
}

std::shared_ptr<leaf::text_field> leaf::text_field::create //
    (const std::string &n_text) {

	return std::shared_ptr<text_field>(new text_field(n_text));
}

leaf::text_field::text_field //
    (const std::string &n_text, const CGRect frame) {

	_native = [[NSTextField alloc] initWithFrame:frame]; //

	NSString *ns_n_text = [NSString stringWithUTF8String:n_text.c_str()];
	[get_native() setStringValue:ns_n_text];

	init_callback();
}

std::shared_ptr<leaf::text_field> leaf::text_field::create //
    (const std::string &n_text, const CGRect frame) {

	return std::shared_ptr<text_field>(new text_field(n_text, frame));
}

leaf::text_field::~text_field() {
	[_target release];
	[_native release]; //
}

#pragma mark - getters / setters
NSTextField *leaf::text_field::get_native() const {
	return static_cast<NSTextField *>(_native); //
}

void leaf::text_field::add_action(std::function<void()> n_action) {
	_callback->set_action(n_action);
}

void leaf::text_field::set_text(const std::string &n_text) {
	NSString *ns_n_text = [NSString stringWithUTF8String:n_text.c_str()];
	[get_native() setStringValue:ns_n_text];
}

std::string leaf::text_field::get_text() const {
	NSString *ns_text = [get_native() stringValue];
	return std::string([ns_text UTF8String]);
}
