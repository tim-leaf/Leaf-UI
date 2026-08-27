//
//  window.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "view.hpp"
#include "widget.hpp"
#import <AppKit/AppKit.h>
#include <memory>
#include <string>
#include <vector>

// forward declation
@class leaf_window_delegate;

namespace leaf {
// forward declation
class application;

enum class style_mask : UInt { //
	borderless = NSWindowStyleMaskBorderless,
	closable = NSWindowStyleMaskClosable,
	doc_modal_window = NSWindowStyleMaskDocModalWindow,
	fullscreen = NSWindowStyleMaskFullScreen,
	full_size_content = NSWindowStyleMaskFullSizeContentView,
	hud_window = NSWindowStyleMaskHUDWindow,
	miniaturizable = NSWindowStyleMaskMiniaturizable,
	non_activ_panel = NSWindowStyleMaskNonactivatingPanel,
	resizable = NSWindowStyleMaskResizable,
	titled = NSWindowStyleMaskTitled,
	unified_title_and_toolbar = NSWindowStyleMaskUnifiedTitleAndToolbar,
	utility_window = NSWindowStyleMaskUtilityWindow
};

inline style_mask operator|(style_mask a, style_mask b) {
	return static_cast<style_mask>(static_cast<UInt>(a) | static_cast<UInt>(b));
}

class window : public element {
  public:
	window(CGRect dimensions, style_mask st_mask);
	~window();

	// creation
	void set_owner(application *);
	void set_title(const std::string &title);

	void add_widget(std::shared_ptr<widget> n_widget);
	void add_widget(std::shared_ptr<view> n_view);

	// behaviors
	void show();
	void hide();

	void minimize();
	void close();

	void on_close();

  private:
	application *_owner;
	NSWindow *_native;

	leaf_window_delegate *_delegate;

	std::vector<std::shared_ptr<widget>> widgets;

	NSView *get_native() override;
};

} // namespace leaf
