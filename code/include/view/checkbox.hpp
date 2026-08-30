//
//  checkbox.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#pragma once
#include "callback.hpp"
#include "view.hpp"
#import <AppKit/AppKit.h>

namespace leaf {

class checkbox : public view {
  protected:
	checkbox();
	checkbox(const CGRect frame);

  public:
	static std::shared_ptr<checkbox> create();
	static std::shared_ptr<checkbox> create(const CGRect frame);

	~checkbox() override;

	NSButton *get_native() const;

	void set_title(const std::string &);

	void set_action(std::function<void()>);

	void set_checked(bool);
	bool is_checked() const;

  private:
	void init_callback();

	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
