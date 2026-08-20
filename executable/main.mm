//
//  main.cpp
//  executable
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include <iostream>

#include <leaf_ui.hpp>
using namespace leaf;

int main(int argc, const char *argv[]) {

	application test{};

	window wind{"Window-Title",
	            600,
	            300,
	            window::style_mask::titled | window::style_mask::closable |
	                window::style_mask::miniaturizable |
	                window::style_mask::resizable,
	            window::backing_store_type::buffered,
	            false};

	wind.show();

	auto m_bar = test.get_m_bar();

	auto _menu = leaf::menu("Tests");
	auto _item =
	    leaf::menu_item("Poop", []() { std::cout << "poo poo" << '\n'; });
	_item.set_shortcut(leaf::shortcut{'e'});

	_menu.add_item(_item);

	m_bar->add_menu(_menu);

	return test.run();
}
