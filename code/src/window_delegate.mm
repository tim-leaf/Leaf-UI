//
//  window_delegate.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-26.
//

#include "window_delegate.hpp"
#include <iostream>

@implementation leaf_window_delegate

- (void)windowWillClose:(NSNotification *)notification {
	if (_owner)
		_owner->on_close();
}

@end
