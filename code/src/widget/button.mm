//
//  button.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#include "button.hpp"
#include <iostream>

leaf::button::button //
    (std::pair<float, float> size, std::weak_ptr<element> parent,
     std::function<void()> action)
    : widget(parent) {

	_callback = std::make_unique<callback>(action);
	_target = [[leaf_callback_target alloc] initWithCallback:_callback.get()];

	_native =
	    [[NSButton alloc] initWithFrame:NSMakeRect(0.0, 0.0, //
	                                               size.first, size.second)];

	[_native setTarget:_target];
	[_native setAction:@selector(invoke:)];
}

void leaf::button::set_layout(leaf::alignment _align) {
	// TEST AUTO LAYOUT
	if (auto p = parent.lock()) {

		switch (_align) {
		case leaf::alignment::top:
			[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
			[NSLayoutConstraint activateConstraints:@[
				[_native.centerXAnchor
				    constraintEqualToAnchor:p.get()
				                                ->get_native()
				                                .centerXAnchor],
				[_native.topAnchor
				    constraintEqualToAnchor:p.get()->get_native().topAnchor]
			]];
			break;

		case leaf::alignment::bottom:
			[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
			[NSLayoutConstraint activateConstraints:@[
				[_native.centerXAnchor
				    constraintEqualToAnchor:p.get()
				                                ->get_native()
				                                .centerXAnchor],
				[_native.bottomAnchor
				    constraintEqualToAnchor:p.get()->get_native().bottomAnchor]
			]];
			break;

		case leaf::alignment::left:
			[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
			[NSLayoutConstraint activateConstraints:@[
				[_native.leftAnchor
				    constraintEqualToAnchor:p.get()->get_native().leftAnchor],
				[_native.centerYAnchor
				    constraintEqualToAnchor:p.get()->get_native().centerYAnchor]
			]];
			break;

		case leaf::alignment::right:
			[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
			[NSLayoutConstraint activateConstraints:@[
				[_native.rightAnchor
				    constraintEqualToAnchor:p.get()->get_native().rightAnchor],
				[_native.centerYAnchor
				    constraintEqualToAnchor:p.get()->get_native().centerYAnchor]
			]];
			break;

		case leaf::alignment::top_left:
			[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
			[NSLayoutConstraint activateConstraints:@[
				[_native.leftAnchor
				    constraintEqualToAnchor:p.get()->get_native().leftAnchor],
				[_native.topAnchor
				    constraintEqualToAnchor:p.get()->get_native().topAnchor]
			]];
			break;

		case leaf::alignment::top_right:
			[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
			[NSLayoutConstraint activateConstraints:@[
				[_native.rightAnchor
				    constraintEqualToAnchor:p.get()->get_native().rightAnchor],
				[_native.topAnchor
				    constraintEqualToAnchor:p.get()->get_native().topAnchor]
			]];
			break;

		case leaf::alignment::bottom_left:
			[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
			[NSLayoutConstraint activateConstraints:@[
				[_native.leftAnchor
				    constraintEqualToAnchor:p.get()->get_native().leftAnchor],
				[_native.bottomAnchor
				    constraintEqualToAnchor:p.get()->get_native().bottomAnchor]
			]];
			break;

		case leaf::alignment::bottom_right:
			[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
			[NSLayoutConstraint activateConstraints:@[
				[_native.rightAnchor
				    constraintEqualToAnchor:p.get()->get_native().rightAnchor],
				[_native.bottomAnchor
				    constraintEqualToAnchor:p.get()->get_native().bottomAnchor]
			]];
			break;

		case leaf::alignment::center:
			[_native setTranslatesAutoresizingMaskIntoConstraints:NO];
			[NSLayoutConstraint activateConstraints:@[
				[_native.centerXAnchor
				    constraintEqualToAnchor:p.get()
				                                ->get_native()
				                                .centerXAnchor],
				[_native.centerYAnchor
				    constraintEqualToAnchor:p.get()->get_native().centerYAnchor]
			]];
			break;

		default:
			break;
		}
	}
	// TEST AUTO LAYOUT
}

void leaf::button::set_debug_border(bool mode) {
	[_native setWantsLayer:mode];

	_native.layer.borderWidth = 2.0;
	_native.layer.borderColor = NSColor.redColor.CGColor;
}

leaf::button::~button() {
	[_native release]; //
}

NSView *leaf::button::get_native() {
	return _native; //
}
