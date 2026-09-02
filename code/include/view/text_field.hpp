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
#include <sstream>
#include <string>

namespace leaf {

class text_field : public view {
  protected:
	text_field(const std::string &n_text);
	text_field(const std::string &n_text, const CGRect frame);

  public:
	static std::shared_ptr<text_field> create(const std::string &text);
	static std::shared_ptr<text_field> create(const std::string &text,
	                                          const CGRect frame);

	~text_field() override;

	NSTextField *get_native() const;

	void set_action(std::function<void()>);

	void set_text(const std::string &);
	void set_text(const std::stringstream &);

	std::string get_text() const;

  private:
	void init_callback();

	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
