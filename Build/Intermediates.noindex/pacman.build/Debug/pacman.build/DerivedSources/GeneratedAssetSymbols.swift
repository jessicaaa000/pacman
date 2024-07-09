import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "blinkydol" asset catalog image resource.
    static let blinkydol = DeveloperToolsSupport.ImageResource(name: "blinkydol", bundle: resourceBundle)

    /// The "blinkygora" asset catalog image resource.
    static let blinkygora = DeveloperToolsSupport.ImageResource(name: "blinkygora", bundle: resourceBundle)

    /// The "blinkylewo" asset catalog image resource.
    static let blinkylewo = DeveloperToolsSupport.ImageResource(name: "blinkylewo", bundle: resourceBundle)

    /// The "blinkyprawo" asset catalog image resource.
    static let blinkyprawo = DeveloperToolsSupport.ImageResource(name: "blinkyprawo", bundle: resourceBundle)

    /// The "clydedol" asset catalog image resource.
    static let clydedol = DeveloperToolsSupport.ImageResource(name: "clydedol", bundle: resourceBundle)

    /// The "clydegora" asset catalog image resource.
    static let clydegora = DeveloperToolsSupport.ImageResource(name: "clydegora", bundle: resourceBundle)

    /// The "clydelewo" asset catalog image resource.
    static let clydelewo = DeveloperToolsSupport.ImageResource(name: "clydelewo", bundle: resourceBundle)

    /// The "clydeprawo" asset catalog image resource.
    static let clydeprawo = DeveloperToolsSupport.ImageResource(name: "clydeprawo", bundle: resourceBundle)

    /// The "inkydol" asset catalog image resource.
    static let inkydol = DeveloperToolsSupport.ImageResource(name: "inkydol", bundle: resourceBundle)

    /// The "inkygora" asset catalog image resource.
    static let inkygora = DeveloperToolsSupport.ImageResource(name: "inkygora", bundle: resourceBundle)

    /// The "inkylewo" asset catalog image resource.
    static let inkylewo = DeveloperToolsSupport.ImageResource(name: "inkylewo", bundle: resourceBundle)

    /// The "inkyprawo" asset catalog image resource.
    static let inkyprawo = DeveloperToolsSupport.ImageResource(name: "inkyprawo", bundle: resourceBundle)

    /// The "kropka" asset catalog image resource.
    static let kropka = DeveloperToolsSupport.ImageResource(name: "kropka", bundle: resourceBundle)

    /// The "pacman" asset catalog image resource.
    static let pacman = DeveloperToolsSupport.ImageResource(name: "pacman", bundle: resourceBundle)

    /// The "pacmandol1" asset catalog image resource.
    static let pacmandol1 = DeveloperToolsSupport.ImageResource(name: "pacmandol1", bundle: resourceBundle)

    /// The "pacmandol2" asset catalog image resource.
    static let pacmandol2 = DeveloperToolsSupport.ImageResource(name: "pacmandol2", bundle: resourceBundle)

    /// The "pacmandol3" asset catalog image resource.
    static let pacmandol3 = DeveloperToolsSupport.ImageResource(name: "pacmandol3", bundle: resourceBundle)

    /// The "pacmandol4" asset catalog image resource.
    static let pacmandol4 = DeveloperToolsSupport.ImageResource(name: "pacmandol4", bundle: resourceBundle)

    /// The "pacmangora1" asset catalog image resource.
    static let pacmangora1 = DeveloperToolsSupport.ImageResource(name: "pacmangora1", bundle: resourceBundle)

    /// The "pacmangora2" asset catalog image resource.
    static let pacmangora2 = DeveloperToolsSupport.ImageResource(name: "pacmangora2", bundle: resourceBundle)

    /// The "pacmangora3" asset catalog image resource.
    static let pacmangora3 = DeveloperToolsSupport.ImageResource(name: "pacmangora3", bundle: resourceBundle)

    /// The "pacmangora4" asset catalog image resource.
    static let pacmangora4 = DeveloperToolsSupport.ImageResource(name: "pacmangora4", bundle: resourceBundle)

    /// The "pacmanlewo1" asset catalog image resource.
    static let pacmanlewo1 = DeveloperToolsSupport.ImageResource(name: "pacmanlewo1", bundle: resourceBundle)

    /// The "pacmanlewo2" asset catalog image resource.
    static let pacmanlewo2 = DeveloperToolsSupport.ImageResource(name: "pacmanlewo2", bundle: resourceBundle)

    /// The "pacmanlewo3" asset catalog image resource.
    static let pacmanlewo3 = DeveloperToolsSupport.ImageResource(name: "pacmanlewo3", bundle: resourceBundle)

    /// The "pacmanlewo4" asset catalog image resource.
    static let pacmanlewo4 = DeveloperToolsSupport.ImageResource(name: "pacmanlewo4", bundle: resourceBundle)

    /// The "pacmanprawo1" asset catalog image resource.
    static let pacmanprawo1 = DeveloperToolsSupport.ImageResource(name: "pacmanprawo1", bundle: resourceBundle)

    /// The "pacmanprawo2" asset catalog image resource.
    static let pacmanprawo2 = DeveloperToolsSupport.ImageResource(name: "pacmanprawo2", bundle: resourceBundle)

    /// The "pacmanprawo3" asset catalog image resource.
    static let pacmanprawo3 = DeveloperToolsSupport.ImageResource(name: "pacmanprawo3", bundle: resourceBundle)

    /// The "pacmanprawo4" asset catalog image resource.
    static let pacmanprawo4 = DeveloperToolsSupport.ImageResource(name: "pacmanprawo4", bundle: resourceBundle)

    /// The "pinkydol" asset catalog image resource.
    static let pinkydol = DeveloperToolsSupport.ImageResource(name: "pinkydol", bundle: resourceBundle)

    /// The "pinkygora" asset catalog image resource.
    static let pinkygora = DeveloperToolsSupport.ImageResource(name: "pinkygora", bundle: resourceBundle)

    /// The "pinkylewo" asset catalog image resource.
    static let pinkylewo = DeveloperToolsSupport.ImageResource(name: "pinkylewo", bundle: resourceBundle)

    /// The "pinkyprawo" asset catalog image resource.
    static let pinkyprawo = DeveloperToolsSupport.ImageResource(name: "pinkyprawo", bundle: resourceBundle)

    /// The "vulnerableghoast" asset catalog image resource.
    static let vulnerableghoast = DeveloperToolsSupport.ImageResource(name: "vulnerableghoast", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "blinkydol" asset catalog image.
    static var blinkydol: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blinkydol)
