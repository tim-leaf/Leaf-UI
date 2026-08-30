//
//  window.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "object.hpp"
#include "shared_view.hpp"
#include "view.hpp"
#include "window_delegate.hpp"
#import <AppKit/AppKit.h>
#include <functional>
#include <memory>
#include <string>
#include <vector>

namespace leaf {

// forward declation
class application;

class window : public object {
  private:
	window(const CGRect frame, const NSWindowStyleMask style_mask,
	       const NSBackingStoreType backing_store = NSBackingStoreBuffered,
	       bool _defer = true);

  public:
	static std::shared_ptr<window>
	create(const CGRect frame, const NSWindowStyleMask style_mask,
	       const NSBackingStoreType backing_store = NSBackingStoreBuffered,
	       bool _defer = true);
	~window();

	NSWindow *get_window_native() const;
	NSView *get_native() const;

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
	application *_owner = nullptr;
	window_delegate _delegate;

	std::shared_ptr<shared_view> content_view;
	std::vector<std::shared_ptr<view>> views;
};

} // namespace leaf
