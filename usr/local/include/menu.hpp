//
//  menu.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "menu_item.hpp"
#import <AppKit/AppKit.h>
#include <string>
#include <vector>

namespace leaf {

class menu {
  public:
	menu(const std::string &title);

	void add_menu_item(std::unique_ptr<menu_item>);

	NSMenu *get_native();

  private:
	NSMenu *_native;

	std::vector<std::unique_ptr<menu_item>> menu_items;
};

} // namespace leaf
