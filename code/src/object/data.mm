//
//  data.cpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-09-01.
//

#include "data.hpp"

#pragma mark - construction / destruction

/// Initializes a data object with the contents of another data object.
leaf::data::data(data *cp_data) {
	_native = [[NSData alloc] initWithData:cp_data->get_native()];
}

/// Initializes a data object with the contents of another data object.
std::shared_ptr<leaf::data> leaf::data::create_from_data(data *cp_data) {
	return std::shared_ptr<data>(new data(cp_data));
}

/// Initializes a data object with the content of a base64 string.
leaf::data::data(const std::string &b64_str,
                 const NSDataBase64EncodingOptions n_options) {

	NSString *ns_b64_str = [NSString stringWithUTF8String:b64_str.c_str()];
	_native = [[NSData alloc] initWithBase64EncodedString:ns_b64_str
	                                              options:n_options];
}

/// Initializes a data object with the content of a base64 string.
std::shared_ptr<leaf::data> leaf::data::create_from_b64_str //
    (const std::string &b64_str, const NSDataBase64EncodingOptions n_options) {

	return std::shared_ptr<data>(new data(b64_str, n_options));
}

/// Initializes a data object with the content of the file at a given path.
leaf::data::data(const std::filesystem::path &file_path) {
	NSString *ns_file_path = [NSString stringWithUTF8String:file_path.c_str()];
	_native = [[NSData alloc] initWithContentsOfFile:ns_file_path]; //
}

/// Initializes a data object with the content of the file at a given path.
std::shared_ptr<leaf::data> leaf::data::create_from_file //
    (const std::filesystem::path &file_path) {

	return std::shared_ptr<data>(new data(file_path));
}

leaf::data::~data() {
	[_native release]; //
}

#pragma mark - setters / getters
NSData *leaf::data::get_native() const {
	return static_cast<NSData *>(_native); //
}
