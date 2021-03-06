//: Playground - noun: a place where people can play

import UIKit

//Atalhos::
//option + mouse em cima de uma variável, mostra o tipo
//command + seta vai para o comeco ou fim de uma string
//ctrl + command + space = emoji

//Swift
//nao precisa de ponto e virgula
//print() mostra no no console

//A tipificacao das variaveis nao eh obrigatoria
var name = "Dani"

print (name)
print ("Dani")


//Tipificacao
//Int, Double, Float, String, Character, Bool
//Int, Uint (unsigned), Int8, Int16, Int32, Int64
//Int é mutavel, pois pode ser 32 ou 64, depende da plataforma do device

//variáveis
var age: Int = 29 //Mutable
age = 38

//constantes
let age1: Int = 39 //Imutable

//inferencia de tipo
var age2 = 49
var a = 10, b = 20, c = 30
var a1 = 10; var a2 = 20; var a3 = 30

var dolarRate = 3.42 // Infere double
var dolarRate2: Float = 3.42 // Forco double
var gender = "M" // Infere String
var genderChar:Character = "M"
var isMale:Bool = true

//concatenacao de string
var FirstName = "Danielle" //caseSensitive
var firstName = "Danielle"
var lastName = "Pereira"
var fullName = "Danielle" + " " + "Pereira"
var fullName2 = "Meu nome é \(firstName) \(lastName)" // interpolação de string

let 🐶1 = "Nina"
let 🐕2 = "Billy Franscisco"

//===================================
//Tuplas (colecao de outros tipos)
//Funcao que retorna dois tipos, retorna uma tupla (funciona como um objeto, mas é mais leve)

var address = ("Av. Paulista", 1000, "06663-340")
print("Eu moro na \(address.0), número \(address.1)")

var address2: (street: String, numero: Int, cep: String) = ("Av. Paulista", 1000, "06663-340")
print("Eu moro na \(address2.street), numero \(address2.numero)")

var(street, numero, cep) = address
print (street)

var(street1, number1, _) = address //aloco menos memória

//===================================
//Optional
/*
 You specify optional chaining by placing a question mark (?) after the optional value
 on which you wish to call a property, method or subscript if the optional is non-nil.
 This is very similar to placing an exclamation mark (!) after an optional value to force the unwrapping of its value.
 The main difference is that optional chaining fails gracefully when the optional is nil, 
 whereas forced unwrapping triggers a runtime error when the optional is nil.
*/
var student: String? //optional de String
student = "Danielle"
//print (student) //o conteudo esta protegido, não consigo printar assim
print (student!) //forced unwrap (nao eh legal pois nao esta protegido, se a var student estiver comentada vai dar pau

//para resolver o problema acima, utilizo o if let, pois ele vai tentar desembulhar esse optional
if let _student = student {
    print(_student)
} else {
    print("Aluno não cadastrado 1!")
}

//ou assim
if (student != nil) {
    print (student!)
} else {
    print("Error!")
}

//conversao de string para inteiro
var addressNumber = "1000"
var addNumber = Int(addressNumber)
//print (addNumber) //sempre printa como optional pois ele nao sabe se eh um inteiro ou string, entao printa como optional

//desembrulhando um optional
if let addNumber2 = Int(addressNumber) {
    print(addNumber2)
}

//dando chute na porta
//implicit unwrap option (ja vem desembrulhado, mas nao pode esquecer de atribuir o valor, caso contrario vai dar crash)
var grade: Int!
grade = 10
print(grade)

//desembrulha e permite que a variavel do let se torna global
func doSomething() {
    
    //The “guard” statement helps avoid the complexity of numerous nested conditions
    guard let student = student, let addNumber = Int(addressNumber), student == "Eric" else {
        print("Aluno não cadastrado 2!")
        return
    }
    
    print(student)
    print(addNumber)
}

doSomething()



//optional chaining

//===================================
//ARRAYS

//Arrays com tipificacao (Esse eh um array de tuplas)
var tupleArray: [(String, Int)] = [
    ("Fulano", 22),
    ("Ciclano", 32),
    ("Beltrano", 0)
]

UInt.max
UInt.min

//declarar arrays vazios
var names: [String]?
var ages: [Int] = []

print (tupleArray[0].1)
print (tupleArray[1].0)

//Adicionando elementos as tuplas
tupleArray.append(("Novo Nome", 28))
tupleArray += [("Mais um nome", 28)]
tupleArray.insert(("Xuxu", 29), at: 2)

print(tupleArray)

tupleArray.remove(at: 2)

