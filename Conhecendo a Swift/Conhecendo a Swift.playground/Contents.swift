//: Playground - noun: a place where people can play

// Constantes Vs Variaveis
let num1: Int = 10
let num2: Double = 5.2
var soma = Double(num1) + num2

// String
var nome: String = "Marco"

// Concatenação
nome += " Beraldi"

// Interpolação
let nome1 = "Steve Jobs"
let idade = 61
// Se Steve Jobs estivesse vivo, teria 61 anos
let status = "Se \(nome1) estivesse vivo, teria \(idade) anos"
// ou
print("Se \(nome1) estivesse vivo, teria \(idade) anos")
print(status)

/*
 Tuplas
 */
let httpCode = 404
let httpMsg = "Not found"
print("Erro \(httpCode) - Msg: \(httpMsg)")

let http404Error = (404, "Not found")

// Como exibir as informações da tupla?
//1. Por decomposição
let (statusCode, statusmessage) = http404Error

//2. Pelo indice
print("O codigo de erro é: \(http404Error.0)")
print("A mensagem de erro é: \(http404Error.1)")

// Comparações em Swift
let valor1 = 10
let valor2 = 20
if valor1 == valor2{
    print("Valores iguais")
} else {
    print("Valores diferentes")
}


// Loop
//let int i = 0;
//for (i:0; i>10; i++){
//    print(i)
//}

//Funções em Swift
func sayHello(nome: String) -> String{
//    let greeting = "Olá! " + nome + "!"
//    return greeting
//    Refatorando
        return "Olá " + nome + "!"
}

// Chamando a Função
let resposta = sayHello(nome: "Carlos")
print(resposta)

//Tornando o nome do parametro opcional
func sayName(_ firstName: String, lastName: String) {
    print(firstName + lastName)
}

sayName("Marco", lastName: " Beraldi")

//Definição de Classe

import Foundation
class MyClass: NSObject{
    func mostrarNoConsole(_ texto:String){
        print(texto)
    }
}

// Invocando metodo da Classe
let myClass = MyClass()
myClass.mostrarNoConsole("Olá Mundo")

/*
 Optional - minimizar a ocorrencia de quebra de app devido a valores nulos
*/

let possivelNum = "abc" //era 123 e passamos para abc, gerando erro
//var numConvertido = Int(possivelNum)
//
//var numCalculado = numConvertido! + 10
//print("Calculo: \(numCalculado)")

//Tratamento de optional (boas praticas)
//Opitional Binding
if var numConvertido = Int(possivelNum){
    let numCalculado = numConvertido + 10
    print("Cálculo: \(numCalculado)")
} else {
    print("A origem do numero é invalida")
}




