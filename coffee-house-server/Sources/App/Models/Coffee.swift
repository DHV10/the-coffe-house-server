//
//  File.swift
//  
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import Vapor
import Fluent

final class Coffee: Model, Content {

    static let schema = "coffees"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "image")
    var image: String

    @Field(key: "title")
    var title: String

    @Field(key: "about")
    var about: String

    @Field(key: "rate")
    var rate: String

    @Field(key: "size")
    var size: [String]

    @Parent(key: "order_id")
    var order: Order

    init() {}

    init(
        id: UUID? = nil,
        image: String,
        title: String,
        about: String,
        rate: String,
        size: [String]
    ) {
        self.id = id
        self.image = image
        self.title = title
        self.about = about
        self.rate = rate
        self.size = size
    }
}
