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
	auto quit_item =
	    leaf::menu_item::create("Quit App", [&]() { app->quit(); });
	quit_item->set_shortcut(shortcut{modifier_flag::command, "q"});

	app_menu->add_menu_item(std::move(quit_item));

	// Close Window Item
	auto close_window = leaf::menu_item::create //
	    ("Close Window", [&]() {                //
		    [[NSApp keyWindow] close];
	    });
	close_window->set_shortcut(shortcut{modifier_flag::command, "w"});

	app_menu->add_menu_item(std::move(close_window));
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

	//// - ☢️ TESTS ☢️

	auto view = leaf::view::create(CGRect({10, 10, 480, 480}));
	main_window->add_view(view);

	view->set_wants_layer(true);
	view->get_layer().borderWidth = 2.0;
	view->get_layer().borderColor = NSColor.systemPinkColor.CGColor;

	// Button Sub View
	//	auto button = leaf::button::create(CGRect({50, 50, 150, 100}));
	//	view->add_subview(button);
	//
	//	button->set_wants_layer(true);
	//	button->get_layer().borderWidth = 2.0;
	//	button->get_layer().borderColor = NSColor.systemYellowColor.CGColor;
	//
	//	button->set_title("Nice Button");
	//	button->set_action([]() { os_log_debug(logs::main, "Button pressed");
	//});

	// text field
	auto txt_field = leaf::text_field::create(CGRect({50, 50, 100, 20}));
	view->add_subview(txt_field);

	txt_field->set_text("Test");
	txt_field->set_action([&]() {
		os_log_debug(logs::main, "Text field entered: %s",
		             txt_field->get_text().c_str());
	});

	// text field

	// label
	//	auto test_label =
	//	    leaf::label::create("Test Label", CGRect({200, 200, 100, 100}));
	//	view->add_subview(test_label);
	// label

	////// checbox test
	bool test_bool = true;

	auto test_label =
	    leaf::label::create("Test Label", CGRect({200, 200, 100, 100}));
	view->add_subview(test_label);

	// Checkbox
	auto check = leaf::checkbox::create(test_bool, CGRect({100, 100, 100, 50}));
	view->add_subview(check);

	check->set_title("Checkbox");

	auto test_bool_item = menu_item::create("Test Bool", [&]() {
		int state =
		    (check->get_native().state == NSControlStateValueOn) ? 1 : 0;
		os_log_debug(logs::main, "Check: %d  |  bool: %d", state,
		             int(test_bool));
	});
	test_bool_item->set_shortcut(
	    leaf::shortcut(leaf::modifier_flag::command, "t"));
	app_menu->add_menu_item(std::move(test_bool_item));
	////// checbox test

	//// ☢️ TESTS ☢️ -

	// App execution
	app->add_menu(std::move(app_menu));
	return app->run();
}
