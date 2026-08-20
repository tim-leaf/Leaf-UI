//
//  application.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#pragma once
#import "menu_bar.hpp"
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

  private:
	NSApplication *_application;

	NSApplicationActivationPolicy get(activation_policy);
};

} // namespace leaf
