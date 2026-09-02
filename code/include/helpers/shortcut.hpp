//
//  shortcut.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-31.
//

#pragma once
#import <AppKit/AppKit.h>
#include <string>

namespace leaf {

namespace modifier_flag {
inline const NSEventModifierFlags none = 0;
inline const NSEventModifierFlags help = NSEventModifierFlagHelp;
inline const NSEventModifierFlags shift = NSEventModifierFlagShift;
inline const NSEventModifierFlags option = NSEventModifierFlagOption;
inline const NSEventModifierFlags command = NSEventModifierFlagCommand;
inline const NSEventModifierFlags control = NSEventModifierFlagControl;
inline const NSEventModifierFlags caps_lock = NSEventModifierFlagCapsLock;
inline const NSEventModifierFlags dev_ind_flags_mask =
    NSEventModifierFlagDeviceIndependentFlagsMask;
inline const NSEventModifierFlags function = NSEventModifierFlagFunction;
inline const NSEventModifierFlags num_pad = NSEventModifierFlagNumericPad;
} // namespace modifier_flag

struct shortcut {
	NSEventModifierFlags m_flag = modifier_flag::none;
	std::string key;
};

} // namespace leaf
