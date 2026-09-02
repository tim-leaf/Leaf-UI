//
//  timer.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-09-01.
//

#pragma once
#include "callback.hpp"
#include "object.hpp"
#import <AppKit/AppKit.h>
#include <functional>
#include <memory>

namespace leaf {

class timer : public object {
  private:
	timer(const double, const bool = true);

  public:
	static std::shared_ptr<timer> create(const double, const bool = true);

	~timer() override;

	void set_action(std::function<void()> n_action);

  private:
	void init_callback();

	std::unique_ptr<callback> _callback;
	leaf_callback_target *_target;
};

} // namespace leaf
