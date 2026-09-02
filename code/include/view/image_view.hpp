//
//  image_view.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-09-01.
//

#pragma once

#include "view.hpp"
#import <AppKit/AppKit.h>
#include <memory>

@interface leaf_image_cell : NSImageCell {
	NSImageInterpolation _interpolation;
}

- (void)setInterpolation:(NSImageInterpolation)interpolation;
@end

namespace leaf {

class image;

class image_view : public view {
  private:
	image_view();
	image_view(const CGRect);

  public:
	static std::shared_ptr<image_view> create();
	static std::shared_ptr<image_view> create(const CGRect);

	~image_view() override;

	NSImageView *get_native() const;

	void set_image(std::shared_ptr<image> n_image);
	void set_scaling(const NSImageScaling);

	void set_interpolation(const NSImageInterpolation);

  private:
	NSImageInterpolation interpolation_mode = NSImageInterpolationDefault;
};

} // namespace leaf
