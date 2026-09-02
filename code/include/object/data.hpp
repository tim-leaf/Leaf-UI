//
//  data.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-09-01.
//

#pragma once
#include "object.hpp"
#include <AppKit/AppKit.h>
#include <filesystem>
#include <memory>
#include <string>

namespace leaf {

class data : public object {
  private:
	data(data *);
	data(const std::filesystem::path &);
	data(const std::string &, const NSDataBase64EncodingOptions =
	                              NSDataBase64Encoding64CharacterLineLength);

  public:
	static std::shared_ptr<data> create_from_data(data *);

	static std::shared_ptr<data>
	create_from_file(const std::filesystem::path &);

	static std::shared_ptr<data>
	create_from_b64_str(const std::string &,
	                    const NSDataBase64EncodingOptions =
	                        NSDataBase64Encoding64CharacterLineLength);

	~data() override;

	NSData *get_native() const;
};

} // namespace leaf
