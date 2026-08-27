//
//  menu_bar.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "menu.hpp"
#include "object.hpp"
#import <AppKit/AppKit.h>
#include <memory>

namespace leaf {

class menu_bar : public object {
  protected:
	menu_bar();

  public:
	static std::unique_ptr<menu_bar> create();
	~menu_bar() override;

	void add_menu(std::unique_ptr<menu> n_menu);

	NSMenu *get_native() const;

  private:
	std::vector<std::unique_ptr<menu>> menus;
};

} // namespace leaf
