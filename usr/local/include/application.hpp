//
//  application.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "app_delegate.hpp"
#include "menu.hpp"
#include "menu_bar.hpp"
#include "menu_item.hpp"
#include "window.hpp"
#import <AppKit/AppKit.h>
#include <memory>
#include <vector>

namespace leaf {

class application {
  public:
	application();
	~application();

	int run();

	void add_menu(std::unique_ptr<menu>);

	void add_window(std::shared_ptr<window>);
	void remove_window(window *);

	void quit();

#pragma mark - App Delegate methods override
  public:
	void set_on_quit(std::function<void()>);
	void set_should_terminate_on_all_windows_closed(std::function<bool()>);

#pragma mark App Delegate methods override -

  private:
	NSApplication *_native;
	app_delegate _delegate;

	std::unique_ptr<menu_bar> _menu_bar;
	std::vector<std::shared_ptr<window>> windows;

  private:
	void default_menu_bar();
};

} // namespace leaf
