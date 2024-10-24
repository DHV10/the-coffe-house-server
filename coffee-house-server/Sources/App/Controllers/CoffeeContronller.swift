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
        // GET: - list all coffee
        routes.get("allCoffee") { req -> EventLoopFuture<[Coffee]> in
            Coffee.query(on: req.db).all()
        }

        // POST: - create coffee
        routes.post("createCoffee") { req -> EventLoopFuture<[Coffee]> in
            let newCoffee = try req.content.decode([Coffee].self)
            return newCoffee.create(on: req.db).map { newCoffee }
        }
        
        // PUT - update coffee
        routes.put("updateCoffee") { req -> EventLoopFuture<HTTPStatus> in
            let coffee = try req.content.decode(Coffee.self)
            return Coffee.find(coffee.id, on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap {
                    $0.title = coffee.title
                    return $0.update(on: req.db).transform(to: .ok)
                }
        }

        // DELETE - delete profile
        routes.delete("deleteCoffee", ":coffeeId") { req -> EventLoopFuture<HTTPStatus> in
            Coffee.find(req.parameters.get("coffeeId"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap {
                    $0.delete(on: req.db)
                }.transform(to: .ok)
        }
    }
}
