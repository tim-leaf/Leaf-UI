//
//  window.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#import <AppKit/AppKit.h>
#include <string>

namespace leaf {

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

class window {
  public:
	window(float w, float h, style_mask st_mask);
	~window();

	void show();

	void set_title(const std::string &title);

  private:
	NSWindow *_native;
};

} // namespace leaf
