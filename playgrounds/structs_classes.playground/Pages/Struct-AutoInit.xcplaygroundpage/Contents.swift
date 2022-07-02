
/**
 ```
    Structs possuem auto init, ao contrário de classes.
    Não é necessário criar um inicializador customizado.

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
}

var macM1 = Computer()
macM1.model = "Mac M1"
macM1.storage = 500
print(macM1)

// Veja, sem inicializador customizado
var macM2 = Computer(model: "Mac M2", storage: 256)
print(macM2)

// Não é necessário passar todas as propriedades!
var macM3 = Computer(model: "Mac M3")
print(macM3)
macM3.storage = 100
print(macM3)


// Todavia, se for criado um inicializador customizado, veja que o auto-init é sobrescrito.
struct ComputerInit {
    var model = String()
    var storage = Int()

    init(model: String) {
        self.model = model
    }
}

var macM4 = ComputerInit(model: "Mac M4") //, storage: 300)
print(macM4)

