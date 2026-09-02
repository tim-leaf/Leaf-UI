//
//  shared_view.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-30.
//

#pragma once
#include "view.hpp"
#import <AppKit/AppKit.h>

namespace leaf {

class shared_view : public view {
  private:
	shared_view(NSView *);

  public:
	static std::shared_ptr<shared_view> create(NSView *);

	~shared_view() override;

	NSView *get_native() const;
};

} // namespace leaf
