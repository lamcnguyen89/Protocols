//
//  main.swift
//  Protocols
//
//  Created by M_2022814 on 12/15/21.
//

import Foundation

// MARK: - Protocols
// A protocol defines a blueprint of methods, properties and other requirments that suit a particular task or piece of functionality.
// The protocol can then be adopted by a class, structure, or enumration to provide an actual implementation of those requirements
// Protocols can be extended to implement some of these requirments or to implement additional functionality that conforming types can take advantage of

// Protocol Syntax:

/*
protocol SomeProtocol {
    // Protocol Definition goes here
}
*/

protocol FirstProtocol {
    // Protocol Definition goes here
}

protocol AnotherProtocol {
    // Protocol Definition goes here
}

// Custom types can have a protocol or multiple protocols added to them in the following format:

 struct SomeStructure: FirstProtocol, AnotherProtocol {
 
 }

// If a class has a superclass, list the superclass name before any protocols it adopts, followed by the comma:

class SupersizedClass {
    
    class SomeClass {
        
    }
}

class SomeClass: SupersizedClass, FirstProtocol, AnotherProtocol {
    
}

// MARK: - Property Requirements
//  A protocol can require any conforming type to provide an instance property or type property with a particular name and type.
    // The protocol doesn't specify whether it should be a stored or computed property- only the required property name and type
    // THe protocol sldo specifies whether something is gettable or gettable AND settable.


protocol SomeProtocol {
    var mustBeSettable: Int {get set}
    var doesNotNeedToBeSettable: Int {get}
    
}

// Example of Conforming to protocol:
protocol FullyNamed {
    var fullName: String {get set}
}

struct Person: FullyNamed {
    var fullName = "Lynda Loveless"
}

// MARK: - Initializer Requirements
// Protocols can require specific initializers to be implemented by conforming types.
// You write write these initializers as part of the protocol's definition in the exact same way as for normal initializers, but without curly braces or an initializer body:

protocol DopeProtocol {
    init(someParameter: Int)
}

// MARK: - Class Implementations of Protocol Initializer Requirements

class EvilClass: DopeProtocol {
    required init(someParameter: Int) {
        // Initializer implementation goes here
    }
}

// MARK: - Failable Initializer Requirements
// A failable initializer requirement can be satisfied by a failable or nonfailable initializer on a conforming type

// MARK: - Protocols as Types
// Protocols don't actually implement any functionality themselves.Nonetheless you can use protocols as a fully fledged types in your code.


class Dice {
    let sides: Int
    var generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(Double(sides)) + 1 // My understanding of the RandomNumberGenerator is fucked right now.
    }
}
 // The RandomNumberGenerator is the type
 

// MARK: - Delegation
// Delegation is a design pattern that enables a class or structure to hand off (or delegate) some of its responsibilities to an instance of another type.

// The dicegame protocol can be adopted by any game that involves dice
protocol DiceGame {
    var dice: Dice {get}
    func play()
}

// The dicegamedelegate protocol can be adopted to track the progress of a DiceGame
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

// MARK: - Adding Protocol Conformance with an Extension
// You can extend an exsting type to adopt and conform to a new protocol, even if you don't have access to the source code for the existing type.

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
