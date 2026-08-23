//
//  application.mm
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "application.hpp"
using namespace leaf;

application::application() { _native = [NSApplication sharedApplication]; }

void application::run() { [_native run]; }

void application::add_window(std::unique_ptr<window> n_window) {
	windows.push_back(std::move(n_window));
}
