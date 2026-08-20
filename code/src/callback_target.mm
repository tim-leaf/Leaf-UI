//
//  callback_target.mm
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "callback_target.hpp"

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
