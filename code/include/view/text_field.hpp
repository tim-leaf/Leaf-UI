//
//  text_field.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#pragma once
#include "callback.hpp"
#include "view.hpp"
#import <AppKit/AppKit.h>
#include <string>

namespace leaf {

class text_field : public view {
  protected:
	text_field();
	text_field(CGRect frame);

  public:
	static std::shared_ptr<text_field> create();
	static std::shared_ptr<text_field> create(CGRect frame);

	~text_field() override;

	NSTextField *get_native() const;

	void set_action(std::function<void()>);

	void set_text(const std::string &);
	std::string get_text() const;

  private:
	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
