//
//  callback.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "callback.hpp"

leaf::callback::callback(std::function<void()> func) { //
	this->func = func;
}

void leaf::callback::invoke() {
	if (func)
		func();
}
