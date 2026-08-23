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

	application app;
	os_log_info(logs::main, "Application launched");

	auto win = std::make_unique<window>(
	    800, 600, style_mask::titled | style_mask::closable);
	win->set_title("Window");
	win->show();

	app.add_window(std::move(win));
	app.run();

	return 0;
}
