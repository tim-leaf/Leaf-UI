//
//  callback.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#import <AppKit/AppKit.h>
#include <functional>

#pragma mark - Callback
namespace leaf {

class callback {
  public:
	callback(std::function<void()> func);

	void invoke();

  private:
	std::function<void()> func;
};

} // namespace leaf

#pragma mark - Callback Target
@interface leaf_callback_target : NSObject

- (instancetype)initWithCallback:(leaf::callback *)callback;

- (void)invoke:(id)sender;

@end
