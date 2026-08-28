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
