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

int main() {
	std::cout << std::boolalpha;

	// Application creation
	auto app = leaf::application::create();
	os_log_info(logs::main, "Application launched");

	auto app_menu = leaf::menu::create("App");

	// Quit App Item
	auto quit_item =
	    leaf::menu_item::create("Quit App", [&]() { app->quit(); });
	quit_item->set_shortcut(leaf::shortcut{leaf::modifier_flag::command, "q"});

	app_menu->add_menu_item(quit_item);

	// Close Window Item
	auto close_window = leaf::menu_item::create //
	    ("Close Window", [&]() {                //
		    [[NSApp keyWindow] close];
	    });
	close_window->set_shortcut(
	    leaf::shortcut{leaf::modifier_flag::command, "w"});

	app_menu->add_menu_item(close_window);

	// App Delegates override
	app->set_on_quit([]() -> void { os_log_info(logs::main, "App closing"); });

	app->set_should_terminate_on_all_windows_closed(
	    []() -> bool { return true; });

	// Window Creation
	auto main_window = leaf::window::create(
	    CGRect({450, 200, 500, 500}),
	    NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable |
	        NSWindowStyleMaskResizable | NSWindowStyleMaskTitled);
	app->add_window(main_window);

	main_window->set_title("Main Window");
	main_window->show();

	main_window->set_on_close(
	    [] { os_log_debug(logs::main, "Window Closing"); });

	////// - ☢️ WIDGETS TESTS ☢️

	auto timer = leaf::timer::create(1, true);
	timer->set_action([] { std::cout << "PROUT\n"; });

	////// ☢️ WIDGETS TESTS ☢️ -

	// App execution
	app->add_menu(app_menu);
	return app->run();
}
