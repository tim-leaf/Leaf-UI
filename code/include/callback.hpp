//
//  callback.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-20.
//

#pragma once
#include <functional>

namespace leaf {

class callback {
  public:
	callback(std::function<void()> func);

	void invoke();

  private:
	std::function<void()> func;
};

} // namespace leaf
