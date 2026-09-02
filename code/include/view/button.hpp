//
//  button.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-27.
//

#pragma once
#include "callback.hpp"
#include "image.hpp"
#include "view.hpp"
#import <AppKit/AppKit.h>
#include <functional>
#include <string>

namespace leaf {

class button : public view {
  protected:
	button();
	button(const CGRect frame);

  public:
	static std::shared_ptr<button> create();
	static std::shared_ptr<button> create(const CGRect frame);
	~button() override;

	NSButton *get_native() const;

	void set_title(const std::string &title);
	void set_action(std::function<void()>);

	void set_style(const NSBezelStyle);
	void set_image(std::shared_ptr<image>);

  private:
	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
