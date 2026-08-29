//
//  window_delegate.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-26.
//

#include "window_delegate.hpp"
#include <iostream>

#pragma mark - Obj-C Window Delegate
@interface leaf_window_delegate : NSObject <NSWindowDelegate>

@property(nonatomic, assign) leaf::window_delegate *owner;
- (void)setOwner:(leaf::window_delegate *)owner;

- (void)windowWillClose:(NSNotification *)notification;

@end

@implementation leaf_window_delegate

- (void)setOwner:(leaf::window_delegate *)owner {
	if (owner)
		self->_owner = owner;

	else
		throw std::runtime_error("no owner found for window delegate");
}

- (void)windowWillClose:(NSNotification *)notification {
	if (_owner)
		_owner->on_close();

	else
		throw std::runtime_error("no owner found for window delegate");
}

@end

#pragma mark - C++ Window Delegate
leaf::window_delegate::window_delegate() {
	_native = [[leaf_window_delegate alloc] init]; //
	[_native setOwner:this];
}

leaf::window_delegate::~window_delegate() {
	[_native release]; //
}

NSObject *leaf::window_delegate::get_native() const {
	return _native; //
}
