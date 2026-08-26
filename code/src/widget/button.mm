//
//  button.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "button.hpp"

leaf::button::button(std::weak_ptr<element> parent) : widget(parent) {}

leaf::button::~button() {
	[_native release]; //
}

NSView *leaf::button::get_native() {
	return _native; //
}
