import UIKit

public let DZUtils = DZUtilities.shared

public struct DZUtilities {

    public static let shared = DZUtilities()

    private init() {
    }
    
    public func loadFonts() {
        func getFontsURLs() -> [URL]? {
            if let resourceURL = Bundle.main.resourceURL {
                let fontsURL = resourceURL.appendingPathComponent("Fonts")
                guard var URLs = try? FileManager.default.contentsOfDirectory(at: fontsURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles) else {
                    return nil
                }
                URLs = URLs.filter { $0.absoluteString.contains(".ttf") }
                return URLs
            }
            return nil
        }

        let fonts = getFontsURLs()
        fonts?.forEach{ url in
            do {
                let inData: NSData = try NSData(contentsOfFile: url.path)
                let error: UnsafeMutablePointer<Unmanaged<CFError>?>? = nil
                let provider = CGDataProvider.init(data:inData)
                if let font = CGFont.init(provider!) {
                    if (!CTFontManagerRegisterGraphicsFont(font, error)) {
                        print(error.debugDescription)
                    }
                }
                CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
                print("Loaded : \(url.lastPathComponent)")
            } catch {
                print("error \(url) - \(error.localizedDescription)")
            }
        }
    }
    
}
