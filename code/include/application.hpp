//
//  application.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#pragma once
#import "menu.hpp"
#import "menu_bar.hpp"
#import "menu_item.hpp"
#import "window.hpp"
#import <AppKit/AppKit.h>

namespace leaf {

class application {
	// enum
  public:
	enum class activation_policy {
		regular,
		accessory,
		prohibited,
	};

	// init
  public:
	application();

	int run();
	void quit();

	// set up
  public:
	application &set_activation_policy(activation_policy);
	menu_bar *get_m_bar();

  private:
	NSApplication *_application;

	menu_bar m_bar;
	void init_menu();
	application &set_menu_bar(menu_bar &);

	NSApplicationActivationPolicy get(activation_policy);
};

} // namespace leaf
