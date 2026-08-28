//
//  view.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-27.
//

#pragma once
#include "object.hpp"
#import <AppKit/AppKit.h>
#include <memory>
#include <vector>

namespace leaf {

class view : public object {
  protected:
	view();
	view(CGRect frame);

  public:
	static std::shared_ptr<view> create();
	static std::shared_ptr<view> create(CGRect frame);

	~view() override;

	NSView *get_native() const;

	// add views
	void add_subview(std::shared_ptr<view>);

	// control state
	void show();
	void hide();

	bool is_hidden();

	void set_translates_autoresizing_mask_into_constraints(bool);
	bool translates_autoresizing_mask_into_constraints() const;

	// set up
	// // Layer
	void set_wants_layer(bool);
	bool get_wants_layer() const;

	CALayer *get_layer() const;

	// // Frame
	CGRect get_frame() const;
	void set_frame(CGRect);

	// // Bounds
	CGRect get_bounds() const;
	void set_bounds(CGRect);

  protected:
	std::vector<std::shared_ptr<view>> subviews;
};

} // namespace leaf
