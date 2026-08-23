//
//  log.hpp
//  Leaf-UI
//
//  Created by Tim Le Flem on 2026-08-21.
//

#pragma once
#include <os/log.h>
#include <string>

namespace logs {

static inline const os_log_t main = os_log_create("com.timleaf", "main");

} // namespace logs
