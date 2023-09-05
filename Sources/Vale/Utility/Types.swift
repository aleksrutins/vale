#if os(macOS)
import AppKit
public typealias InternalWidget = NSView
#else
import Gtk
public typealias InternalWidget = Gtk.WidgetRef
#endif
