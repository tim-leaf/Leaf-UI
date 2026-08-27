//
//  view.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-27.
//

#pragma once
#include "object.hpp"
#import <AppKit/AppKit.h>
#include <memory>

namespace leaf {

class view : public object {
  protected:
	view();
	view(CGRect frame);

  public:
	static std::shared_ptr<view> create();
	static std::shared_ptr<view> create(CGRect frame);

	~view() override;

	NSView *get_native() const;
};

} // namespace leaf
