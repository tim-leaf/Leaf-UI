//
//  image.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-09-01.
//

#pragma once
#include "data.hpp"
#include "image_view.hpp"
#include "object.hpp"
#include "view.hpp"
#include <AppKit/AppKit.h>
#include <memory>

namespace leaf {

class image : public object {
	friend class image_view;

  private:
	image();
	image(std::shared_ptr<data>);
	image(const std::string &);

  public:
	static std::shared_ptr<image> create();
	static std::shared_ptr<image> create(std::shared_ptr<data> n_data);
	static std::shared_ptr<image> create(const std::string &);

	~image() override;

	NSImage *get_native() const;

	bool exists();

  private:
	view *superview = nullptr;
};

} // namespace leaf
