//
//  menu.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#pragma once
#include "menu_item.hpp"
#include <AppKit/AppKit.h>
#include <string>

namespace leaf {

class menu {
  public:
	menu(std::string title);

	void add_item(std::unique_ptr<menu_item> &item);

	NSMenu *get_native();

  private:
	NSMenu *_menu;

	std::vector<std::unique_ptr<menu_item>> items;
};

} // namespace leaf
