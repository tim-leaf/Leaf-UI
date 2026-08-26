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
	application app;
	os_log_info(logs::main, "Application launched");

	// App Delegates override
	app.set_on_quit //
	    ([]() -> void { os_log_info(logs::main, "App closing"); });

	app.set_should_terminate_on_all_windows_closed //
	    ([]() -> bool { return true; });

	// Window creation
	auto wind = std::make_shared<window>(
	    CGRect({400, 200, 800, 600}),
	    style_mask::closable | style_mask::miniaturizable |
	        style_mask::resizable | style_mask::titled //
	);
	app.add_window(wind);

	wind->set_title("App");
	wind->show();

	// Menu bar configuration
	auto hide_menu = std::make_unique<menu>("Window");

	auto hide_menu_item =
	    std::make_unique<menu_item>("Hide", [&wind]() { wind->minimize(); });
	hide_menu_item->set_shortcut(
	    leaf::shortcut({leaf::modifier_flag::command, "m"}));

	hide_menu->add_menu_item(std::move(hide_menu_item));

	app.add_menu(std::move(hide_menu));

	// Widgets creation
	auto test_view = std::make_unique<view>(wind);

	auto but = std::make_unique<button>(wind);
	test_view->add_widget(std::move(but));

	wind->add_widget(std::move(test_view));
	// ...

	// App execution
	return app.run();
}