print(tupleArray)

let firstTuple = tupleArray.first
let firstAndSecondTuple = tupleArray[0...1]

print (firstAndSecondTuple)

// add array strings
var nickNames:[String] = [
    "Nome1",
    "Nome2",
    "Nome3"
]

//return bool
nickNames.contains("Nome4")

print(nickNames)

//===================================
//DICTIONARIES (Chave, valor)
var states:[String: String] = [
    "BA": "Bahia",
    "MG": "Minas Gerais"
]

print("Eu nasci no \(String(describing: states["TO"]))")

print(states)
print(states["MG"]!)

states["MG"] = nil //delete
states["TO"] = "Tocantins" //new

states.count

//For In
for nickName in nickNames {
    print(nickName)
}

//o dictionary vira uma tupla
for(code, state) in states {
    print(state)
}

//===================================
//OPERADORES

//identidade: string eh uma struct/value_type e por isso e passado como copia

//Identidade: ===, !===
//copy on write = ao se fazer uma copia, so eh copiado na utilizacao
//Seu eu receber uma classe e fizer uma copia, estarei apontando para o mesmo objeto
//Ternario: (condicao) ? valor1 : valor2
//Closed Range: 1...100
//Half-Closed Range: 1..<100
//Coalescência Nula: valor1 ?? valor2

//Posso criar operadores personalizados
//Prefix ! antes = negacao
//Infix: operador binario
//Postfix ! depois =

prefix operator >- //operator prefix
prefix func >- (right: Int) -> Int {
    return right*right*(-1)
}

>-5

postfix	operator -< //operator postfix
postfix func -< (left: Int) -> Int {
    return left/left*(-1)
}

5-<

infix operator >-<
func >-<(left: Int, right: Int) -> Int {
    return 2 * left * right
}

3>-<5

/*
 infix operator +
 func + (left: Int, right: Int) -> Int {
 return left * right
 }
 
 print(5 + 100)
*/

//===================================
//ENUMERADORES (enum)
enum Compass {
    case north
    case south
    case east
    case west
}

var heading: Compass = Compass.north
heading = .south // uma vez definido a var como compass, posso apenas atribuir valor como .

//switch nao precisa do break
let letter = "a"

switch letter {
    case "a", "e", "i", "o", "u":
        print("vogal")
    case "b":
        print("consoante")
    default:
        print("consoante")
}

let initial = "D"

switch initial {
    case "a"..."f":
        print ("primeiro lote")
    case "g"..."n":
        print ("segundo lote")
    default:
        print ("terceiro lote")
}

//===================================
//CONTROLE DE FLUXO
//for in
let names2 = ["Jose", "Dani", "Renan"]
for name in names2 {
    print(name)
}

//range
for number in 0..<100 {
    //print(number)
}

//array
for letter in names2[1].characters {
    print (letter)
}

print(names2[1].characters.count)

//===================================
//ITERACAO COM DICTIONARY
let names3 = ["RA": "RAFAEL", "DA": "Dani"]

for qqcoisa in names3 {
    print(qqcoisa.key)
}

for (initial, name) in names3 {
    print(name)
}

var i = 0
while i <= names3.count {
    print("QQ Coisa!")
    i+=1
}

//===================
// EXERCICIO
//===================
//gerar "left" numeros randomicos, de valor máximo ate "right" e ordena-los
import Foundation

infix operator <->
func <-> (total:Int, universe:Int) -> [Int] {
    
    var result:[Int] = []
    while result.count < total {
        let rand = Int(arc4random_uniform(UInt32(universe)) + 1) //pq senao iria de 0 a 59
        if !result.contains(rand) {
            result.append(rand)
        }
    }
    return result.sorted()
}

6<->100

//===================
// FUNCOES
//===================

func doSomenthing2(a:Int, b:Int) -> Int {
    return a+b
}
 
doSomenthing2(a: 9, b: 0)
 
//funcao pode ter diferentes nomes para os parametros internamente e externamente
func saySomenthing(_ sentence: String, to name:String) {
    print (sentence, name)
}
 
saySomenthing("Ola", to: "Eric")
 
 //quebrando string pelo separador
 
let student2 = "José;28"
func getNameAndAge(_ data:String) -> (name:String, age:Int) {
 
    let student2 = data.components(separatedBy: ";")
 
    guard let name = student2.first, let ageStr = student2.last, let age = Int(ageStr) else {
        return("", 0)
    }
 
    return (name, age)
}
 
 
 let(myName, myAge) = getNameAndAge(student2)

print ("Xuxu")
 
