//
//  stack_view.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-30.
//

#include "stack_view.hpp"

#pragma mark - construction / destruction
leaf::stack_view::stack_view() {
	_native = [[NSStackView alloc] init]; //
}

std::shared_ptr<leaf::stack_view> leaf::stack_view::create() {
	return std::shared_ptr<stack_view>(new stack_view());
}

leaf::stack_view::stack_view(const CGRect frame) {
	_native = [[NSStackView alloc] initWithFrame:frame]; //
}

std::shared_ptr<leaf::stack_view> leaf::stack_view::create(const CGRect frame) {
	return std::shared_ptr<stack_view>(new stack_view(frame));
}

#pragma mark - setters / getters
NSStackView *leaf::stack_view::get_native() const {
	return static_cast<NSStackView *>(_native); //
}

void leaf::stack_view::add_arranged_subview(std::shared_ptr<view> n_subview) {
	[get_native() addArrangedSubview:n_subview->get_native()]; //
	n_subview->set_superview(this);

	subviews.push_back(n_subview);
}

// Orientation
void leaf::stack_view::set_orientation //
    (const NSUserInterfaceLayoutOrientation n_orientation) {

	[get_native() setOrientation:n_orientation]; //
}

NSUserInterfaceLayoutOrientation leaf::stack_view::get_orientation() const {
	return get_native().orientation; //
}

// Spacing
void leaf::stack_view::set_spacing(const float n_value) {
	[get_native() setSpacing:n_value]; //
}

double leaf::stack_view::get_spacing() const {
	return get_native().spacing; //
}

// Alignment
void leaf::stack_view::set_alignment(const NSLayoutAttribute n_alignment) {
	[get_native() setAlignment:n_alignment]; //
}

NSLayoutAttribute leaf::stack_view::get_alignment() const {
	return get_native().alignment; //
}
