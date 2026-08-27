//
//  button.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "callback.hpp"
#include "widget.hpp"
#import <AppKit/AppKit.h>
#include <functional>

namespace leaf {

class button : public widget {
  public:
	button(std::pair<float, float> size, std::weak_ptr<element> parent,
	       std::function<void()> action);
	~button() override;

	NSView *get_native() override;

	void set_layout(alignment _align);

	void set_debug_border(bool);

  private:
	NSButton *_native;

	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
