import Foundation

// Error Handling
/// O que é?
/// É o processo de resposta e recuperação de condições de erro em seu programa.

/*
    As palavras-chave que usamos para trabalhar com erros são - do | catch | try | throw | throws
 
    - do | catch -> Instrução para lidar com erros executando um bloco de código. Se um erro for lançado pelo código
    
    - throws -> Informa ao Swift que uma função, método ou inicializador pode lançar um erro, basta declarar a palavra chave após o parâmetro da função. Uma função marcada com throws é chamada de função lançadora (do inglês throwing function). Se a função especifica um tipo de retorno, você escreve a palavra-chave throws antes da seta de retorno ( -> ).
 
    Ex.: func canThrowErros() throws -> String
    
    - throw -> tem o mesmo efeito que o return, sendo que o return (retorna) algum valor da função, enquanto throw retorna o valor de erro da função que está no enum.
 
 */

// Vamos aprender erros em Swift com exemplos.
/// Um erro (exceção) é um evento inesperado que ocorre durante a execução do programa. Por exemplo:

var numerator = 10
var denominator = 0
// try divide a number for 0
var result = numerator / denominator // error code
/// Aqui, estamos tentando dividir um número. Então esse tipo de erro causa o término anormal do programa

// Passos para manipulação de erros em Swift

/// 1 - Crie um enum que represente os tipos de erros, o enum que criamos deve estar em conformidade com o protocolo Error, para que possamos lançar um valor de erro dentro da função. Vamos ver um exemplo:
enum DivisionError: Error {
    case dividedByZero
}

/// 2 - Crie uma função para lançar erros onde vai usar a palavra-chave throws
/// Então usamos a declaração throw dentro da função para lançar o erro específico representado pelo enum. Por exemplo:
func division(numerator: Int, denominator: Int) throws {
    // throw error if divide by 0
    if denominator == 0 {
        throw DivisionError.dividedByZero
        // Note: A palavra throw tem o mesmo efeito que o return, sendo que o return (retorna) algum valor da função, enquanto throw retorna o valor de erro da função.
    }
}

/// 3 - Chame a função usando a palavra-chave try
/// Em Swift, usamos a palavra-chave try ao chamar uma função de lançamento. Indica que uma função pode lançar um erro. Por exemplo:
try division(numerator: 10, denominator: 0)
/// No entanto, o processo de manipulaçnao de erros ainda está incompleto. Se executarmos o programa agora, receberemos uma mensagem de erro: (Um erro foi lançado e não foi detectado)
/// Então, a fim de pegar o erro lançado, usamos a declaração -> do - catch

/// 4 - Embrulhar o código try no bloco do { ... } e adicionar o bloco catch para manipular todos os erros. Exemplo:
do {
    try division(numerator: 10, denominator: 0)
    // ...
} catch DivisionError.dividedByZero {
    // statement
}
/// Aqui, nós chamamos a função de lançamento division() dentro do bloco do e anexamos o bloco catch para pegar o erro se a função lançar um.


// Exemplo: Swift Error Handling
/// Criar um enum com valores de erro
enum DivisionErrorTwo: Error {
    case dividedByZeroTwo
}

/// criar a funcao de lançamento usando a palavra-chave throws
func divisionTwo(numerator: Int, denominator: Int) throws {
    // Retorna o erro usando a palavra-chave throw
    if denominator == 0 {
        throw DivisionError.dividedByZero
    } else {
        let result = numerator / denominator
        print(result)
    }
    
    // Chamando a função dentro do bloco do
    do {
        try divisionTwo(numerator: 10, denominator: 0)
        print("Valid Division")
    }
    // Captura caso ocorra um erro na função
    catch DivisionError.dividedByZero {
        print("Error: Denominador cannot be 0")
    }
}
// Output -> Error: Denominator cannot be 0

// No exemplo acima
/// - DivisionError é um enum
/// - division() é uma função de lançamento
/// - do - catch, declaração onde lica com o erro

// Desativar o tratamento de erro
/// Em Swift, às vezes podemos estar confiantes de que a função de lançamento não vai lançar um erro no tempo de execução.
/// Nesse caso, podemos escrever try! durante a chamada de função para desativar o tratamento de erro. Por exemplo:

enum DivisionErrorThree: Error {
    case dividedByZero
}

func divisionThree(numerator: Int, denominator: Int) throws {
    if denominator == 0 {
        throw DivisionError.dividedByZero
    } else {
        let result = numerator / denominator
        print("Result: ", result)
    }
}
/// Desativar o tratamento de erro
try! divisionThree(numerator: 10, denominator: 5) // Output -> Result: 2

// Causas de erros no Swift
/// Um erro pode ocorrer por muitas razões. Alguns deles são:
/// - Entrada de usuário inválida
/// - Falha no dispositivo
/// - Perda de conexão de rede
/// - Limitações fîsicas  (fora da memória do disco)
/// - Erros de código
/// - Abrindo um arquivo indisponível

// Note -> Using Coalescing Operator ??
/// Você pode usar o operador de coalizão ?? com try? para fornecer um caso de falha de valor padrão:
//let result = (try? doSomething()) ?? "Default Value"
//print(result) // Default value
