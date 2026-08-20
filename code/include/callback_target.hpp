//
//  callback_target.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#pragma once
#include "callback.hpp"
#include <AppKit/AppKit.h>

@interface leaf_callback_target : NSObject

- (instancetype)initWithCallback:(leaf::callback *)callback;

- (void)invoke:(id)sender;

@end