#else
        .init()
#endif
    }

    /// The "blinkygora" asset catalog image.
    static var blinkygora: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blinkygora)
#else
        .init()
#endif
    }

    /// The "blinkylewo" asset catalog image.
    static var blinkylewo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blinkylewo)
#else
        .init()
#endif
    }

    /// The "blinkyprawo" asset catalog image.
    static var blinkyprawo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blinkyprawo)
#else
        .init()
#endif
    }

    /// The "clydedol" asset catalog image.
    static var clydedol: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .clydedol)
#else
        .init()
#endif
    }

    /// The "clydegora" asset catalog image.
    static var clydegora: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .clydegora)
#else
        .init()
#endif
    }

    /// The "clydelewo" asset catalog image.
    static var clydelewo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .clydelewo)
#else
        .init()
#endif
    }

    /// The "clydeprawo" asset catalog image.
    static var clydeprawo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .clydeprawo)
#else
        .init()
#endif
    }

    /// The "inkydol" asset catalog image.
    static var inkydol: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .inkydol)
#else
        .init()
#endif
    }

    /// The "inkygora" asset catalog image.
    static var inkygora: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .inkygora)
#else
        .init()
#endif
    }

    /// The "inkylewo" asset catalog image.
    static var inkylewo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .inkylewo)
