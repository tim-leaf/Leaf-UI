//
//  window.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "object.hpp"
#import <AppKit/AppKit.h>
#include <memory>
#include <string>
#include <vector>

// forward declation
@class leaf_window_delegate;

namespace leaf {
// forward declation
class application;

class window : public object {
  public:
	window(CGRect frame, NSWindowStyleMask style_mask, NSBackingStoreType backing_store = NSBackingStoreBuffered, bool _defer = true);
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

	void on_close();

  protected:
	application *_owner;
	leaf_window_delegate *_delegate;
};

} // namespace leaf
