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

	// insert code here...

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

	return test.run();
}
