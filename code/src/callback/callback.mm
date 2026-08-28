//
//  callback.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "callback.hpp"

#pragma mark - Callback
leaf::callback::callback() { //
	action = []() {};
}

std::unique_ptr<leaf::callback> leaf::callback::create() {
	return std::unique_ptr<callback>(new callback()); //
}

leaf::callback::callback(std::function<void()> n_action) { //
	action = n_action;
}

std::unique_ptr<leaf::callback>
leaf::callback::create(std::function<void()> n_action) {
	return std::unique_ptr<callback>(new callback(n_action)); //
}

void leaf::callback::invoke() {
	if (action)
		action();
}

void leaf::callback::set_action(std::function<void()> n_action) {
	action = n_action; //
}

#pragma mark - Callback Target
@implementation leaf_callback_target {
	leaf::callback *_callback;
}

- (instancetype)initWithCallback: //
    (leaf::callback *)callback {

	self = [super init];

	if (self)
		_callback = callback;

	return self;
}

- (void)invoke:(id)sender {
	_callback->invoke();
}

@end
