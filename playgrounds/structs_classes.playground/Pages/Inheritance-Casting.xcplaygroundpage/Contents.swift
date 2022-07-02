
class Machine {
    var serialNumber = Int()
}

class Computer: Machine {
    var model = String()
    var storage = Int()

    // only for classes
    convenience init(model: String, storage: Int) {
        self.init() // auto init?
        self.model = model
        self.storage = storage
    }
}
var macM1 = Computer(model: "Mac M1", storage: 42)

print(type(of: macM1))
