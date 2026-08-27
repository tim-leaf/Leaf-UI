//
//  view.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-25.
//

#include "view.hpp"
#import <QuartzCore/QuartzCore.h>

leaf::view::view(std::weak_ptr<element> parent) : widget(parent) {
	_native = [[NSView alloc] initWithFrame:NSZeroRect]; //
	[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
}

void leaf::view::set_debug_border(bool mode) {
	[_native setWantsLayer:mode];

	_native.layer.borderWidth = 2.0;
	_native.layer.borderColor = NSColor.systemPinkColor.CGColor;
}

leaf::view::~view() {
	[_native release]; //
}

NSView *leaf::view::get_native() {
	return _native; //
}

void leaf::view::add_widget(std::shared_ptr<widget> n_widget) {
	widgets.push_back(n_widget); //

	[_native addSubview:widgets.back()->get_native()];
}
