// Check Point 7

/*
 Goals :
 1. make a class hierarchy for animals
 2. starting with Animal at the top
 3. then Dog and Cat as subclasses
 4. then Corgi and Poodle as subclasses of Dog
 5. Persian and Lion as subclasses of Cat
 
 Additional Condition :
 1. The Animal class should have a legs integer property that tracks how many legs the animal has.
 2. The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
 3. The Cat class should have a matching speak() method, again with each subclass printing something different.
 4. The Cat class should have an isTame Boolean property, provided using an initializer.
 */

// Code

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Woof Woof!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Woof Woof Cog!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Woof Woof Poo!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int = 4) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meeeoooooww!")
    }
}

class Lion: Cat {
    override func speak() {
        print("ROARRRRR!")
    }
}

let dog = Dog(legs: 4)
dog.speak()
print(dog.legs)

let cat = Cat(isTame: true)
cat.speak()
print(cat.isTame)
print(cat.legs)

let orii = Corgi(legs: 4)
orii.speak()
print(orii.legs)

let poo = Poodle(legs: 4)
poo.speak()
print(poo.legs)

let persian = Persian(isTame: true)
persian.speak()
print(persian.isTame)
print(persian.legs)

let lion = Lion(isTame: false)
lion.speak()
print(lion.isTame)
print(lion.legs)
