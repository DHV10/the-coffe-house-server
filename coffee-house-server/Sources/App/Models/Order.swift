//
//  File.swift
//
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import Vapor
import Fluent

final class Order: Model, Content {

    static let schema = "orders"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "paymentMethod")
    var paymentMethod: String

    @Field(key: "total")
    var total: String

    @Field(key: "listCoffee")
    var listCoffee: [String]

    @Parent(key: "profile_id")
    var profile: Profile

    init() {}

    init(
        id: UUID? = nil,
        paymentMethod: String,
        total: String,
        listCoffee: [String],
        profileId: UUID
    ) {
        self.id = id
        self.paymentMethod = paymentMethod
        self.total = total
        self.listCoffee = listCoffee
        self.$profile.id = profileId
    }
}
