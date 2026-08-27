# LEAF-UI

## Description

Leaf-UI was made to allow C++ developers to create native macOS apps without having to handle the Obj-C part of AppKit.

It acts a wrapper for Obj-C classes and objects, so Obj-C syntax can be handled in the background.

For example: 
```objc
// before
NSWindow *window = [[NSWindow alloc] 
	initWithContentRect: NSMakeRect(0, 0, 800, 600)
	styleMask : NSWindowStyleMaskClosable  |
				NSWindowStyleMaskResizable |
				NSWindowStyleMaskTitled
	backing: NSBackingStoreBuffered
	defer: YES];
	
[window setTitle:@"My Application"];
[window makeKeyAndOrderFront:nil];
```

```cpp
// after
auto wind = make_unique<leaf::window>(
				CGRect({400, 200, 800, 600}),
				style_mask::closable |
				style_mask::miniaturizable |
				style_mask::resizable |
				style_mask::titled
			);
);

wind->set_title("Title");
wind->show();

app.add_window(std::move(wind));
```


## Classes Handled

- [x] `NSApplication`
- [x] `NSAppDelegate`
- [x] `NSWindow`
- [ ] `NSView`
- [x] `NSMenu`
- [x] `NSMenuItem`
- [ ] `NSButton`


## Specificities

---
### Callbacks

The Obj-C callbacks are replaced by C++ lambda functions.

For example:
```objc
// before
- (void)invoke:(id)sender{ NSLog(@"HELLO TEST"); }

NSMenuItem *item = [[NSMenuItem alloc]
						initWithTitle:@"Test Item"
						action:@selector(invoke:)
						keyEquivalent:@""];

[item setTarget:self];
```

```cpp
// after
auto item = std::make_unique<menu_item>(
				"Test Item",
				[] { /* do something */ }
			);
```


---
### AppDelegate

In order to be able to customize the applications, an app_delegate class was created to replace Obj-C's object inheriting `NSObject` and acting as a delegate. 

In order to do so, the `application_delegate` class was given default hooks, like:
```
std::function<bool()> should_terminate_after_last_window_closed = []() { return true; };
```

or:
```
std::function<void()> on_quit = []() {};
```


These function are then called from within an Obj-C app delegate object.
More importantly, they can be overriden thanks to the `application` class.

For example, to ask for the app to quit once all windows are closed, in Obj-C you would do:
```objc
@interface leaf_app_delegate : NSObject<NSApplicationDelegate>

@end

@implementation

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:
  (NSApplication *)sender { 
	    return YES; 
    }

@end
```

But in C++, you can now do:
```cpp
application app{};

app.on_quit(
	[&]() -> bool { 
		some_object.destroy();
		delete some_ptr;
		os_log_info(logs::main, "Application is quitting\n");
	}
);
```


---
### WindowDelegate

To be able to react to windows' events, a `leaf_window_delegate` was built as follows: 
```objc
@interface leaf_window_delegate : NSObject<NSWindowDelegate>

@property(nonatomic, assign) leaf::window *owner;

-(void)windowWillClose:(NSNotification *)notification;

@end
```

And the window class was modified. First, it was given a pointer to track its owner (`leaf::application`), and a `application::remove_window(window*)` method was exposed to the API. A `leaf::window::on_close` method that is called from within the `leaf_window_delegate::windowWillClose` was also created.

In the end: 
- When the `menu_item` "Close Window" ( ⌘ + W ) is called, it calls `[_native_window close]`.
- The window closing calls the `leaf_window_delegate::windowWillClose`, which in its turn calls `_owner_window->on_close()`
- `_owner_window->on_close()` calls `_owner_application->remove_window(this)`.

That way the `leaf::application` vector containing the windows doesn't retain the closed `NSWindow`s, and erasing their `std::unique_ptr`s destroys the corresponding `leaf::window` wrappers.


---
### Menu Bar

In Obj-C's AppKit, the menus work with 2 objects:
- `NSMenu`
- `NSMenuItem`

I decided to go in a different direction, and implement three objects:
- `menu_bar`
- `menu`
- `menu_item`

This way the hierarchy is as follow: `menu_bar` owns all `menu` objects. Each menu item owns its `menu_item` objects. This lets `menu_bar` act as a container for the `menu`s and `menu_item`s with its own methods to handle them such as `menu_bar::add_menu`.

This also dissipates the confusion of having several of the same `menu` objects acting respectively as a menu bar and sub-menus.

Menus Hierarchy Tree Example:
```
Menu Bar
│
├── File
│	├── New
│	├── Open
│	└── Quit
│
└── Edit
	├── Copy
	└── Paste
```


## Project Tree

```
Leaf-UI/code/
│
├── leaf_ui.hpp 		// entry point of the library
│
├── include/
│	├── callback/
│	│	└── callback.hpp
│	│
│	├── menu/
│	│	├── menu.hpp
│	│	├── menu_bar.hpp
│	│	└── menu_item.hpp
│	│
│	├── widget/
│	│	└── button.hpp
│	│
│	├── app_delegate.hpp
│	├── application.hpp
│	└── window.hpp
│
└── src/
	├── callback/
	│	└── callback.mm
	│
	├── menu/
	│	├── menu.mm
	│	├── menu_bar.mm
	│	└── menu_item.mm
	│
	├── widget/
	│	└── button.mm
	│
	├── app_delegate.mm
	├── application.mm
	└── window.mm
```
