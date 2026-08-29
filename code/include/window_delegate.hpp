//
//  window_delegate.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-26.
//

#pragma once
#import <AppKit/AppKit.h>
#include <functional>

#pragma mark - Obj-C Window Delegate forward declaration
@class leaf_window_delegate;

#pragma mark - C++ Window Delegate
namespace leaf {

class window_delegate {
  public:
	window_delegate();
	~window_delegate();

	NSObject *get_native() const;

	std::function<void()> on_close = []() {};

  private:
	leaf_window_delegate *_native;
};

}; // namespace leaf
