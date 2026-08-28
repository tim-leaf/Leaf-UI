//
//  label.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#include "label.hpp"

#pragma mark - construction / destruction
leaf::label::label(const std::string &text) {
	_native = [[NSTextField alloc] init];

	NSString *ns_text = [NSString stringWithUTF8String:text.c_str()];
	[get_native() setStringValue:ns_text];

	[get_native() setEditable:NO];
	[get_native() setSelectable:NO];
	[get_native() setBordered:NO];
	[get_native() setDrawsBackground:NO];
}

std::shared_ptr<leaf::label> leaf::label::create //
    (const std::string &text) {

	return std::shared_ptr<leaf::label>(new label(text));
}

leaf::label::label(const std::string &text, CGRect frame) {
	_native = [[NSTextField alloc] initWithFrame:frame];

	NSString *ns_text = [NSString stringWithUTF8String:text.c_str()];
	[get_native() setStringValue:ns_text];

	[get_native() setEditable:NO];
	[get_native() setSelectable:NO];
	[get_native() setBordered:NO];
	[get_native() setDrawsBackground:NO];
}

std::shared_ptr<leaf::label> leaf::label::create //
    (const std::string &text, CGRect frame) {

	return std::shared_ptr<leaf::label>(new label(text, frame));
}

leaf::label::~label() {}

#pragma mark - setters / getters
NSTextField *leaf::label::get_native() const {
	return static_cast<NSTextField *>(_native); //
}

void leaf::label::set_text(const std::string &n_text) {
	NSString *ns_n_text = [NSString stringWithUTF8String:n_text.c_str()];
	[get_native() setStringValue:ns_n_text];
}

void leaf::label::set_bordered(bool n_value) {
	[get_native() setBordered:n_value];
}

void leaf::label::set_draw_background(bool n_value) {
	[get_native() setDrawsBackground:n_value];
}
