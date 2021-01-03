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
                    .ul(.forEach(context.sections) {
                        .li(
                            .class(CSS.sectionName),
                            .a(
                                .class(selectedSection == $0.id ? CSS.selected : ""),
                                .href($0.path),
                                .text($0.title)
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
                .text(section.title)
            )
        )
    }
}

