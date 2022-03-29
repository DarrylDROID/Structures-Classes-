/*** STRUCTURES ***/

// Instance method

struct Hero {
  var name: String
  var physicalAttack = 0
  var bonusAttack = 0

  func physicalDamage() -> Int {
    physicalAttack + bonusAttack
  }
}

var xavier = Hero(name: "Xavier")
xavier.physicalAttack = 1_200
xavier.bonusAttack = 100
print(xavier.physicalDamage())

// Overloading and Mutatic Method

struct Hero {
  var name: String
  var health: Int

  // mutating
  mutating func decreaseHP() {
    health -= 100
  }

  // overloading
  mutating func decreaseHP(by point: Int) {
    health -= point
  }

  mutating func
  decreaseHP(instantKill: Bool) {
    if instantKill {
      health -= health
    }
  }
}

var melissa = Hero(name: "Melissa", health: 2_300)

melissa.decreaseHP()
melissa.decreaseHP()
print(melissa.health)

melissa.decreaseHP(by: 1_000)
print(melissa.health)

melissa.decreaseHP(instantKill: true)
print(melissa.health)

// Computed Property

struct Hero {
  // general properties...
  var name: String
  var baseDamage: Int
  var bonusDamage: Int

  // computed property #1
  var physicalDamage: Int {
    baseDamage + bonusDamage 
  }

  // computed property #2
  var criticalDamage: Int {
    (baseDamage + bonusDamage) * 3
  }
}

var xavier = Hero(name: "Xavier",
baseDamage: 1_000, bonusDamage: 50)

print(xavier.physicalDamage)
print(xavier.criticalDamage)

//  Copying a Struct

struct Hero {
  var health = 100
}

var heroXYZ = Hero()
print("Hero XYZ HP: ", heroXYZ.health)

let shadow = heroXYZ
print("Shadow HP: ", shadow.health)

heroXYZ.health = 2_000
print()

print("Hero XYZ HP: ", heroXYZ.health)
print("Shadow HP: ", shadow.health)

/*** CLASSES ***/

// Creating a (simple) Class

class Equipment {
  var name: String = ""
}

let item = Equipment()

// Initializer (Constructor)

class Equipment {
  var name: String
  var tier: Int = 1

  init(name: String) {
    self.name = name
  }

  // Overloading initializer
  init(name: String, tier: Int) {
    self.name = name
    self.tier = tier
  }
}

let itemA = Equipment(name: "Item AAA")
print(itemA.name, itemA.tier)

let itemB = Equipment(name: "Item BBB", tier: 3)
print(itemB.name, itemB.tier)

// Inheritance

class Equipment {
  var name: String
  
  init(name: String) {
    self.name = name
  }

  func equip() {
    print("\(name) is equipped.")
  }
}

class AttackEquipment: Equipment {
  // 
}

class DefenseEquipment: Equipment {
  // 
}

let sword = AttackEquipment(name: "Legion Sword")
sword.equip()

let armor = DefenseEquipment(name: "Radiant Armor")
armor.equip()

// Overriding

class Equipment {
  var name: String

  init(name: String) {
    self.name = name
}
  
func equip() {
  print("\(name) is equipped.")
  }
}

class AttackEquipment: Equipment {
  var bonusATK: Int
  
  // Overriding initializer
  init(name: String, bonusATK: Int) {
    self.bonusATK = bonusATK

    super.init(name: name)
  }

  // Overriding method
  override func equip() {
    print("\(name) with \(bonusATK) bonus attack is equipped")
  }
}

class DefenseEquipment: Equipment {
  var bonusDEF: Int

  // Overriding initializer
  init(name: String, bonusDEF: Int) {
    self.bonusDEF = bonusDEF
    
    super.init(name: name)
  }

  // Overriding method
  override func equip() {
    print("\(name) with \(bonusDEF) bonus defense is equipped")
  }
}

let sword = AttackEquipment(name: "Legion Sword", bonusATK: 60)
sword.equip()

let armor = DefenseEquipment(name: "Radiant Armor", bonusDEF: 52)
armor.equip()

/*** STRUCT vs CLASS ***/

// 1. Initializer dalam Struct comes free untuk semua properties yang dimiliki, sedangkan dalam Class initializer-nya harus ditulis eksplisit

// 2. Inheritance hanya berlaku untuk Class (Struct tidak bisa punya child/sub-struct)

// 3. Struct adalah tipe data VALUE type, sedangkan Class adalah tipe data REFERENCE type

/// Struct is a VALUE type

struct Hero {
  var name: String
  var health: Int

  fun castSkill(_ name: String) {
    print("\(self.name) casting: \(name)")
  }

  mutating func decreaseHP(by point: Int) {
    health -= point
  }
}

var sun = Hero(name: "Sun", health: 2_750)

sun.castSkill("Clone Techniques")

var sunCopy = sun

print("Original Sun and his copy got attacked!")

sun.decreaseHP(by: 1_000)
sunCopy.decreaseHP(by: 2_000)

print("Sun (original) HP: ", sun.health)
print("Sun (copy) HP: ", sunCopy.health)

/// Class is a REFERENCE type

class Hero {
  var name: String
  var health: Int

  init(name: String, health: Int) {
    self.name = name
    self.health = health
  }

  func castSkill(_ name: String) {
    print("\(self.name) casting: \(name)")
  }

  func decreaseHP(by point: Int) {
    health -= point
  }
}

var atlas = Hero(name: "Atlas", health: 2_000)

atlas.castSkill("Perfect Match")

var atlasClone = atlas

print("Original Atlas and his clone got attacked!")

atlas.decreaseHP(by: 800)
atlasClone.decreaseHP(by: 1_300)

print("Atlas (original) HP: ", atlas.health)
print("Atkas (clone) HP: ", atlasClone.health)