//
//  BuilderPattern.swift
//  Components
//
//  Created by Devesh on 01/08/17.
//  Copyright © 2017 __SELF___. All rights reserved.
//

import Foundation

struct BurgerOld {
    var name    :String
    var patties :Int
    var bacon   :Bool
    var pickles :Bool
    var ketchup :Bool
    var mustard :Bool
    var lettuce :Bool
    var tomato  :Bool
    var cheese   :Bool
    init(name:String, patties:Int, bacon:Bool, pickles:Bool, ketchup:Bool, mustard:Bool, lettuce:Bool, tomato:Bool, cheese:Bool) {
        self.name       = name
        self.patties    = patties
        self.bacon      = bacon
        self.pickles    = pickles
        self.ketchup    = ketchup
        self.mustard    = mustard
        self.lettuce    = lettuce
        self.tomato     = tomato
        self.cheese     = cheese
    }
}


class ImplementationOfBurgerOld { // need to mention all parameters
    
    init() {
        let hamburger = BurgerOld(name: "hamburger", patties: 1, bacon: false, pickles: false, ketchup: true, mustard: false, lettuce: true, tomato: false ,cheese:true)
    }
}


// new way   1st approch multiple builder type

protocol BurgerBuilder {
    var name    :String {get}
    var patties :Int    {get}
    var bacon   :Bool   {get}
    var pickles :Bool   {get}
    var ketchup :Bool   {get}
    var mustard :Bool   {get}
    var lettuce :Bool   {get}
    var tomato  :Bool   {get}
    var cheese  :Bool   {get}
}

struct HamburgerBuilder: BurgerBuilder {
    let  name       = "Burger"
    let  patties    = 1
    let  bacon      = false
    let  pickles    = true
    let  ketchup    = false
    let  mustard    = true
    let  lettuce    = true
    let  tomato     = false
    let  cheese     = false
}

struct CheeseburgerBuilder: BurgerBuilder {
    let  name       = "Cheeseburger"
    let  patties    = 1
    let  bacon      = false
    let  pickles    = true
    let  ketchup    = false
    let  mustard    = true
    let  lettuce    = true
    let  tomato     = false
    let  cheese     = true
}

struct Burger {
    var name    :String
    var patties :Int
    var bacon   :Bool
    var pickles :Bool
    var ketchup :Bool
    var mustard :Bool
    var lettuce :Bool
    var tomato  :Bool
    var cheese   :Bool
    
    init(builder:BurgerBuilder) {
        self.name       = builder.name
        self.patties    = builder.patties
        self.bacon      = builder.bacon
        self.pickles    = builder.pickles
        self.ketchup    = builder.ketchup
        self.mustard    = builder.mustard
        self.lettuce    = builder.lettuce
        self.tomato     = builder.tomato
        self.cheese     = builder.cheese
    }
    
    func showBurger() {
        print(name)
        print(patties)
        print(bacon)
        print(pickles)
        print(ketchup)
        print(mustard)
        print(lettuce)
        print(tomato)
        print(cheese)
    }
}

class ImplementationOfNewStyle {
    
    init() {
        // only one param passed intead of all as in prev i.e
        let burger  = Burger(builder: HamburgerBuilder())
        burger.showBurger()
        
        // wants to change any param 
        
        var CheeseburgerWithoutCheese = Burger(builder: CheeseburgerBuilder())
        CheeseburgerWithoutCheese.cheese = false
        CheeseburgerWithoutCheese.showBurger()
    }
    
}


// 2nd approch single builder type


