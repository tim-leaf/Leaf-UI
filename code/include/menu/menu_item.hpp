//
//  menu_item.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#pragma once
#include "callback.hpp"
#include "callback_target.hpp"
#include <AppKit/AppKit.h>
#include <functional>
#include <memory>
#include <string>

namespace leaf {

struct shortcut {
	enum class modifier_flag : UInt {
		none = 0,
		help = NSEventModifierFlagHelp,
		shift = NSEventModifierFlagShift,
		option = NSEventModifierFlagOption,
		command = NSEventModifierFlagCommand,
		control = NSEventModifierFlagControl,
		caps_lock = NSEventModifierFlagCapsLock,
		dev_ind_flags_mask = NSEventModifierFlagDeviceIndependentFlagsMask,
		function = NSEventModifierFlagFunction,
		num_pad = NSEventModifierFlagNumericPad,

	};

	char key;
	modifier_flag mod = modifier_flag::none;

	friend modifier_flag operator|(modifier_flag a, modifier_flag b) {
		return static_cast<modifier_flag>(static_cast<UInt>(a) |
		                                  static_cast<UInt>(b));
	}
};

class menu_item {
  public:
	menu_item(const std::string &title, std::function<void()> callback);

	void set_shortcut(shortcut);

	NSMenuItem *get_native();

  private:
	NSMenuItem *_item;

	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

#pragma mark - Useful shortcuts ready to be copied

[[maybe_unused]]
static shortcut cmd(char key) {
	return {key, leaf::shortcut::modifier_flag::command};
}

[[maybe_unused]]
static shortcut opt(char key) {
	return {key, leaf::shortcut::modifier_flag::option};
}

[[maybe_unused]]
static shortcut ctrl(char key) {
	return {key, leaf::shortcut::modifier_flag::control};
}

[[maybe_unused]]
static shortcut fn(char key) {
	return {key, leaf::shortcut::modifier_flag::function};
}

[[maybe_unused]]
static shortcut shift(char key) {
	return {key, leaf::shortcut::modifier_flag::shift};
}
#pragma mark Useful shortcuts ready to be copied -

} // namespace leaf
