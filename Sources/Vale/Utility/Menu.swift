import Foundation
#if os(macOS)
import Cocoa
public typealias BaseMenuType = NSMenu
public typealias BaseMenuItemType = NSMenuItem
#else
import Gtk
#endif

public struct Selectors {
    #if os(macOS)
    public static let quit = #selector(NSApplication.terminate(_:));
    #endif
}

public struct MenuItem {

    let baseItem: BaseMenuItemType

    public init() {
        self.baseItem = NSMenuItem()
    }
    public init(title: String) {
        self.init()
        self.baseItem.title = title
    }
    public init(title: String, action: Selector) {
        self.init(title: title)
        self.baseItem.action = action
    }
    public init(title: String, action: Selector, keyEquivalent: String) {
        self.init(title: title, action: action)
        self.baseItem.keyEquivalent = keyEquivalent
    }
    public init(title: String, action: Selector, keyEquivalent: String, @Menu _ submenu: () -> BaseMenuType) {
        self.init(title: title, action: action, keyEquivalent: keyEquivalent)
        self.baseItem.submenu = submenu()
    }
    public init(title: String, @Menu _ submenu: () -> BaseMenuType) {
        self.init(title: title)
        self.baseItem.submenu = submenu()
    }
    public init(title: String, action: Selector, @Menu _ submenu: () -> BaseMenuType) {
        self.init(title: title, action: action)
        self.baseItem.submenu = submenu()
    }
}

@resultBuilder
public struct Menu {
    private init() {}
    public static func buildBlock(_ components: MenuItem...) -> BaseMenuType {
        #if os(macOS)
        let menu = NSMenu()
        for item in components {
            menu.addItem(item.baseItem)
        }
        return menu
        #endif
    }

    public static func build(@Menu _ menu: () -> BaseMenuType) -> BaseMenuType {
        menu()
    }
}