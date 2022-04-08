import UIKit

///Abstract product

protocol Order {
    func acceptOrder()
    func prepareOrder()
    func thankForOrder()
}

///Concrete products

class FrenchFries : Order {
    
    let ingredient = ["Potato"]
    
    init(){
        acceptOrder()
        prepareOrder()
        thankForOrder()
    }
    func acceptOrder() {
        print("French fries is being prepared")
    }
    
    func prepareOrder() {
        print("French fries is ready")
    }
    
    func thankForOrder() {
        print("Thank you for your order. Enjoy your French fries!")
    }
}

class LemonSoda : Order {
    
    let ingredient = ["Lemon"]
    
    init() {
        acceptOrder()
        prepareOrder()
        thankForOrder()
    }
    
    func acceptOrder() {
        print("Lemon soda is being prepared")
    }
    func prepareOrder() {
        print("Lemon soda is ready")
    }
    func thankForOrder() {
        print("Thank you for your order. Enjoy your Lemon soda!")
    }
}

class CheeseBurger : Order {
    
    let ingredients = ["bread","cheese"]
    
    init() {
        acceptOrder()
        prepareOrder()
        thankForOrder()
    }
    func acceptOrder() {
        print("Cheese burger is being prepared")
    }
    func prepareOrder() {
        print("Cheese burger is ready")
    }
    
    func thankForOrder() {
        print("Thank you for your order. Enjoy your Cheese burger!")
    }
    
}

class MargheritaPizza : Order {
    
    let ingredients = ["dough","yeast"]
    
    init() {
        acceptOrder()
        prepareOrder()
        thankForOrder()
    }
    func acceptOrder() {
        print("Margherita pizza is being prepared")
    }
    func prepareOrder() {
        print("Margherita pizza is ready")
    }
    func thankForOrder() {
        print("Thank you for your order. Enjoy your Margherita pizza!")
    }
}

///Abstract Factory

protocol OrderFactory {
    func createOrder() -> Order
     
}


///Product Factories
class LemonSodaFactory : OrderFactory {
    func createOrder() -> Order {
        return LemonSoda()
    }
}

class MargheritaPizzaFactory: OrderFactory {
       
    func createOrder() -> Order {
        return MargheritaPizza()
    }
}

class CheeseBurgerFactory : OrderFactory {
    
    func createOrder() -> Order {
        return CheeseBurger()
    }
}
class FrenchFriesFactory : OrderFactory {
    func createOrder() -> Order {
        return FrenchFries()
    }
}

///Client
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

enum OrderItem  {
    case LemonSoda, MargheritaPizza, CheeseBurger, FrenchFries
}

let client = Client(clientName: "Jim", orderItem: .MargheritaPizza)
client.startOrder()

let client2 = Client(clientName: "Deepa", orderItem: .LemonSoda)
client2.startOrder()

let client3 = Client(clientName: "Selina", orderItem: .CheeseBurger)
client3.startOrder()

let client4 = Client(clientName: "Rajesh", orderItem: .FrenchFries)
client4.startOrder()
