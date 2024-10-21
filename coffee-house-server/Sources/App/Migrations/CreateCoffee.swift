//
//  File.swift
//  
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateCoffee: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("coffees")
            .id()
            .field("image", .string)
            .field("title", .string)
            .field("about", .string)
            .field("rate", .string)
            .field("size", .array(of: .string))
            .create()
    }
    
    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("coffees").delete()
    }
}
