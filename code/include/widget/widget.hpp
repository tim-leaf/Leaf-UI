//
//  widget.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-25.
//

#pragma once
#include "element.hpp"
#import <AppKit/AppKit.h>
#include <cstdlib>
#include <memory>

class widget : public element {
  public:
	widget(std::weak_ptr<element> _parent) : element(_parent) {}
	virtual ~widget() {}

	virtual NSView *get_native() = 0;
};
