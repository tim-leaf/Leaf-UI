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
	checkbox(bool &);
	checkbox(bool &, const CGRect frame);

  public:
	static std::shared_ptr<checkbox> create(bool &);
	static std::shared_ptr<checkbox> create(bool &, const CGRect frame);

	~checkbox() override;

	NSButton *get_native() const;

	void add_action(std::function<void()>);

	bool get_state() const;

	void set_checked(bool);

	void set_title(const std::string &);
	bool is_checked() const;

  private:
	bool &state_ref;

	void init_callback();
	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
