var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"



 
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
    "Banana":String(10)
]

occupations["Jayne"] = "Public Relations"
occupations["whatever"] = "some job"


for (key,value) in occupations {
    println (key + " " + value)
}
