//
//  main.cpp
//  executable
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "log.hpp"
#include <iostream>

#include <leaf_ui.hpp>
using namespace leaf;

int main() {

	// Application creation
	application app;
	os_log_info(logs::main, "Application launched");

	// App Delegates override

	app.set_on_quit //
	    ([]() -> void { os_log_info(logs::main, "App closing"); });

	app.set_should_terminate_on_all_windows_closed //
	    ([]() -> bool { return true; });

	// Menu bar configuration
	auto test_menu = std::make_unique<menu>("Test");

	auto test_menu_item = std::make_unique<menu_item>(
	    "Test Item", []() { std::cout << "HELLO TEST" << '\n'; });
	test_menu_item->set_shortcut(
	    leaf::shortcut({leaf::modifier_flag::none, "e"}));

	test_menu->add_menu_item(std::move(test_menu_item));

	app.add_menu(std::move(test_menu));

	// Window creation
	auto win = std::make_unique<window>(
	    CGRect({400, 200, 800, 600}),
	    style_mask::closable | style_mask::resizable |
	        style_mask::miniaturizable | style_mask::titled);

	win->set_title("App");
	win->show();

	app.add_window(std::move(win));

	// App execution
	return app.run();
}
