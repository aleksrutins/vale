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
    
    init(title: String, style: WindowStyle) {
        #if os(macOS)
        internalWnd = NSWindow()
        internalWnd.title = title
        
        #else
        #endif
    }
}
