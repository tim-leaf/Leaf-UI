//
//  view.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-27.
//

#include "view.hpp"

leaf::view::view() {
	_native = [[NSView alloc] init]; //
}

std::shared_ptr<leaf::view> leaf::view::create() {
	return std::shared_ptr<view>(new view()); //
}

leaf::view::view(CGRect frame) {
	_native = [[NSView alloc] initWithFrame:frame];
}

std::shared_ptr<leaf::view> leaf::view::create(CGRect frame) {
	return std::shared_ptr<view>(new view(frame));
}

leaf::view::~view() {
	[_native release]; //
}

NSView *leaf::view::get_native() const {
	return static_cast<NSView *>(_native); //
}
