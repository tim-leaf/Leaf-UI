//
//  menu_item.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#include "callback.hpp"
#include "object.hpp"
#import <AppKit/AppKit.h>
#include <functional>
#include <string>

namespace leaf {

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

inline modifier_flag operator|(modifier_flag a, modifier_flag b) {
	return static_cast<modifier_flag>(static_cast<UInt>(a) |
	                                  static_cast<UInt>(b));
}

struct shortcut {
	modifier_flag m_flag = modifier_flag::none;
	std::string key;
};

class menu_item : public object {
  protected:
	menu_item(const std::string &title, std::function<void()> action);

  public:
	static std::unique_ptr<menu_item> create(const std::string &title,
	                                         std::function<void()> action);
	~menu_item() override;

	void set_shortcut(shortcut sc);

	NSMenuItem *get_native() const;

  private:
	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
