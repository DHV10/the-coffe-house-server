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

    init() {}

    init(
        id: UUID? = nil,
        paymentMethod: String,
        total: String
    ) {
        self.id = id
        self.paymentMethod = paymentMethod
        self.total = total
    }
}
