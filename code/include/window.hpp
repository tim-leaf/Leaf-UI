//
//  window.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "object.hpp"
#include "view.hpp"
#include "window_delegate.hpp"
#import <AppKit/AppKit.h>
#include <functional>
#include <memory>
#include <string>
#include <vector>

namespace leaf {

// forward declation
// class window_delegate;
class application;

class window : public object {
  public:
	window(CGRect frame, NSWindowStyleMask style_mask,
	       NSBackingStoreType backing_store = NSBackingStoreBuffered,
	       bool _defer = true);
	~window();

	NSWindow *get_native() const;

	// creation
	void set_owner(application *);
	void set_title(const std::string &title);

	// behaviors
	void show();
	void hide();

	void minimize();
	void close();

	void set_on_close(std::function<void()>);

	// add widgets
	void add_view(std::shared_ptr<view>);

  protected:
	application *_owner;
	window_delegate _delegate;

	std::vector<std::shared_ptr<view>> views;
};

} // namespace leaf
