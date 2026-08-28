//
//  button.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-27.
//

#pragma once
#include "callback.hpp"
#include "view.hpp"
#import <AppKit/AppKit.h>
#include <functional>
#include <string>

namespace leaf {

class button : public view {
  protected:
	button();
	button(CGRect frame);

  public:
	static std::shared_ptr<button> create();
	static std::shared_ptr<button> create(CGRect frame);
	~button() override;

	NSButton *get_native() const;

	void set_title(const std::string &title);
	void set_action(std::function<void()>);

  private:
	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
