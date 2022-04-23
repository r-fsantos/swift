import Foundation

// MARK: Closures

/*
    O que são?
    - São funções anônimas (não tem o nome especificado). Em outras linguagens são conheciddas como lambdas e podem capturar e guardar referências para qualquer constante ou variável de um contexto que foram definidas.
    - São blocos de código que você pode passar como argumentos para funções onde a função receptora espera um tipo de função.
    - Resumidamente são funções onde não são necessárias uma declaração ou vínculo, por elas serem tipos de referência (Reference Type)
*/

// Síntaxe usual de uma closure:
let exampleClosure = { (parameterX: Int) -> Double in
    return Double(parameterX)
}

/*
    As closures têm 2 casos de uso em comuns.
    1 - Uma maneira conveniente de definir e passar uma pequena função sem ter que passar pelo incômodo de nomear e definir uma função plenamente desejada. Ao definir uma closure, o swift pode inferir os tipos de parâmentros e o tipo de retorno a partir do contexto em que o fechamento é definido. As closures também tem retornos implicitos e taquigrafia para acessar argumentos passados para a closure. Assim, a sintaxe para definir uma closure é muito menos verbosa do que quando se define uma função plenamente estabelecida.

    2 - Como forma de fechar algum estado de quando a closure foi definida. Você pode usar a closure para capturar e armazenar o estado de alguma variável em um determinado momento (o ponto em que a closure é definida) e armazenar valores a serem usados posteriormente.
*/


// Devemos entender que funções são um tipo especial de closures e existem três tipos de closures:

// Funcões Gloabais
/// Tem um nome e não capturam nenhum valor
print("Hello, World!")
func helloWorld() -> String {
    return "Hello, World!"
}

// Funções Aninhadas
///Tem um nome e captura valores de função anexado. Funções aninhadas tem acesso a variáveis que foram declaradas na função externa. Resumindo são funções dentro de outras funções.
func helloWorld(name: String) -> String {
    let message = "Hello, World!"
    
    func welcome() -> String {
        return message + name
    }
    
    return welcome()
}
helloWorld(name: "Thyago")

// Expressões de fechamento ou Closures
/// Que não tem um nome e podem capturar valor no seu contexto
/*
{ (parameters) -> return type in
    statements
}
*/

// Omitindo o return
/// Variáveis computáveis a function line
let omitingReturn = { (parameterX: Int) -> Double in
    Double(parameterX)
}

func functionLine(value: Data) -> Bool {
    value.isEmpty
}

