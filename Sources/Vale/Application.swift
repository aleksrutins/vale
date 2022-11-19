import Foundation
#if os(macOS)
import AppKit
#else
import Gtk
#endif


#if os(macOS)
typealias BaseApplication = NSApplication
#else
typealias BaseApplication = Gtk.Application
#endif

public struct Application {
    let app: BaseApplication;
    
    static func run(id: String, initialize: (Application) -> Void) {
        #if os(macOS)
        let app = Application(app: NSApplication.shared)
        initialize(app)
        app.app.setActivationPolicy(.regular)
        app.app.run()
        #else
        Gtk.Application.run(startupHandler: nil) { app in
            initialize(app)
        }
        #endif
    }
}
