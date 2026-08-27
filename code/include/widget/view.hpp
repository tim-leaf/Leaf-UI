//
//  view.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-25.
//

#pragma once
#include "widget.hpp"
#include <memory>
#include <vector>

namespace leaf {

class view : public widget {
  public:
	view(std::weak_ptr<element> parent);
	~view() override;

	NSView *get_native() override;
	void add_widget(std::shared_ptr<widget> n_widget);

	// debugging options
  public:
	void set_debug_border(bool);

  private:
	NSView *_native;
	std::vector<std::shared_ptr<widget>> widgets;
};

} // namespace leaf
