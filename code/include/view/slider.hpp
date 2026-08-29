//
//  slider.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-28.
//

#pragma once
#include "callback.hpp"
#include "view.hpp"
#import <AppKit/AppKit.h>
#include <functional>

namespace leaf {

class slider : public view {
  protected:
	slider(double &value_ref);
	slider(double &value_ref, CGRect frame);

  public:
	static std::shared_ptr<slider> create(double &value_ref);
	static std::shared_ptr<slider> create(double &value_ref, CGRect frame);

	~slider();

	NSSlider *get_native() const;

	void add_action(std::function<void()>);

	void set_max(const double);
	void set_min(const double);

	void set_neutral_value(const double);

	void set_continuous(bool);
	bool get_continuous() const;

	void set_allows_tick_mark_values_only(const bool);
	void set_number_of_tick_marks(const uint);

	void set_slider_style(const NSSliderType);

	double get_value() const;

  private:
	double &value_ref;

	void init_callback();

	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
