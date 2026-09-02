//
//  image_view.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-09-01.
//

#include "image_view.hpp"
#include "image.hpp"

#pragma mark - interface
@implementation leaf_image_cell

- (void)setInterpolation:(NSImageInterpolation)interpolation {
	_interpolation = interpolation;
	// removed this line as setNeeds... is not a NSImageCell method
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
	NSGraphicsContext *current = [NSGraphicsContext currentContext];

	NSImageInterpolation previous = current.imageInterpolation;
	current.imageInterpolation = _interpolation;

	[super drawWithFrame:cellFrame inView:controlView];

	current.imageInterpolation = previous;
}

@end

#pragma mark - construction / destruction
leaf::image_view::image_view() {
	_native = [[NSImageView alloc] init]; //
	[get_native() setCell:[[leaf_image_cell alloc] init]];
}

std::shared_ptr<leaf::image_view> leaf::image_view::create() {
	return std::shared_ptr<image_view>(new image_view());
}

leaf::image_view::image_view(const CGRect frame) {
	_native = [[NSImageView alloc] initWithFrame:frame]; //
	[get_native() setCell:[[leaf_image_cell alloc] init]];
}

std::shared_ptr<leaf::image_view> leaf::image_view::create(const CGRect frame) {
	return std::shared_ptr<image_view>(new image_view(frame));
}

leaf::image_view::~image_view() {
	[_native release]; //
}

#pragma mark - setters / getters
NSImageView *leaf::image_view::get_native() const {
	return static_cast<NSImageView *>(_native); //
}

void leaf::image_view::set_image(std::shared_ptr<image> n_image) {
	[get_native() setImage:n_image->get_native()]; //

	n_image->superview = this;
}

void leaf::image_view::set_scaling(const NSImageScaling scaling) {
	[get_native() setImageScaling:scaling]; //
}

void leaf::image_view::set_interpolation(
    const NSImageInterpolation n_interpolation) {

	interpolation_mode = n_interpolation; //

	leaf_image_cell *cell = static_cast<leaf_image_cell *>([get_native() cell]);

	[cell setInterpolation:n_interpolation];

	set_needs_display(true);
}
