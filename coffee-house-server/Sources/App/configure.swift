import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // register routes
    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "coffee_house_server"), as: .psql)
    app.migrations.add(CreateProfile())
    app.migrations.add(CreateOrder())
    app.migrations.add(CreateCoffee())
    try routes(app)
}
