import Foundation

protocol CanBreathe {
    func breathe()
}


struct Animal: CanBreathe {
    func breathe() {
        "Animal breathing..."
    }
}

struct Person: CanBreathe {
    func breathe() {
        "Person breathing..."
    }
}

let dog = Animal()
dog.breathe()

let foo = Person()
foo.breathe()

// ****************************************

protocol CanJump {
    func jump()  // dumb function
}

extension CanJump { // using this technique you're adding a default implementation
    func jump() {
        "Jumping..."
    }
}

struct Cat: CanJump {
    
    // you don't have to define jump() function if you use in extention
    // but if you want to change function's feature then you can define
}

struct Duck: CanJump {
    func jump() {
        "Duck can't jump"
    }
}

let whiskers = Cat()
whiskers.jump()

let gook = Duck()
gook.jump()

// **********************************************

protocol HasName {
    var name: String { get } // 'let' declarations cannot be computed properties
    var age: Int { get set }
    mutating func increaseAge()
}

extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old"
    }
    
    mutating func increaseAge(){ // protocols can have mutating functions
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String  // we can define with let constant because we define with just 'get' computed properties on top.
    var age: Int
        
}

let woof = Dog(name: "Woof", age: 10)
woof.name
woof.age
// woof.age += 1  Left side of mutating operator isn't mutable: 'woof' is a 'let' constant


var boby = Dog(name: "Boby", age: 12)
boby.name
boby.age
boby.age += 1
boby.age
boby.describeMe()
boby.increaseAge()
boby.age
boby.describeMe()

// ***********************************************

protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}

/*
struct Bike: Vehicle {
    var speed: Int = 0
    
}
*/

// yukarıdaki kod ile aynı anlama gelir. sadece yazım farkı var

struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed

func describe(obj: Any) {
    if obj is Vehicle {  // 'is' syntax uses for check point in protocols
        "obj conforms to the Vehicle protocol"
    } else {
        "obj does not conform to the Vehicle protocol"
    }
}

describe(obj: bike)

// 'as?' syntax you can conditionally promote an object to a specific type

func increaseSpeedIfVehicle(obj: Any) {
    
    if var vehicle = obj as? Vehicle {
        vehicle.speed
        vehicle.increaseSpeed(by: 10)
        vehicle.speed
    } else {
        "This was not a vehicle"
    }
}

increaseSpeedIfVehicle(obj: bike)
bike.speed  // structlar value type olduğu için eğer Vehicle struct'ını class olarak tanımlamış olsaydık değerimiz bu sefer 20 olacaktı. reference type olduğu için


