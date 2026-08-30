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
	friend class window;
	friend class stack_view;

  protected:
	view();
	view(const CGRect frame);

	view *superview = nullptr;
	void set_superview(view *);
	void remove_from_superview();

  public:
	static std::shared_ptr<view> create();
	static std::shared_ptr<view> create(const CGRect frame);

	~view() override;

	NSView *get_native() const;

	void add_subview(std::shared_ptr<view>);
	view *get_superview() const;

	// control state
	void show();
	void hide();

	void set_hidden(bool);
	bool is_hidden() const;

	void set_translates_autoresizing_mask_into_constraints(bool);
	bool translates_autoresizing_mask_into_constraints() const;

  public:
	//  Layer
	void set_wants_layer(bool);
	bool get_wants_layer() const;

	CALayer *get_layer() const;

	//  Frame
	CGRect get_frame() const;
	void set_frame(CGRect);

	//  Bounds
	CGRect get_bounds() const;
	void set_bounds(CGRect);

	// Alpha
	void set_alpha(double);
	double get_alpha() const;

	// Anchors
	void pin_to_parent();

	void set_top_anchor(NSLayoutYAxisAnchor *);
	void set_bottom_anchor(NSLayoutYAxisAnchor *);
	NSLayoutYAxisAnchor *centerY_anchor() const;
	NSLayoutYAxisAnchor *top_anchor() const;
	NSLayoutYAxisAnchor *bottom_anchor() const;

	void set_leading_anchor(NSLayoutXAxisAnchor *);
	void set_trailing_anchor(NSLayoutXAxisAnchor *);
	NSLayoutXAxisAnchor *centerX_anchor() const;
	NSLayoutXAxisAnchor *left_anchor() const;
	NSLayoutXAxisAnchor *right_anchor() const;
	NSLayoutXAxisAnchor *leading_anchor() const;
	NSLayoutXAxisAnchor *trailing_anchor() const;

	NSLayoutDimension *width_anchor() const;
	NSLayoutDimension *height_anchor() const;

	// Subviews
	size_t subview_count() const;
	view *get_subview(size_t idx) const;

	// Resizing
	void set_autoresizing_mask(NSAutoresizingMaskOptions);
	NSAutoresizingMaskOptions get_autoresizing_mask() const;

  protected:
	std::vector<std::shared_ptr<view>> subviews;
};

} // namespace leaf
