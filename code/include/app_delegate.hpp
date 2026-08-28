//
//  app_delegate.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#import <Cocoa/Cocoa.h>
#include <functional>

#pragma mark - Obj-C App Delegate forward declaration
@class leaf_app_delegate;

#pragma mark - C++ App Delegate
namespace leaf {

class app_delegate {
  public:
	app_delegate();
	~app_delegate();

	NSObject *get_native() const;

	std::function<bool()> should_terminate_after_last_window_closed = []() {
		return true;
	};

	std::function<void()> on_quit = []() {};

	std::function<void()> on_hide = []() {};

  private:
	leaf_app_delegate *_native;
};

} // namespace leaf
