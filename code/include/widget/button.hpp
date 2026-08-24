//
//  button.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#import <AppKit/AppKit.h>

namespace leaf {

class button {
  public:
	button();

  private:
	NSButton *_native;
};

} // namespace leaf
