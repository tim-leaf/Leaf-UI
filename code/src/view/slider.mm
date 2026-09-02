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
	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	[get_native() setTarget:_target];
	[get_native() setAction:@selector(invoke:)];
}

leaf::slider::slider() {
	_native = [[NSSlider alloc] init]; //

	init_callback();
}

std::shared_ptr<leaf::slider> leaf::slider::create() {
	return std::shared_ptr<slider>(new slider());
}

leaf::slider::slider(const CGRect frame) {
	_native = [[NSSlider alloc] initWithFrame:frame]; //

	init_callback();
}

std::shared_ptr<leaf::slider> leaf::slider::create //
    (const CGRect frame) {

	return std::shared_ptr<slider>(new slider(frame));
}

leaf::slider::~slider() {
	[_target release];
	[_native release];
}

#pragma mark - setters / getters
NSSlider *leaf::slider::get_native() const {
	return static_cast<NSSlider *>(_native); //
}

void leaf::slider::set_action(std::function<void()> n_action) {
	_callback->set_action(n_action); //
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

void leaf::slider::set_continuous(const bool n_value) {
	[get_native() setContinuous:n_value]; //
}

bool leaf::slider::get_continuous() const {
	return [get_native() isContinuous]; //
}

void leaf::slider::set_allows_tick_mark_values_only //
    (const bool n_value) {

	[get_native() setAllowsTickMarkValuesOnly:n_value]; //
}

void leaf::slider::set_number_of_tick_marks(const uint n_num) {
	[get_native() setNumberOfTickMarks:n_num]; //
}

void leaf::slider::set_slider_style(const NSSliderType type) {
	[get_native() setSliderType:type]; //
}

void leaf::slider::set_double(const double n_value) {
	[get_native() setDoubleValue:n_value]; //
}

double leaf::slider::get_double() const {
	return get_native().doubleValue; //
}

void leaf::slider::set_int(const int n_value) {
	[get_native() setIntValue:n_value]; //
}

int leaf::slider::get_int() const {
	return get_native().intValue; //
}
