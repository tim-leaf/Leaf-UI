//
//  view.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-27.
//

#include "view.hpp"
#include <sstream>

#pragma mark - construction / destruction
leaf::view::view() {
	_native = [[NSView alloc] init]; //
}

std::shared_ptr<leaf::view> leaf::view::create() {
	return std::shared_ptr<view>(new view()); //
}

leaf::view::view(const CGRect frame) {
	_native = [[NSView alloc] initWithFrame:frame];
}

std::shared_ptr<leaf::view> leaf::view::create(const CGRect frame) {
	return std::shared_ptr<view>(new view(frame));
}

leaf::view::~view() {
	[_native release]; //
}

NSView *leaf::view::get_native() const {
	return static_cast<NSView *>(_native); //
}

void leaf::view::set_superview(view *n_superview) {
	superview = n_superview; //
}

leaf::view *leaf::view::get_superview() const {
	if (superview) {
		return superview; //
	} else {
		std::stringstream ss;
		ss << "No superview for object: " << this;

		throw std::runtime_error(ss.str());
	}
}

#pragma mark - add views
void leaf::view::add_subview(std::shared_ptr<view> n_subview) {
	[get_native() addSubview:n_subview->get_native()];
	n_subview->set_superview(this);

	subviews.push_back(n_subview);
}

#pragma mark - control state
void leaf::view::show() { set_hidden(false); }
void leaf::view::hide() { set_hidden(true); }

void leaf::view::set_hidden(bool n_value) {
	[get_native() setHidden:n_value]; //
}

bool leaf::view::is_hidden() const {
	return get_native().isHidden; //
}

void leaf::view::set_translates_autoresizing_mask_into_constraints //
    (bool n_value) {

	[get_native() setTranslatesAutoresizingMaskIntoConstraints:n_value];
}

bool leaf::view::translates_autoresizing_mask_into_constraints() const {
	return get_native().translatesAutoresizingMaskIntoConstraints;
}

#pragma mark - getters / setters
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

void leaf::view::set_alpha(double n_alpha) {
	[get_native() setAlphaValue:n_alpha]; //
}

double leaf::view::get_alpha() const {
	return get_native().alphaValue; //
}

// Anchors
void leaf::view::pin_to_parent() {
	set_translates_autoresizing_mask_into_constraints(false);

	set_top_anchor(get_superview()->top_anchor());
	set_bottom_anchor(get_superview()->bottom_anchor());
	set_leading_anchor(get_superview()->leading_anchor());
	set_trailing_anchor(get_superview()->trailing_anchor());
}

// Y Axis Anchors
void leaf::view::set_top_anchor(NSLayoutYAxisAnchor *n_top_anchor) {
	[[get_native() topAnchor] //
	    constraintEqualToAnchor:n_top_anchor]
	    .active = true;
}

void leaf::view::set_bottom_anchor(NSLayoutYAxisAnchor *n_bottom_anchor) {
	[[get_native() bottomAnchor] //
	    constraintEqualToAnchor:n_bottom_anchor]
	    .active = true;
}

NSLayoutYAxisAnchor *leaf::view::top_anchor() const {
	return get_native().topAnchor;
}
NSLayoutYAxisAnchor *leaf::view::bottom_anchor() const {
	return get_native().bottomAnchor;
}
NSLayoutYAxisAnchor *leaf::view::centerY_anchor() const {
	return get_native().centerYAnchor;
}

// X Axis Anchors
void leaf::view::set_leading_anchor(NSLayoutXAxisAnchor *n_leading_anchor) {
	[[get_native() leadingAnchor] //
	    constraintEqualToAnchor:n_leading_anchor]
	    .active = true;
}

void leaf::view::set_trailing_anchor(NSLayoutXAxisAnchor *n_trailing_anchor) {
	[[get_native() trailingAnchor] //
	    constraintEqualToAnchor:n_trailing_anchor]
	    .active = true;
}

NSLayoutXAxisAnchor *leaf::view::left_anchor() const {
	return get_native().leftAnchor;
}

NSLayoutXAxisAnchor *leaf::view::right_anchor() const {
	return get_native().rightAnchor;
}

NSLayoutXAxisAnchor *leaf::view::leading_anchor() const {
	return get_native().leadingAnchor;
}

NSLayoutXAxisAnchor *leaf::view::trailing_anchor() const {
	return get_native().trailingAnchor;
}

NSLayoutXAxisAnchor *leaf::view::centerX_anchor() const {
	return get_native().centerXAnchor;
}

NSLayoutDimension *leaf::view::width_anchor() const {
	return get_native().widthAnchor;
}

NSLayoutDimension *leaf::view::height_anchor() const {
	return get_native().heightAnchor;
}

// Subviews
size_t leaf::view::subview_count() const {
	return subviews.size(); //
}

leaf::view *leaf::view::get_subview(size_t idx) const {
	return subviews[idx].get(); //
}

// Resizing
void leaf::view::set_autoresizing_mask //
    (NSAutoresizingMaskOptions n_resizing_mask) {
	[get_native() setAutoresizingMask:n_resizing_mask];
}

NSAutoresizingMaskOptions leaf::view::get_autoresizing_mask() const {
	return get_native().autoresizingMask;
}
