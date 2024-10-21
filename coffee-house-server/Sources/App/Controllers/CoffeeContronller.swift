//
//  File.swift
//  
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import Vapor

struct CoffeeController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        routes.post("createCoffee") { req -> EventLoopFuture<Coffee> in
            let newCoffee = try req.content.decode(Coffee.self)
            return newCoffee.create(on: req.db).map { newCoffee }
        }
        
        routes.get("allCoffee") { req -> EventLoopFuture<[Coffee]> in
            Coffee.query(on: req.db).all()
        }
    }
}
