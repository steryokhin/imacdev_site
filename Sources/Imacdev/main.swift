import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Imacdev: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case blog = "Blog"
        case articles = "Articles"
        case video = "Video"
        case about = "About"
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://127.0.0.1")!
    var name = "iMacDev"
    var description = "iMacDev Blog"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try Imacdev().publish(withTheme: .foundation)
