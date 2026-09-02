//
//  popup.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-31.
//

#pragma once
#include "menu_item.hpp"
#include "view.hpp"
#import <AppKit/AppKit.h>
#include <memory>

namespace leaf {

class popup : public view {
  private:
	popup();

  public:
	static std::shared_ptr<popup> create();

	~popup() override;

	NSPopUpButton *get_native() const;

	void add_item(const std::string &);

	std::shared_ptr<menu_item> get_item_at(uint);

  private:
	std::vector<std::shared_ptr<menu_item>> items;
};

} // namespace leaf
