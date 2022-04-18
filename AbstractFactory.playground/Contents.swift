import UIKit


//Abstract product
protocol Order {
    var orderName: String { get }
    func acceptOrder()
    func prepareOrder()
    func thankForOrder()
}


//Concrete products
class FrenchFries : Order {
    
    let orderName: String
    
    init(){
        orderName = "French fries"
        acceptOrder()
        prepareOrder()
        thankForOrder()
    }
    func acceptOrder() {
        print("Your \(orderName) is being prepared")
    }
    
    func prepareOrder() {
        print("\(orderName) is ready")
    }
    
    func thankForOrder() {
        print("Thank you for your order. Enjoy your \(orderName)!")
    }
}

class LemonSoda : Order {
    
    var orderName: String
        
    init() {
        orderName = "Lemon soda"
        acceptOrder()
        prepareOrder()
        thankForOrder()
    }
    
    func acceptOrder() {
        print("Your \(orderName) is being prepared")
    }
    func prepareOrder() {
        print("\(orderName) is ready")
    }
    func thankForOrder() {
        print("Thank you for your order. Enjoy your \(orderName)!")
    }
}

class CheeseBurger : Order {
    
    var orderName: String
        
    init() {
        orderName = "Cheese burger"
        acceptOrder()
        prepareOrder()
        thankForOrder()
    }
    func acceptOrder() {
        print("Your \(orderName) is being prepared")
    }
    func prepareOrder() {
        print("\(orderName) is ready")
    }
    
    func thankForOrder() {
        print("Thank you for your order. Enjoy your \(orderName)!")
    }
    
}

class MargheritaPizza : Order {
    
    var orderName: String
        
    init() {
        orderName = "Margherita pizza"
        acceptOrder()
        prepareOrder()
        thankForOrder()
    }
    func acceptOrder() {
        print("\(orderName) is being prepared")
    }
    func prepareOrder() {
        print("\(orderName) is ready")
    }
    func thankForOrder() {
        print("Thank you for your order. Enjoy your \(orderName)!")
    }
}


//Abstract Factory
protocol OrderFactory {
    func createOrder() -> Order
}


//Concrete Factories
class FrenchFriesFactory : OrderFactory {
    func createOrder() -> Order {
        return FrenchFries()
    }
}

class LemonSodaFactory : OrderFactory {
    func createOrder() -> Order {
        return LemonSoda()
    }
}

class CheeseBurgerFactory : OrderFactory {
    func createOrder() -> Order {
        return CheeseBurger()
    }
}

class MargheritaPizzaFactory: OrderFactory {
    func createOrder() -> Order {
        return MargheritaPizza()
    }
}


//Client
enum OrderItem  {
    case LemonSoda, MargheritaPizza, CheeseBurger, FrenchFries
}

class Client {
    var clientName : String
    var orderItem : OrderItem
    var orderFactory : OrderFactory
    
    init(clientName: String, orderItem: OrderItem) {
        self.clientName = clientName
        self.orderItem = orderItem
        
        switch orderItem {
        case .LemonSoda :
            orderFactory = LemonSodaFactory()
        case .MargheritaPizza :
            orderFactory = MargheritaPizzaFactory()
        case .CheeseBurger:
            orderFactory = CheeseBurgerFactory()
        case .FrenchFries:
            orderFactory = FrenchFriesFactory()
        }
    }
    
    func startOrder() -> Order {
        print("Welcome, \(clientName)")
        return orderFactory.createOrder()
    }
}

let client = Client(clientName: "Jim", orderItem: .MargheritaPizza)
client.startOrder()

let client2 = Client(clientName: "Deepa", orderItem: .LemonSoda)
client2.startOrder()

let client3 = Client(clientName: "Selina", orderItem: .CheeseBurger)
client3.startOrder()

let client4 = Client(clientName: "Rajesh", orderItem: .FrenchFries)
client4.startOrder()


//Extension

extension OrderFactory {
    func optionalMethod1() -> String { "" }
}
extension OrderFactory {
    func optionalMethod2() { }
}
