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
                .wrapper(
                    .a(
                        .class(css.siteName),
                        .href("/"),
                        .text(context.site.name)
                    )
                ),
                .nav(
                    .ul(.forEach(context.sections) {
                            .li(
                                .a(
                                    .href($0.path),
                                    .text($0.title)
                                ) // a
                            ) // li
                        } // For Each
                    ) // ul
                ) // nav
            ) // wrapper
        ) // header
    }
}

