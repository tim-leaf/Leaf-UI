//
//  label.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#pragma once
#include "view.hpp"
#import <AppKit/AppKit.h>
#include <memory>
#include <string>

namespace leaf {

class label : public view {
  protected:
	label(const std::string &text);
	label(const std::string &text, CGRect frame);

  public:
	static std::shared_ptr<label> create(const std::string &text);
	static std::shared_ptr<label> create(const std::string &text, CGRect frame);

	~label() override;

	// setters / getters
	NSTextField *get_native() const;

	void set_text(const std::string &);

	void set_bordered(bool);
	void set_draw_background(bool);
};

} // namespace leaf
