//
//  File.swift
//
//
//  Created by Aleks Rutins on 11/19/22.
//

import Foundation
#if os(macOS)
import Cocoa
#else
import Gtk
#endif

public enum WindowStyle {
    case normal, insetTitleBar, nonResizable, hideTitle, closeOnly, noControls
}

public struct Window {
    #if os(macOS)
    public typealias InternalType = NSWindow
    #else
    public typealias InternalType = Gtk.WindowRef
    #endif

    public let internalWnd: InternalType

    public init(title: String, style: WindowStyle) {
        #if os(macOS)
        internalWnd = NSWindow()
        internalWnd.title = title
        internalWnd.styleMask =
              style == .insetTitleBar ? .closable.union(.unifiedTitleAndToolbar).union(.resizable).union(.miniaturizable)
            : style == .nonResizable ? .closable.union(.titled).union(.miniaturizable)
            : style == .closeOnly ? .closable.union(.titled)
            : style == .noControls ? .titled
            : style == .hideTitle ? .closable.union(.resizable).union(.miniaturizable)
            : .closable.union(.titled).union(.resizable).union(.miniaturizable);
        #else
        #endif
    }

    public func show() {
        #if os(macOS)
        internalWnd.makeKeyAndOrderFront(nil)
        #else
        #endif
    }

    public func add(_ widget: InternalWidget) {
        #if os(macOS)
        internalWnd.contentView?.addSubview(widget)
        #else
        #endif
    }
}
