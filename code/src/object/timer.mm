//
//  timer.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-09-01.
//

#include "timer.hpp"

#pragma mark - construction / destruction
void leaf::timer::init_callback() {
	_callback = leaf::callback::create();
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];
}

leaf::timer::timer(const double interval, const bool repeat) {
	init_callback();

	_native = [NSTimer //
	    scheduledTimerWithTimeInterval:interval
	                            target:_target
	                          selector:@selector(invoke:)
	                          userInfo:nil
	                           repeats:repeat];

	[get_native() retain];
}

std::shared_ptr<leaf::timer> //
leaf::timer::create(const double interval, const bool repeat) {
	return std::shared_ptr<timer>(new timer(interval, repeat)); //
}

leaf::timer::~timer() {
	[_native release]; //
}

#pragma mark - setters / getters
void leaf::timer::set_action(std::function<void()> n_action) {
	_callback->set_action(n_action); //
}
