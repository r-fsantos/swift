
/**
 ```
     Structs
     -----------------------------------------
     > Value type, copy, renewed
     -----------------------------------------
        > auto init
        > `mutating`

     Classes
     -----------------------------------------
     > Reference type, share, mutable
     -----------------------------------------
        > `convenience`
        > `description`, due to be ref type
        > Inheritance
        > Casting
        > Deinit (ref cycle)
```
 */


class ComputerClass {
    var model = String()
    var storage = Int()

    // only for classes
    convenience init(model: String, storage: Int) {
        self.init() // auto init?
        self.model = model
        self.storage = storage
    }
}

var mac = ComputerClass(model: "Mac", storage: 42)
// Class é reference-type. Armazena uma referência na memória, e não o conteúdo em si.
print(mac)


// É necessário alterar o description!

class Computer: CustomStringConvertible {
    var model = String()
    var storage = Int()

    var description: String {
        "Model: \(model)\nStorage: \(storage)"
    }

    // only for classes
    convenience init(model: String, storage: Int) {
        self.init() // auto init?
        self.model = model
        self.storage = storage
    }
}

var macM1 = Computer(model: "Mac M1", storage: 42)
print(macM1)
