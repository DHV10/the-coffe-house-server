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

    @Field(key: "prize")
    var prize: String

    @Field(key: "rate")
    var rate: String

    @Field(key: "size")
    var size: [String]

    @Field(key: "category")
    var category: String

    @Field(key: "isFavourite")
    var isFavourite: Bool
    
    @Field(key: "quantity")
    var quantity: Int

    init() {}

    init(
        id: UUID? = nil,
        image: String,
        title: String,
        about: String,
        prize: String,
        rate: String,
        size: [String],
        category: String,
        isFavourite: Bool,
        quantity: Int
    ) {
        self.id = id
        self.image = image
        self.title = title
        self.about = about
        self.rate = rate
        self.size = size
        self.category = category
        self.isFavourite = isFavourite
        self.prize = prize
        self.quantity = quantity
    }
}
