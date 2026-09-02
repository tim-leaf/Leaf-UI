//
//  segmented_control.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-31.
//

#pragma once
#include "callback.hpp"
#include "view.hpp"
#import <AppKit/AppKit.h>
#include <memory>

namespace leaf {

class segmented_control : public view {
  private:
	segmented_control();
	segmented_control(const CGRect frame);

  public:
	static std::shared_ptr<segmented_control> create();
	static std::shared_ptr<segmented_control> create(const CGRect frame);

	~segmented_control() override;

	NSSegmentedControl *get_native() const;

	void set_segment_count(const uint);
	uint get_segment_count() const;

	uint get_selected_segment() const;

	void set_label_at(const std::string &, const uint);

  protected:
	void init_callback();

	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

}; // namespace leaf
