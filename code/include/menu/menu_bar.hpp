//
//  menu_bar.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#pragma once
#include "menu.hpp"
#include <AppKit/AppKit.h>

namespace leaf {

class menu_bar {
  public:
	menu_bar();

	void add_menu(menu &n_menu);

	NSMenu *get_native();

  private:
	NSMenu *_menu;
	std::vector<std::unique_ptr<menu>> menus;
};

} // namespace leaf
