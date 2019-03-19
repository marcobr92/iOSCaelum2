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