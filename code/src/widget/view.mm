//
//  view.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-25.
//

#include "view.hpp"

leaf::view::view(std::weak_ptr<element> parent) : widget(parent) {
	//	[_native]
}

leaf::view::~view() {
	[_native release]; //
}

NSView *leaf::view::get_native() {
	return _native; //
}

void leaf::view::add_widget(std::unique_ptr<widget> n_widget) {
	widgets.push_back(std::move(n_widget)); //
}
