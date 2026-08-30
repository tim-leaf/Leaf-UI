//
//  non_owning_view.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-30.
//

#include "shared_view.hpp"

#pragma mark - construction / destruction
leaf::shared_view::shared_view(NSView *n_native) {
	_native = [n_native retain]; //
}

std::shared_ptr<leaf::shared_view> leaf::shared_view::create //
    (NSView *n_native) {

	return std::shared_ptr<shared_view>(new shared_view(n_native)); //
}

leaf::shared_view::~shared_view() {
	[_native release]; //
}

#pragma mark - setters / getters
NSView *leaf::shared_view::get_native() const {
	return static_cast<NSView *>(_native); //
}
