abstract class Burger {
  String getDescription();
  double getCost();
}

class PlainBurger implements Burger {
  @override
  String getDescription() {
    return 'tomatoes, onions, lettace, pickles, mustard, ketchup, bacon';
  }

  @override
  double getCost() {
    return 5;
  }
}

abstract class Topping implements Burger {
  Burger burger;
  Topping({required this.burger});

  @override
  double getCost() {
    return burger.getCost();
  }

  @override
  String getDescription() {
    return burger.getDescription();
  }
}

class AddTopping extends Topping {
  final String toppingName;
  final double toppingCost;
  AddTopping({
    required super.burger,
    required String this.toppingName,
    required double this.toppingCost,
  });

  @override
  double getCost() {
    return super.getCost() + toppingCost;
  }

  @override
  String getDescription() {
    print("Added $toppingName");
    return super.getDescription() + ', ' + toppingName;
  }
}

class ToppingModel {
  ToppingModel({required this.toppingCost, required this.toppingName});
  final String toppingName;
  final double toppingCost;
}

void main() {
  Burger plainBurger = PlainBurger();
  final cheese = ToppingModel(toppingCost: 0.3, toppingName: 'Cheese');
  final egg = ToppingModel(toppingCost: 0.5, toppingName: 'Egg');

  print('Plain Burger Cost ${plainBurger.getCost()}');
  print('Plain Burger Description ${plainBurger.getDescription()}');

  plainBurger = AddTopping(
      burger: plainBurger,
      toppingName: cheese.toppingName,
      toppingCost: cheese.toppingCost);

  print('Plain Burger Description ${plainBurger.getDescription()}');
  print('Plain Burger with cheese Cost ${plainBurger.getCost()}');

  plainBurger = AddTopping(
      burger: plainBurger,
      toppingName: egg.toppingName,
      toppingCost: egg.toppingCost);
  print('Plain Burger Description ${plainBurger.getDescription()}');
  print('Plain Burger with cheese and egg Cost ${plainBurger.getCost()}');
}
