//
//  window_delegate.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-26.
//

#pragma once
#include "window.hpp"
#import <AppKit/AppKit.h>

@interface leaf_window_delegate : NSObject <NSWindowDelegate>

@property(nonatomic, assign) leaf::window *owner;

- (void)windowWillClose:(NSNotification *)notification;

@end
