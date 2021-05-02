import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct ImacdevWebsite: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case blog
        case development
        case video
        case about
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
//try ImacdevWebsite().publish(withTheme: .sundellTheme)
try ImacdevWebsite().publish(withTheme: .imacdevTheme)

extension ImacdevWebsite.SectionID {
    func displayName() -> String { //where Site == ImacdevWebsite {
        switch self {
        case .blog:
            return "Блог"
        case .development:
            return "Разработка"
        case .video:
            return "Видео"
        case .about:
            return "Обо мне"
        }
    }
}
