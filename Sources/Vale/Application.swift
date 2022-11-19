import Foundation
#if os(macOS)
import AppKit
#else
import Gtk
#endif


#if os(macOS)
public typealias BaseApplication = NSApplication
#else
public typealias BaseApplication = Gtk.Application
#endif

@objc public class Application : NSObject {
    public let app: BaseApplication;

    private init(app: BaseApplication) {
        self.app = app
    }
    
    public static func run(_ id: String, initialize: (inout Application) -> Void) {
        #if os(macOS)
        var app = Application(app: NSApplication.shared)
        app.app.setActivationPolicy(.regular)
        initialize(&app)
        app.app.activate(ignoringOtherApps: true)
        app.app.run()
        #else
        Gtk.Application.run(startupHandler: nil) { app in
            initialize(&app)
        }
        #endif
    }

    @objc public func quit(_ sender: Any?) -> Void {
        print("Quitting")
        #if os(macOS)
        app.terminate(sender)
        #else
        print("Not Mac?")
        #endif
    }

    public var menu: BaseMenuType? {
        get {
            return app.mainMenu
        }
        set(newMenu) {
            app.mainMenu = newMenu
        }
    }
}
