//
//  HtmlFactory.swift
//  
//
//  Created by Sergey Teryokhin on 12/28/20.
//

import Foundation
import Publish
import Plot

struct ImacdevHtmlFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .head(for: index, on: context.site),
            .body(
                .imacdevHeader(for: context),

                .wrapper(
                    .ul(
                        .class("item-list"),
                        .forEach(
                            context.allItems(sortedBy: \.date, order: .descending)
                        ) { item in
                            .li(
                                .article(
                                    .h1(.a(.href(item.path), .text(item.title))),
                                    .p(.text(item.description))
                                ) // article
                            ) // li
                        } // forEach
                    ) // ul
                ) // wrapper
            ) // body
        ) // HTML
    }

    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        try makeIndexHTML(for: context.index, context: context)
    }

    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .head(for: item, on: context.site),

            .body(
                .imacdevHeader(for: context),

                .wrapper(
                    .article(
                        .contentBody(item.body)
                    )
                ) //wrapper
            ) //body
        )
    }

    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        try makeIndexHTML(for: context.index, context: context)
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }
}
