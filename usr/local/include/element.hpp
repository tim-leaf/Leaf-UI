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

class element {
  public:
	element(std::weak_ptr<element> n_parent) : parent(n_parent) {}

	virtual ~element() = default;

  protected:
	std::weak_ptr<element> parent;
};

} // namespace leaf
