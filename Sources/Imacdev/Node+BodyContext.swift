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
                    .class("site-name"),
                    .href("/"),
                    .text(context.site.name)
                ),
                .nav(
                    .ul(.li(
                            forEach(context.sections, { element -> Node<Context> in
                                .a(
                                    .href(element.path),
                                    .text(element.title)
                                )
                            }) // For Each
                        )// li
                    ) // ul
                ) // nav
            ) // wrapper
        ) // header
    }
}

