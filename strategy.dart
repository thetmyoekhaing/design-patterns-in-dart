import 'dart:async';

abstract class GetFuelConsumption {
  void calculateFuel(int fuel);
}

class Electric implements GetFuelConsumption {
  String name = 'electric';
  @override
  void calculateFuel(int fuel) {
    print("$fuel electric consumption");
  }

  void printFuel() {
    print("fuel");
  }
}

class Fossil implements GetFuelConsumption {
  String name = 'fossil';
  @override
  void calculateFuel(int fuel) {
    print("$fuel fossil consumption");
  }

  void printFossil() {
    print("fossil");
  }
}

class Car {
  GetFuelConsumption fuelConsumption;
  String name;
  int price;
  int consumption;

  Car(
      {required this.name,
      required this.price,
      required this.fuelConsumption,
      required this.consumption});

  void getPrice() {
    print("$name is $price\$");
  }

  void milesDriven(int mile) {
    print("$name is driven $mile miles");
  }

  void updateFuelType(String fuelType) {
    switch (fuelType.toLowerCase()) {
      case 'electric':
        fuelConsumption = Electric();
        break;
      case 'fossil':
        fuelConsumption = Fossil();
        break;
      default:
        print("Invalid fuel type.");
    }
  }
}

void main() {
  Electric electric = Electric();
  Fossil fossil = Fossil();
  Car tesla = Car(
      name: "Tesla", price: 9999, fuelConsumption: electric, consumption: 10);
  Car toyota = Car(
      name: "Toyota", price: 8888, fuelConsumption: fossil, consumption: 11);

  for (var car in [tesla, toyota]) {
    print("Hey ${car.name}, how much is your fuel consumption?");
    car.fuelConsumption.calculateFuel(car.consumption);
  }
}