#else
        .init()
#endif
    }

    /// The "inkyprawo" asset catalog image.
    static var inkyprawo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .inkyprawo)
#else
        .init()
#endif
    }

    /// The "kropka" asset catalog image.
    static var kropka: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .kropka)
#else
        .init()
#endif
    }

    /// The "pacman" asset catalog image.
    static var pacman: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacman)
#else
        .init()
#endif
    }

    /// The "pacmandol1" asset catalog image.
    static var pacmandol1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmandol1)
#else
        .init()
#endif
    }

    /// The "pacmandol2" asset catalog image.
    static var pacmandol2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmandol2)
#else
        .init()
#endif
    }

    /// The "pacmandol3" asset catalog image.
    static var pacmandol3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmandol3)
#else
        .init()
#endif
    }

    /// The "pacmandol4" asset catalog image.
    static var pacmandol4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmandol4)
#else
        .init()
#endif
    }

    /// The "pacmangora1" asset catalog image.
    static var pacmangora1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmangora1)
#else
        .init()
#endif
    }

    /// The "pacmangora2" asset catalog image.
    static var pacmangora2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmangora2)
#else
        .init()
#endif
    }

    /// The "pacmangora3" asset catalog image.
    static var pacmangora3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmangora3)
#else
        .init()
#endif
    }

    /// The "pacmangora4" asset catalog image.
    static var pacmangora4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmangora4)
#else
        .init()
#endif
    }

    /// The "pacmanlewo1" asset catalog image.
    static var pacmanlewo1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmanlewo1)
#else
        .init()
#endif
    }

    /// The "pacmanlewo2" asset catalog image.
    static var pacmanlewo2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmanlewo2)
#else
        .init()
#endif
    }

    /// The "pacmanlewo3" asset catalog image.
    static var pacmanlewo3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmanlewo3)
#else
        .init()
#endif
    }

    /// The "pacmanlewo4" asset catalog image.
    static var pacmanlewo4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmanlewo4)
#else
        .init()
#endif
    }

    /// The "pacmanprawo1" asset catalog image.
    static var pacmanprawo1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmanprawo1)
#else
        .init()
#endif
    }

    /// The "pacmanprawo2" asset catalog image.
    static var pacmanprawo2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmanprawo2)
#else
        .init()
#endif
    }

    /// The "pacmanprawo3" asset catalog image.
    static var pacmanprawo3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmanprawo3)
#else
        .init()
#endif
    }

    /// The "pacmanprawo4" asset catalog image.
    static var pacmanprawo4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pacmanprawo4)
#else
        .init()
#endif
    }

    /// The "pinkydol" asset catalog image.
    static var pinkydol: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pinkydol)
#else
        .init()
#endif
    }

    /// The "pinkygora" asset catalog image.
    static var pinkygora: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pinkygora)
#else
        .init()
#endif
    }

    /// The "pinkylewo" asset catalog image.
    static var pinkylewo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pinkylewo)
#else
        .init()
#endif
    }

    /// The "pinkyprawo" asset catalog image.
    static var pinkyprawo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pinkyprawo)
#else
        .init()
#endif
    }

    /// The "vulnerableghoast" asset catalog image.
    static var vulnerableghoast: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .vulnerableghoast)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "blinkydol" asset catalog image.
    static var blinkydol: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blinkydol)
#else
        .init()
#endif
    }

    /// The "blinkygora" asset catalog image.
    static var blinkygora: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blinkygora)
#else
        .init()
#endif
    }

    /// The "blinkylewo" asset catalog image.
    static var blinkylewo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blinkylewo)
#else
        .init()
#endif
    }

    /// The "blinkyprawo" asset catalog image.
    static var blinkyprawo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blinkyprawo)
#else
        .init()
#endif
    }

    /// The "clydedol" asset catalog image.
    static var clydedol: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .clydedol)
#else
        .init()
