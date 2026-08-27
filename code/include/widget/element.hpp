//
//  element.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-25.
//

#pragma once
#import <AppKit/AppKit.h>
#include <memory>

namespace leaf {

enum class alignment {
	top,
	bottom,
	left,
	right,

	top_left,
	top_right,
	bottom_left,
	bottom_right,

	center
};

class element {
  public:
	element(std::weak_ptr<element> n_parent) : parent(n_parent) {}

	virtual ~element() = default;

	virtual NSView *get_native() = 0;

	virtual void set_margin(float n_margin) { margin = n_margin; }

  protected:
	std::weak_ptr<element> parent;

	float margin;
};

} // namespace leaf
