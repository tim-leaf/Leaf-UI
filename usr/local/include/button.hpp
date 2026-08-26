//
//  button.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "widget.hpp"
#import <AppKit/AppKit.h>

namespace leaf {

class button : public widget {
  public:
	button(std::weak_ptr<element> parent);
	~button() override;

	NSView *get_native() override;

  private:
	NSButton *_native;
};

} // namespace leaf
