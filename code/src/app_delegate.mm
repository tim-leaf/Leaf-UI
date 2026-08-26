//
//  app_delegate.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "app_delegate.hpp"
#include <iostream>

#pragma mark - Obj-C App Delegate

@interface leaf_app_delegate : NSObject <NSApplicationDelegate>

@property(nonatomic, assign) leaf::app_delegate *owner;

@end

@implementation leaf_app_delegate

- (void)setOwner:(leaf::app_delegate *)owner {
	self->_owner = owner;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:
    (NSApplication *)sender //
{
	if (_owner) {
		return _owner->should_terminate_after_last_window_closed();
	} else {
		throw std::runtime_error("no owner found for app delegate");
	}
}

- (void)applicationWillTerminate:(NSNotification *)notification {
	if (_owner) {
		_owner->on_quit();
	} else {
		throw std::runtime_error("no owner found for app delegate");
	}
}

- (void)applicationDidHide:(NSNotification *)notification {
	std::cout << "application is hidden" << '\n';
}

@end

#pragma mark - C++ App Delegate
leaf::app_delegate::app_delegate() {
	_native = [[leaf_app_delegate alloc] init]; //
	[_native setOwner:this];
}

leaf::app_delegate::~app_delegate() {
	[_native release]; //
}

NSObject *leaf::app_delegate::get_native() {
	return _native; //
}
