//
//  view.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-27.
//

#include "view.hpp"

leaf::view::view() {
	_native = [[NSView alloc] init]; //
}

std::shared_ptr<leaf::view> leaf::view::create() {
	return std::shared_ptr<view>(new view()); //
}

leaf::view::view(CGRect frame) {
	_native = [[NSView alloc] initWithFrame:frame];
}

std::shared_ptr<leaf::view> leaf::view::create(CGRect frame) {
	return std::shared_ptr<view>(new view(frame));
}

leaf::view::~view() {
	[_native release]; //
}

NSView *leaf::view::get_native() const {
	return static_cast<NSView *>(_native); //
}

#pragma mark - add views

void leaf::view::add_subview(std::shared_ptr<view> n_subview) {
	[get_native() addSubview:n_subview->get_native()];

	subviews.push_back(n_subview);
}

#pragma mark - control state

void leaf::view::show() {
	[get_native() setHidden:NO]; //
}

void leaf::view::hide() {
	[get_native() setHidden:YES]; //
}

bool leaf::view::is_hidden() {
	return get_native().isHidden; //
}

// void set_translates_autoresizing_mask_into_constraints(bool);
// bool translates_autoresizing_mask_into_constraints() const;

void leaf::view::set_translates_autoresizing_mask_into_constraints //
    (bool n_value) {

	[get_native() setTranslatesAutoresizingMaskIntoConstraints:n_value];
}

bool leaf::view::translates_autoresizing_mask_into_constraints() const {
	return get_native().translatesAutoresizingMaskIntoConstraints;
}

#pragma mark - set up

void leaf::view::set_wants_layer(bool n_value) {
	[get_native() setWantsLayer:n_value];
}

bool leaf::view::get_wants_layer() const {
	return get_native().wantsLayer; //
}

CALayer *leaf::view::get_layer() const {
	return get_native().layer; //
}

CGRect leaf::view::get_frame() const {
	return get_native().frame; //
}

void leaf::view::set_frame(CGRect n_frame) {
	get_native().frame = n_frame; //
}

CGRect leaf::view::get_bounds() const {
	return get_native().bounds; //
}

void leaf::view::set_bounds(CGRect n_bounds) {
	get_native().bounds = n_bounds; //
}
