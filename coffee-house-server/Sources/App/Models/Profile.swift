//
//  File.swift
//  
//
//  Created by Việt Dương Hoàng on 19/10/24.
//

import Foundation
import Vapor
import Fluent

final class Profile: Model, Content {
    
    static let schema = "profiles"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "username")
    var username: String
    
    @Field(key: "phoneNumber")
    var phoneNumber: String
    
    init() {}
    
    init(id: UUID? = nil, username: String, phoneNumber: String) {
        self.id = id
        self.username = username
        self.phoneNumber = phoneNumber
    }
}
