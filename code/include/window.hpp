//
//  window.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#pragma once
#import <AppKit/AppKit.h>
#include <string>
namespace leaf {

class window {

	// enum
  public:
	enum class style_mask : UInt {
		titled = NSWindowStyleMaskTitled,
		closable = NSWindowStyleMaskClosable,
		resizable = NSWindowStyleMaskResizable,
		borderless = NSWindowStyleMaskBorderless,
		hud_window = NSWindowStyleMaskHUDWindow,
		fullscreen = NSWindowStyleMaskFullScreen,
		miniaturizable = NSWindowStyleMaskMiniaturizable,
		utility_window = NSWindowStyleMaskUtilityWindow,
		doc_modal_window = NSWindowStyleMaskDocModalWindow,
		non_activating_panel = NSWindowStyleMaskNonactivatingPanel,
		textured_background API_DEPRECATED(
		    "Textured window style should no longer be used",
		    macos(10.2, 11.0)) = NSWindowStyleMaskTexturedBackground,
		full_size_content_view = NSWindowStyleMaskFullSizeContentView,
		unified_title_and_toolbar = NSWindowStyleMaskUnifiedTitleAndToolbar,
	};

	enum class backing_store_type {
		buffered,

		retained API_DEPRECATED_WITH_REPLACEMENT("NSBackingStoreBuffered",
		                                         macos(10.0, 10.13)),
		non_retained API_DEPRECATED_WITH_REPLACEMENT("NSBackingStoreBuffered",
		                                             macos(10.0, 10.13)),
	};

  public:
	window(std::string title, float width, float height, style_mask sty_mask,
	       backing_store_type backing_type, bool defer);

	void show();
	void hide();
	void close();

  private:
	NSWindow *_window;

	static NSBackingStoreType get(backing_store_type type);
};

inline window::style_mask operator|(window::style_mask a,
                                    window::style_mask b) {
	return static_cast<window::style_mask>(static_cast<UInt>(a) |
	                                       static_cast<UInt>(b));
}

} // namespace leaf
