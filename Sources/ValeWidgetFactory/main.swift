//
//  File.swift
//  
//
//  Created by Aleks Rutins on 11/18/22.
//

import Foundation
import Vale
import Cocoa


Application.run("com.rutins.ValeWidgetFactory") { app in
    let menu = Menu.build {
        MenuItem(title: "Vale Widget Factory") {
            MenuItem(title: "Quit", action: Selectors.quit, keyEquivalent: "q")
        }
        MenuItem(title: "File") 
    }
    app.app.mainMenu = menu
    let window = NSWindow(contentRect:NSMakeRect(0, 0, 200, 200),
                          styleMask: .closable.union(.titled).union(.resizable).union(.miniaturizable), backing: .buffered, defer: false)
    window.title = "Vale Widget Factory"
    window.makeKeyAndOrderFront(nil)
    window.contentView?.addSubview(NSButton(title: "Close", target: app, action: #selector(app.quit(_:))))
}
