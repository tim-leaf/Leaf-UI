//
//  menu_bar.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "menu.hpp"
#import <AppKit/AppKit.h>
#include <memory>

namespace leaf {

class menu_bar {
  public:
	menu_bar();

	void add_menu(std::unique_ptr<menu> n_menu);

	NSMenu *get_native();

  private:
	NSMenu *_native;

	std::vector<std::unique_ptr<menu>> menus;
};

} // namespace leaf
