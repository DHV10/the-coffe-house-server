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
        // GET - all list profile
        routes.get("allProfile") { req -> EventLoopFuture<[Profile]> in
            Profile.query(on: req.db).all()
        }

        // POST - create a profile
        routes.post("createProfile") { req -> EventLoopFuture<Profile> in
            let newProfile = try req.content.decode(Profile.self)
            return newProfile.create(on: req.db).map { newProfile }
        }

        // PUT - update profile
        routes.put("updateProfile") { req -> EventLoopFuture<HTTPStatus> in
            let profile = try req.content.decode(Profile.self)
            return Profile.find(profile.id, on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap {
                    $0.username = profile.username
                    $0.phoneNumber = profile.phoneNumber
                    return $0.update(on: req.db).transform(to: .ok)
                }
        }

        // DELETE - delete profile
        routes.delete("deleteProfile", ":profileId") { req -> EventLoopFuture<HTTPStatus> in
            Profile.find(req.parameters.get("profileId"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap {
                    $0.delete(on: req.db)
                }.transform(to: .ok)
        }
    }
}
