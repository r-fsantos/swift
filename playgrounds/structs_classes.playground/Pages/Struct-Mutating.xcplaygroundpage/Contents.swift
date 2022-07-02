
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

struct Computer {
    var model = String()
    var storage = Int()
    var isOn = false
}

// Não é boa prática alterar o valor de uma propriedade diretamente, correto?
var macM2 = Computer(model: "Mac M2", storage: 256)
macM2.isOn = true

struct ComputerMutating {
    var model = String()
    var storage = Int()
    var isOn = false

    mutating func turnOn() {
        isOn = true
    }
}

var macM1 = ComputerMutating(model: "Mac M1", storage: 256)
macM1.turnOn()
