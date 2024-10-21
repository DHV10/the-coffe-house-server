//
//  File.swift
//  
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import Vapor

struct OrderController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        routes.post("createOrder") { req -> EventLoopFuture<Order> in
            let newOrder = try req.content.decode(Order.self)
            return newOrder.create(on: req.db).map { newOrder }
        }
        
        routes.get("allOrder") { req -> EventLoopFuture<[Order]> in
            Order.query(on: req.db).all()
        }
    }
}
