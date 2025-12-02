// RetroPad.zig
// This is a lightweight application with Windows XP Notepad-like menu and main window.

const std = @import("std");
const c = @import("std").c;

pub fn main() void {
    // Initialize the application
    const allocator = std.heap.page_allocator;
    defer allocator.destroy();

    // Create the main application window
    const mainWindowTitle = "RetroPad";
    const window = c.gtk_window_new(c.GTK_WINDOW_TOPLEVEL);
    c.gtk_window_set_title(window, mainWindowTitle.ptr);

    // Set default size (Width = 800, Height = 600)
    c.gtk_window_set_default_size(window, 800, 600);

    // Create and add the label widget
    const label = c.gtk_label_new("Welcome to RetroPad! This is your main window.");
    c.gtk_container_add(window, label);

    // Show main window with all widgets
    c.gtk_widget_show_all(window);
    
    // GTK Main Loop
    std.debug.warn("Starting GTK Main Loop\n", .{});
    c.gtk_main();
}