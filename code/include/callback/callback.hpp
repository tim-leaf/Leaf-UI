//
//  callback.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-24.
//

#pragma once
#import <AppKit/AppKit.h>
#include <functional>
#include <memory>

#pragma mark - Callback
namespace leaf {

class callback {
  protected:
	callback();
	callback(std::function<void()>);

  public:
	static std::unique_ptr<callback> create();
	static std::unique_ptr<callback> create(std::function<void()>);

	void set_action(std::function<void()>);

	void invoke();

	std::function<void()> get_action() const;

  private:
	std::function<void()> action = []() {};
};

} // namespace leaf

#pragma mark - Callback Target
@interface leaf_callback_target : NSObject

- (instancetype)initWithCallback:(leaf::callback *)callback;

- (void)invoke:(id)sender;

@end
