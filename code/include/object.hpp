//
//  object.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-27.
//

#pragma once
#import <AppKit/AppKit.h>

namespace leaf {

class object {
  public:
	virtual ~object() {}
	NSObject *get_native() const;

  protected:
	NSObject *_native = nullptr;
};

} // namespace leaf
