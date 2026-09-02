//
//  menu.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "menu_item.hpp"
#include "object.hpp"
#import <AppKit/AppKit.h>
#include <memory>
#include <string>
#include <vector>

namespace leaf {

class menu : object {
  protected:
	menu(const std::string &title);

  public:
	static std::shared_ptr<menu> create(const std::string &title);
	~menu() override;

	void add_menu_item(std::shared_ptr<menu_item>);

	NSMenu *get_native() const;

  private:
	std::vector<std::shared_ptr<menu_item>> menu_items;
};

} // namespace leaf
