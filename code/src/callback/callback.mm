//
//  callback.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "callback.hpp"

#pragma mark - Callback
leaf::callback::callback(std::function<void()> func) { //
	this->func = func;
}

void leaf::callback::invoke() {
	if (func)
		func();
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
