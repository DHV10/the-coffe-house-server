//
//  File.swift
//  
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import Vapor

struct ProfileController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        routes.post("createProfile") { req -> EventLoopFuture<Profile> in
            let newProfile = try req.content.decode(Profile.self)
            return newProfile.create(on: req.db).map { newProfile }
        }
        
        routes.get("allProfile") { req -> EventLoopFuture<[Profile]> in
            Profile.query(on: req.db).all()
        }
    }
}
