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
	std::cout << std::boolalpha;

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
	    CGRect({450, 200, 500, 500}),
	    NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable |
	        NSWindowStyleMaskResizable | NSWindowStyleMaskTitled);
	app->add_window(main_window);

	main_window->set_title("Main Window");
	main_window->show();

	main_window->set_on_close(
	    [] { os_log_debug(logs::main, "Window Closing"); });

	// View
	auto view = leaf::view::create(CGRect({10, 10, 480, 480}));
	main_window->add_view(view);

	view->set_wants_layer(true);
	view->get_layer().borderWidth = 2.0;
	view->get_layer().borderColor = NSColor.systemPinkColor.CGColor;

	// Button Sub View
	auto button = leaf::button::create(CGRect({350, 350, 150, 100}));
	view->add_subview(button);

	button->set_wants_layer(true);
	button->get_layer().borderWidth = 2.0;
	button->get_layer().borderColor = NSColor.systemYellowColor.CGColor;

	button->set_title("Nice Button");
	button->set_action([]() { os_log_debug(logs::main, "Button pressed"); });

	// text field
	std::string test_string = "test";

	auto txt_field =
	    leaf::text_field::create(test_string, CGRect({50, 50, 100, 20}));
	view->add_subview(txt_field);

	//	txt_field->set_text("Test");
	txt_field->add_action([txt_field, &test_string]() {
		os_log_debug(logs::main, "%s  |  %s", test_string.c_str(),
		             txt_field->get_text().c_str());
	});
	// text field

	// label
	std::string label_text = "Test Label";
	auto test_label =
	    leaf::label::create(label_text, CGRect({200, 200, 100, 100}));
	view->add_subview(test_label);
	// label

	// Checbox
	bool test_bool = true;

	auto check = leaf::checkbox::create(test_bool, CGRect({100, 100, 100, 50}));
	view->add_subview(check);

	check->set_title("Checkbox");
	check->add_action([check, &test_bool] {
		std::cout << check->get_state() << " | " << test_bool << '\n'; //
	});
	// Checbox

	// Slider
	double test_value = 0.0;
	std::string string_value = "Slider: " + std::to_string(test_value);

	auto slider_label =
	    label::create(string_value, CGRect({150, 280, 100, 100}));
	view->add_subview(slider_label);

	auto slide = leaf::slider::create(test_value, CGRect({80, 280, 100, 100}));
	view->add_subview(slide);

	slide->set_min(-10.0);
	slide->set_max(+10.0);
	//	slide->set_neutral_value(0);

	slide->set_continuous(true);

	slide->add_action([slide, slider_label, &test_value, &string_value] {
		std::cout << slide->get_value() << " | " << test_value << '\n'; //
		slider_label->set_text("Slider: " + std::to_string(test_value));
	});

	slide->set_slider_style(NSSliderTypeLinear);
	// Slider

	//// - ☢️ TESTS ☢️

	//

	NSProgressIndicator *prog =
	    [[NSProgressIndicator alloc] initWithFrame:CGRect({300, 300, 100, 20})];
	[view->get_native() addSubview:prog];

	NSPopUpButton *popup =
	    [[NSPopUpButton alloc] initWithFrame:CGRect({100, 300, 100, 20})
	                               pullsDown:true];

	[popup addItemWithTitle:@"Option1"];
	[popup addItemWithTitle:@"Option2"];
	[popup addItemWithTitle:@"Option3"];

	[view->get_native() addSubview:popup];

	//// ☢️ TESTS ☢️ -

	// App execution
	app->add_menu(std::move(app_menu));
	return app->run();
}
