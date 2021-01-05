//
//  Node+BodyContext.swift
//  
//
//  Created by Sergey Teryokhin on 12/28/20.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }

    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                    )),
                     .p(.text(item.description))
                ))
            }
        )
    }
}

extension Node where Context == HTML.BodyContext {
    static func imacdevHeader<T: Website>(for context: PublishingContext<T>, selectedSection: T.SectionID? = nil) -> Node {
        .header(
            .wrapper(
                .a(
                    .class(CSS.headerContainer),
                    .href("/"),
                        .img(
                            .class(CSS.headerLogo),
                            .src("/images/logo.png")
                        ),
                        .span(
                            .class(CSS.headerText),
                            .text(context.site.name)
                        )
                ),
                .nav(
                    .ul(.forEach(context.sections) { section in
                        .li(
                            .class(CSS.sectionName),
                            .a(
                                .class(selectedSection == section.id ? CSS.selected : ""),
                                .href(section.path),
                                .text(sectionDisplayName(section.id.rawValue))
                            ) // a
                        ) // li
                    }) // ul
                ) // nav
            ) // wrapper
        ) // header
    }

    static func sectionTitle<T: Website>(section: Section<T>) -> Node {
        .wrapper(
            .h1(
                .class(CSS.sectionName),
                .text(sectionDisplayName(section.id.rawValue))
            )
        )
    }

    static func tagList<T: Website>(for item: Item<T>, on site: T) -> Node {
        return .ul(.class(CSS.tagList), .forEach(item.tags) { tag in
            .li(.a(
                .href(site.path(for: tag)),
                .text(tag.string)
            ))
        })
    }

    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .text("Generated using "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish")
                )
            ),
            .p(.a(
                .text("RSS feed"),
                .href("/feed.rss")
            ))
        )
    }

    static func sectionDisplayName(_ sectionId: String) -> String {
        let id = ImacdevWebsite.SectionID(rawValue: sectionId)
        switch id {
        case .blog:
            return "Блог"
        case .development:
            return "Разработка"
        case .video:
            return "Видео"
        case .about:
            return "Обо мне"
        case .none:
            return ""
        }
    }
}

