//
//  slider.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#include "slider.hpp"
#include <iostream>

#pragma mark - construction destruction
void leaf::slider::init_callback() {
	_callback = leaf::callback::create([this] {
		value_ref = get_native().doubleValue; //
	});
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setTarget:_target];
	[get_native() setAction:@selector(invoke:)];
}

leaf::slider::slider(double &n_value_ref) : value_ref(n_value_ref) {

	_native = [[NSSlider alloc] init]; //
	[get_native() setDoubleValue:n_value_ref];

	init_callback();
}

std::shared_ptr<leaf::slider> leaf::slider::create //
    (double &n_value_ref) {
	return std::shared_ptr<slider>(new slider(n_value_ref));
}

leaf::slider::slider(double &n_value_ref, CGRect frame)
    : value_ref(n_value_ref) {

	_native = [[NSSlider alloc] initWithFrame:frame]; //
	[get_native() setDoubleValue:n_value_ref];

	init_callback();
}

std::shared_ptr<leaf::slider> leaf::slider::create //
    (double &n_value_ref, CGRect frame) {

	return std::shared_ptr<slider>(new slider(n_value_ref, frame));
}

leaf::slider::~slider() {
	[_native release]; //
}

#pragma mark - setters / getters
NSSlider *leaf::slider::get_native() const {
	return static_cast<NSSlider *>(_native); //
}

void leaf::slider::add_action(std::function<void()> n_action) {
	auto previous_action = _callback->get_action();

	std::function<void()> final_action = //
	    [previous_action, n_action]() {
		    previous_action();
		    n_action();
	    };

	_callback->set_action(final_action);
}

void leaf::slider::set_max(const double n_max) {
	[get_native() setMaxValue:n_max]; //
}

void leaf::slider::set_min(const double n_min) {
	[get_native() setMinValue:n_min]; //
}

void leaf::slider::set_neutral_value(const double n_neutral_value) {
	[get_native() setNeutralValue:n_neutral_value]; //
}

double leaf::slider::get_value() {
	return get_native().doubleValue; //
}
