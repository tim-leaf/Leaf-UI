//
//  application.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "window.hpp"
#import <AppKit/AppKit.h>
#include <memory>
#include <vector>

namespace leaf {

class application {
  public:
	application();

	void run();

	void add_window(std::unique_ptr<window>);

  private:
	NSApplication *_native;
	std::vector<std::unique_ptr<window>> windows;
};

} // namespace leaf
