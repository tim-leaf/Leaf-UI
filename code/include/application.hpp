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
#include "object.hpp"
#include "window.hpp"
#import <AppKit/AppKit.h>
#include <memory>
#include <vector>

namespace leaf {

class application : object {
  protected:
	application();

  public:
	static std::unique_ptr<application> create();
	~application() override;

	int run();

	void add_menu(std::shared_ptr<menu>);

	void add_window(std::shared_ptr<window>);
	void remove_window(window *);

	void quit();
	void close_active_window();

	NSApplication *get_native() const;

#pragma mark - App Delegate methods override
  public:
	void set_on_quit(std::function<void()>);
	void set_on_hide(std::function<void()>);
	void set_should_terminate_on_all_windows_closed //
	    (std::function<bool()>);
#pragma mark App Delegate methods override -

  private:
	NSApplication *app_native = nullptr;
	app_delegate _delegate;

	std::shared_ptr<menu_bar> _menu_bar;
	std::vector<std::shared_ptr<window>> windows;
	std::vector<std::shared_ptr<object>> objects;
};

} // namespace leaf
