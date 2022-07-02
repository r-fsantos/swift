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


    Alocação de Memória:
        O programa pede para o computador um pedaço de espaço para guardar seu novo objeto
    Inicialização:
        Com o espaço reservado, o programa pode então inicializar seu objeto para poder utilizá-lo
    Uso:
        Com o objeto inicializado, o programa pode manusear o objeto da maneira que preferir
    Desinicialização:
        Ao fim do uso, o programa desinicializa o objeto e aquele espaço fica ali, esperando que o computador desaloque
    Desalocação:
        O espaço então é liberado e pode ser utilizado por qualquer programa disponível no computador
 ```
 */

class Computer: CustomStringConvertible {
    var model = String()
    var storage = Int()
    var description: String {
        "Computer(Model/Storage): \(model)/\(storage)"
    }

    init(model: String, storage: Int) {
        self.model = model
        self.storage = storage

        print("\(description) initialized!")
    }

    deinit {
        print("\(description) deinitialized!")
    }
}
var macM1: Computer? = Computer(model: "Mac M1", storage: 42)
macM1 = nil

