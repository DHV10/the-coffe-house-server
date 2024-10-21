import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: ProfileController())
    try app.register(collection: CoffeeController())
    try app.register(collection: OrderController())
}
