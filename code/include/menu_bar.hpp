//
//  menu_bar.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#pragma once
#include <AppKit/AppKit.h>

namespace leaf {

class menu_bar {
  public:
	menu_bar();

	void add_menu();

  private:
	NSMenu *_menu;
};

} // namespace leaf
