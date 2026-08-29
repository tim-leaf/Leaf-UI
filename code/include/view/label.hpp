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
	label(std::string &n_text);
	label(std::string &n_text, CGRect frame);

  public:
	static std::shared_ptr<label> create(std::string &text);
	static std::shared_ptr<label> create(std::string &text, CGRect frame);

	~label() override;

	// setters / getters
	NSTextField *get_native() const;

	void set_text(const std::string &);

	void set_bordered(const bool);
	void set_draw_background(const bool);

  private:
	std::string &text_ref;
};

} // namespace leaf
