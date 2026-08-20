//
//  menu_bar.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "menu_bar.hpp"

leaf::menu_bar::menu_bar() {
	_menu = [[NSMenu alloc] init];

	[NSApp setMainMenu:_menu];
}
