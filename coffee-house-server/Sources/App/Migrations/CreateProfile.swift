//
//  File.swift
//  
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateProfile: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("profiles")
            .id()
            .field("username", .string)
            .field("phoneNumber", .string)
            .create()
    }
    
    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("profiles").delete()
    }
}
