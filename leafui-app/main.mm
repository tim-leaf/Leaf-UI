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

	// TEST VARIABLES
	int count = 0;
	// TEST VARIABLES

	// Application creation
	std::unique_ptr<application> app = std::make_unique<application>();
	os_log_info(logs::main, "Application launched");

	// App Delegates override
	app->set_on_quit([]() -> void { os_log_info(logs::main, "App closing"); });

	app->set_should_terminate_on_all_windows_closed(
	    []() -> bool { return true; });

	// Window creation
	auto main_window = std::make_shared<window>(
	    CGRect({400, 200, 800, 600}),
	    style_mask::closable | style_mask::miniaturizable |
	        style_mask::resizable | style_mask::titled //
	);
	app->add_window(main_window);

	main_window->set_title("App");

	// Menu bar configuration
	auto window_menu = std::make_unique<menu>("Window");

	auto hide_menu_item = std::make_unique<menu_item>(
	    "Hide", [&main_window]() { main_window->minimize(); });
	hide_menu_item->set_shortcut(
	    leaf::shortcut({leaf::modifier_flag::command, "m"}));

	window_menu->add_menu_item(std::move(hide_menu_item));

	app->add_menu(std::move(window_menu));

	// - Widgets Test
	//// Main View
	auto main_view = std::make_shared<view>(main_window);
	main_view->set_debug_border(true);

	//// Button
	auto but = std::make_shared<button>(
	    std::pair<float, float>{300, 300}, main_view,
	    [&count]() { os_log_debug(logs::main, "Button clicked %d", ++count); });

	but->set_debug_border(true);

	main_view->add_widget(but);
	but->set_layout(leaf::alignment::top);

	main_window->add_widget(main_view);
	// Widgets Test -

	// App execution
	main_window->show();
	return app->run();
}
