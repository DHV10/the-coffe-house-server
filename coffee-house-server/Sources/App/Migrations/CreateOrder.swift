//
//  File.swift
//  
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateOrder: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("orders")
            .id()
            .field("paymentMethod", .string)
            .field("total", .string)
            .create()
    }
    
    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("orders").delete()
    }
}
