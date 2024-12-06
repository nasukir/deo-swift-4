import UIKit
/*
#### **Objective**
- Create a base protocol with common properties or methods for monsters.
- Derive two child protocols for specific monster types.
- Create four classes (two flying and two water monsters) conforming to these child protocols.
- Write a function that accepts a collection of `Monster` objects and prints details about each.

### **Instructions**


#### Step 2: Define Child Protocols
- `FlyingMonster` with:
  - `var wingSpan: Double { get }`
  - `func fly() -> String`
- `WaterMonster` with:
  - `var swimSpeed: Int { get }`
  - `func swim() -> String`

#### Step 3: Create Four Classes
- `Dragon` and `Gryphon` conforming to `FlyingMonster`.
- `Kraken` and `Merfolk` conforming to `WaterMonster`.

#### Step 4: Create a Function to Handle Monsters
- `printMonsterDetails(monsters: [Monster])` to print information for each monster, using polymorphism to call appropriate methods based on their type.

### **Sample Output**
```plaintext
Fire Drake roars fiercely, shaking the ground!
Fire Drake spreads its 15.0-meter wings and takes to the sky!
-----------------------
Sky Hunter screeches with a piercing cry!
Sky Hunter soars high with its majestic 12.0-meter wings!
-----------------------
Sea Terror bellows from the deep, causing waves to crash!
Sea Terror glides through the water at 20 knots!
-----------------------
Coral Queen sings an enchanting melody that stirs the seas!
Coral Queen swims gracefully at 10 knots!
*/

/*
 #### Step 1: Define the Base Protocol `Monster` with:
        - `var name: String { get }`
        - `func roar() -> String`
}*/

protocol Monster {
    var name: String { get }
    
    func roar() -> String
}

/*
 #### Step 2: Define Child Protocols
        = `FlyingMonster` with:
            - `var wingSpan: Double { get }`
            - `func fly() -> String`
        = `WaterMonster` with:
            - `var swimSpeed: Int { get }`
            - `func swim() -> String`
 */

protocol FlyingMonster: Monster {
    var wingSpan: Double { get }
    
    func fly() -> String
}

protocol WaterMonster: Monster {
    var swimSpeed: Int { get }
    
    func swim() -> String
}

/*
 #### Step 3: Create Four Classes
        - `Dragon` and `Gryphon` conforming to `FlyingMonster`.
        - `Kraken` and `Merfolk` conforming to `WaterMonster`.
 */
class Dragon: FlyingMonster {
    var name: String
    var wingSpan: Double
    
    init(name: String, wingSpan: Double) {
        self.name = name
        self.wingSpan = wingSpan
    }
    // the word "return" can be omitted if it is only a single line of code and if it is a string
    func roar() -> String {
        "\(name) roars fiercely, shaking the ground!"
    }
    
    func fly() -> String {
        "\(name) spreads its \(wingSpan)-meter wings and takes to the sky!"
    }
}

class Gryphon: FlyingMonster {
    var name: String
    var wingSpan: Double
    
    init(name: String, wingSpan: Double) {
        self.name = name
        self.wingSpan = wingSpan
    }
    
    func roar() -> String {
        "\(name) screeches with a piercing cry!"
    }
    
    func fly() -> String {
        "\(name) soars high with its majestic \(wingSpan)-meter wings!"
    }
}

class Kraken: WaterMonster {
    var name: String
    var swimSpeed: Int
    
    init(name: String, swimSpeed: Int) {
        self.name = name
        self.swimSpeed = swimSpeed
    }
    
      
    func roar() -> String {
        "\(name) bellows from the deep, causing waves to crash!"
    }
    
    func swim() -> String {
        "\(name) glides through the water at \(swimSpeed)knots!"
    }
}

class Merfolk: WaterMonster {
    var name: String
    var swimSpeed: Int
    
    init(name: String, swimSpeed: Int) {
        self.name = name
        self.swimSpeed = swimSpeed
    }
    
    func roar() -> String {
        "\(name) sings an enchanting melody that stirs the seas!"
    }
        
    func swim() -> String {
        "\(name) swims gracefully at \(swimSpeed) knots!"
    }
}

/*
 #### Step 4: Create a Function to Handle Monsters
    = `printMonsterDetails(monsters: [Monster])` to print information for each monster, using polymorphism to call appropriate methods based on their type.
 */

func printMonsterDetails(monsters: [Monster]) {
    for monster in monsters {
        print("Name: \(monster.name)")
        print("Roar: \(monster.roar())")
        
        if let flyingMonster = monster as? FlyingMonster {
            print("Wing Span: \(flyingMonster.wingSpan) meters")
            print(flyingMonster.fly())        }
        
        if let waterMonster = monster as? WaterMonster {
            print("Swim Speed: \(waterMonster.swimSpeed) knots")
        }
     }
}
// Call Appropirate methods
let dragon = Dragon(name: "Dragon", wingSpan: 15)
let gryphon = Gryphon(name: "Gryphon", wingSpan: 12)
let kraken = Kraken(name: "Kraken", swimSpeed: 20)
let merfolk = Merfolk(name: "Merlin", swimSpeed: 10)

printMonsterDetails(monsters: [dragon, gryphon, kraken, merfolk])
