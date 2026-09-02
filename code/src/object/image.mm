//
//  image.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-09-01.
//

#include "image.hpp"

#pragma mark - construction / destruction
leaf::image::image() {
	_native = [[NSImage alloc] init]; //
}

std::shared_ptr<leaf::image> leaf::image::create() {
	return std::shared_ptr<image>(new image()); //
}

leaf::image::image(std::shared_ptr<data> n_data) {
	_native = [[NSImage alloc] initWithData:n_data->get_native()]; //
}

std::shared_ptr<leaf::image> leaf::image::create(std::shared_ptr<data> n_data) {
	return std::shared_ptr<image>(new image(n_data)); //
}

leaf::image::image(const std::string &name) {
	NSString *ns_name = [NSString stringWithUTF8String:name.c_str()];

	_native = [NSImage imageNamed:ns_name];
}

std::shared_ptr<leaf::image> leaf::image::create(const std::string &name) {
	return std::shared_ptr<image>(new image(name));
}

leaf::image::~image() {
	[_native release]; //
}

#pragma mark - setters / getters
NSImage *leaf::image::get_native() const {
	return static_cast<NSImage *>(_native); //
}

#pragma mark - helpers
bool leaf::image::exists() {
	return get_native() != nil; //
}
