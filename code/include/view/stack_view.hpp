//
//  stack_view.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-30.
//

#pragma once
#include "view.hpp"
#import <AppKit/AppKit.h>

namespace leaf {

class stack_view : public view {
  private:
	stack_view();
	stack_view(const CGRect frame);

  public:
	static std::shared_ptr<stack_view> create();
	static std::shared_ptr<stack_view> create(const CGRect frame);

	NSStackView *get_native() const;

	void add_arranged_subview(std::shared_ptr<view> n_subview);

	void set_orientation(const NSUserInterfaceLayoutOrientation);
	NSUserInterfaceLayoutOrientation get_orientation() const;

	void set_spacing(const float);
	double get_spacing() const;

	void set_alignment(const NSLayoutAttribute);
	NSLayoutAttribute get_alignment() const;

  protected:
	std::vector<std::shared_ptr<view>> subviews;
};

} // namespace leaf
