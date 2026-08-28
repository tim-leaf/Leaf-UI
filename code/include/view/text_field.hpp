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
	text_field(std::string &n_text);
	text_field(std::string &n_text, CGRect frame);

  public:
	static std::shared_ptr<text_field> create(std::string &text);
	static std::shared_ptr<text_field> create(std::string &text, CGRect frame);

	~text_field() override;

	NSTextField *get_native() const;

	void add_action(std::function<void()>);

	void set_allows_empty(const bool);
	bool get_allows_empty() const;

	void set_text(const std::string &);
	std::string get_text() const;

  private:
	std::string &text_ref;
	bool allows_empty = false;

	void init_callback();
	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
