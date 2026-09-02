//
//  menu_item.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "callback.hpp"
#include "object.hpp"
#include "shortcut.hpp"
#import <AppKit/AppKit.h>
#include <functional>
#include <string>

namespace leaf {

class menu_item : public object {
  protected:
	menu_item(NSMenuItem *);
	menu_item(const std::string &title, std::function<void()> action);

  public:
	static std::shared_ptr<menu_item> create(NSMenuItem *);
	static std::shared_ptr<menu_item> create(const std::string &title,
	                                         std::function<void()> n_action);
	~menu_item() override;

	NSMenuItem *get_native() const;

	void set_shortcut(shortcut sc);
	void set_action(std::function<void()>);

  private:
	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
