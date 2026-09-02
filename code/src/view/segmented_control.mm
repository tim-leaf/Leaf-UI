//
//  segmented_control.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-31.
//

#include "segmented_control.hpp"

#pragma mark - construction / destruction
void leaf::segmented_control::init_callback() {
	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];
}


leaf::segmented_control::segmented_control() {
	_native = [[NSSegmentedControl alloc] init]; //
}

std::shared_ptr<leaf::segmented_control> //
leaf::segmented_control::create() {
	return std::shared_ptr<segmented_control>(new segmented_control());
}

leaf::segmented_control::segmented_control(const CGRect frame) {
	_native = [[NSSegmentedControl alloc] initWithFrame:frame]; //
}

std::shared_ptr<leaf::segmented_control> //
leaf::segmented_control::create(const CGRect frame) {
	return std::shared_ptr<segmented_control>(new segmented_control(frame));
}

leaf::segmented_control::~segmented_control() {
	[_target release];
	[_native release];
}

#pragma mark - setters / getters
NSSegmentedControl *leaf::segmented_control::get_native() const {
	return static_cast<NSSegmentedControl *>(_native); //
}

void leaf::segmented_control::set_segment_count(const uint n_value) {
	[get_native() setSegmentCount:n_value]; //

	for (int i = 0; i < n_value; ++i) {
		[get_native() setLabel:@"·" forSegment:i];
	}
}

uint leaf::segmented_control::get_segment_count() const {
	return static_cast<uint>(get_native().segmentCount); //
}

uint leaf::segmented_control::get_selected_segment() const {
	return static_cast<uint>(get_native().selectedSegment);
}

void leaf::segmented_control::set_label_at //
    (const std::string &n_label, const uint idx) {

	NSString *ns_n_label = [NSString stringWithUTF8String:n_label.c_str()];
	[get_native() setLabel:ns_n_label forSegment:idx];
}
