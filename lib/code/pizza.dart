class pizza{

  static List<String> sizes = <String>["Small","Medium","Large"];
  static List<String> shapes = <String>["Circle","Square","Ellipse","Triangle", "Triangle", "Octagon"];
  static List<String> crest = <String>["Thin crest","Thick crest","Stuffed","Edge-Stuffed","Double Layer", "Triple Layer"];


  String size = sizes.elementAt(0);
  String shape = shapes.elementAt(0);
  String crust = crest.elementAt(0);
  Map<String, bool> toppings = new Map<String, bool>();
  Map<String, bool> additional = new Map<String, bool>();

  pizza() {

    toppings.putIfAbsent("Chicken", () => false);
    toppings.putIfAbsent("Onion", () => false);
    toppings.putIfAbsent("Beef", () => false);
    toppings.putIfAbsent("Macon", () => false);
    toppings.putIfAbsent("Pineapple", () => false);
    toppings.putIfAbsent("Mushroom", () => false);
    toppings.putIfAbsent("Pepperoni", () => false);
    
    additional.putIfAbsent("Pasta", () => false);
    additional.putIfAbsent("Garlic Bread", () => false);
    additional.putIfAbsent("Ginger Bread", () => false);
    additional.putIfAbsent("Coke", () => false);
    additional.putIfAbsent("Lemonade", () => false);

  }
}