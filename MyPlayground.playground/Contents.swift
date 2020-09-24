import UIKit

var str = "Hello, playground"

print(str)

let str2 = "this is a constant string"

print(str2)

var names: [String] = ["AAA", "BBB", "CCC"]

let name = names[2]

print(name)

for name in names {
    print(name)
}

var user: [String: Any] = [
    "name": "AAA",
    "home": "BBB",
    "zip": 98105
]

print(user["name"] as! String)
print(user["zip"] as! Int) // force to wrap

let users: [[String: Any]] =  [[String: Any]]( )

