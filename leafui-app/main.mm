//
//  main.cpp
//  executable
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "log.hpp"
#include <iostream>
#include <thread>

#include <leaf_ui.hpp>
using namespace leaf;

int main() {

	// Application creation
	auto app = application::create();
	os_log_info(logs::main, "Application launched");

	auto app_menu = leaf::menu::create("App");

	// Quit App Item
	auto quit_item = leaf::menu_item::create("Quit App", [&]() { app->quit(); });
	quit_item->set_shortcut(shortcut{modifier_flag::command, "q"});

	app_menu->add_menu_item(std::move(quit_item));

	// Close Window Item
	auto close_window = leaf::menu_item::create //
	    ("Close Window", [&]() {                //
		    [[NSApp keyWindow] close];
	    });
	close_window->set_shortcut(shortcut{modifier_flag::command, "w"});

	app_menu->add_menu_item(std::move(close_window));

	// Set final menu bar
	app->add_menu(std::move(app_menu));
	// Default Menu Bar -

	// App Delegates override
	app->set_on_quit([]() -> void { os_log_info(logs::main, "App closing"); });

	app->set_should_terminate_on_all_windows_closed(
	    []() -> bool { return true; });

	// Window Creation
	auto main_window = std::make_shared<window>(
	    CGRect({0, 0, 500, 500}),
	    NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable |
	        NSWindowStyleMaskResizable | NSWindowStyleMaskTitled);
	app->add_window(main_window);

	main_window->set_title("Main Window");
	main_window->show();

	//// ☢️ TESTS ☢️

	auto view = leaf::view::create();
	view->get_native();

	//// ☢️ TESTS ☢️

	// App execution
	return app->run();
}
