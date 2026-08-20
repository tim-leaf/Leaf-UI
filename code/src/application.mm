//
//  application.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#include "application.hpp"

leaf::application::application() {
	_application = [NSApplication sharedApplication];

	// Default activation policy
	set_activation_policy(activation_policy::regular);
}

int leaf::application::run() {
	[_application run];
	return 0;
}

void leaf::application::quit() { //
	[_application terminate:nil];
}

leaf::application &leaf::application::set_activation_policy //
    (leaf::application::activation_policy act_policy) {

	[_application setActivationPolicy:get(act_policy)];
	return *(this);
}

NSApplicationActivationPolicy leaf::application::get(activation_policy a_p) {
	using leaf::application;

	switch (a_p) {
	case activation_policy::prohibited:
		return NSApplicationActivationPolicyProhibited;

	case activation_policy::accessory:
		return NSApplicationActivationPolicyAccessory;

	default:
		return NSApplicationActivationPolicyRegular;
	}
}