#endif
    }

    /// The "clydegora" asset catalog image.
    static var clydegora: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .clydegora)
#else
        .init()
#endif
    }

    /// The "clydelewo" asset catalog image.
    static var clydelewo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .clydelewo)
#else
        .init()
#endif
    }

    /// The "clydeprawo" asset catalog image.
    static var clydeprawo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .clydeprawo)
#else
        .init()
#endif
    }

    /// The "inkydol" asset catalog image.
    static var inkydol: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .inkydol)
#else
        .init()
#endif
    }

    /// The "inkygora" asset catalog image.
    static var inkygora: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .inkygora)
#else
        .init()
#endif
    }

    /// The "inkylewo" asset catalog image.
    static var inkylewo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .inkylewo)
#else
        .init()
#endif
    }

    /// The "inkyprawo" asset catalog image.
    static var inkyprawo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .inkyprawo)
#else
        .init()
#endif
    }

    /// The "kropka" asset catalog image.
    static var kropka: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .kropka)
#else
        .init()
#endif
    }

    /// The "pacman" asset catalog image.
    static var pacman: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacman)
#else
        .init()
#endif
    }

    /// The "pacmandol1" asset catalog image.
    static var pacmandol1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmandol1)
#else
        .init()
#endif
    }

    /// The "pacmandol2" asset catalog image.
    static var pacmandol2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmandol2)
#else
        .init()
#endif
    }

    /// The "pacmandol3" asset catalog image.
    static var pacmandol3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmandol3)
#else
        .init()
#endif
    }

    /// The "pacmandol4" asset catalog image.
    static var pacmandol4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmandol4)
#else
        .init()
#endif
    }

    /// The "pacmangora1" asset catalog image.
    static var pacmangora1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmangora1)
#else
        .init()
#endif
    }

    /// The "pacmangora2" asset catalog image.
    static var pacmangora2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmangora2)
#else
        .init()
#endif
    }

    /// The "pacmangora3" asset catalog image.
    static var pacmangora3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmangora3)
#else
        .init()
#endif
    }

    /// The "pacmangora4" asset catalog image.
    static var pacmangora4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmangora4)
#else
        .init()
#endif
    }

    /// The "pacmanlewo1" asset catalog image.
    static var pacmanlewo1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmanlewo1)
#else
        .init()
#endif
    }

    /// The "pacmanlewo2" asset catalog image.
    static var pacmanlewo2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmanlewo2)
#else
        .init()
#endif
    }

    /// The "pacmanlewo3" asset catalog image.
    static var pacmanlewo3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmanlewo3)
#else
        .init()
#endif
    }

    /// The "pacmanlewo4" asset catalog image.
    static var pacmanlewo4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmanlewo4)
#else
        .init()
#endif
    }

    /// The "pacmanprawo1" asset catalog image.
    static var pacmanprawo1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmanprawo1)
#else
        .init()
#endif
    }

    /// The "pacmanprawo2" asset catalog image.
    static var pacmanprawo2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmanprawo2)
#else
        .init()
#endif
    }

    /// The "pacmanprawo3" asset catalog image.
    static var pacmanprawo3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmanprawo3)
#else
        .init()
#endif
    }

    /// The "pacmanprawo4" asset catalog image.
    static var pacmanprawo4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pacmanprawo4)
#else
        .init()
#endif
    }

    /// The "pinkydol" asset catalog image.
    static var pinkydol: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pinkydol)
#else
        .init()
#endif
    }

    /// The "pinkygora" asset catalog image.
    static var pinkygora: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pinkygora)
#else
        .init()
#endif
    }

    /// The "pinkylewo" asset catalog image.
    static var pinkylewo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pinkylewo)
#else
        .init()
#endif
    }

    /// The "pinkyprawo" asset catalog image.
    static var pinkyprawo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .pinkyprawo)
#else
        .init()
#endif
    }

    /// The "vulnerableghoast" asset catalog image.
    static var vulnerableghoast: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .vulnerableghoast)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

