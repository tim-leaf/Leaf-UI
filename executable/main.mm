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
	application test{};

	window wind{"Window-Title", 600, 300,
	            window::style_mask::titled | window::style_mask::closable |
	                window::style_mask::miniaturizable |
	                window::style_mask::resizable,
	            false};

	wind.show();

	test.add_window(wind);

	std::unique_ptr<menu> _menu = std::make_unique<menu>("Tests");

	std::unique_ptr<menu_item> _item = std::make_unique<menu_item> //
	    ("Poop", []() { std::cout << "poo poo" << '\n'; });
	_item->set_shortcut(leaf::shortcut{'e'});

	_menu->add_item(_item);

	test.get_m_bar()->add_menu(_menu);

	return test.run();
}
