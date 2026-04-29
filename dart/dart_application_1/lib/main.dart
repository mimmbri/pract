// 1. Кружка и Человек
class Cup {
  int volume; // мл
  int current;
  Cup(this.volume) : current = volume;
  void drink(int amount) => current = (current - amount).clamp(0, volume);
}

class Person {
  String name;
  Person(this.name);
  void drinkFrom(Cup cup, int amount) => cup.drink(amount);
}

// 2. Шкаф с системами хранения
class StorageSystem {
  List<String> items = [];
  void put(String item) => items.add(item);
  String? take() => items.isNotEmpty ? items.removeLast() : null;
}

class Wardrobe {
  List<StorageSystem> systems;
  Wardrobe(this.systems);
  void putItem(int systemIndex, String item) => systems[systemIndex].put(item);
  String? takeItem(int systemIndex) => systems[systemIndex].take();
}

// 3. Гриф и Блин
class BarbellDisc {
  double weight;
  BarbellDisc(this.weight);
}

class Barbell {
  double maxLoad;
  double leftWeight = 0, rightWeight = 0;
  Barbell(this.maxLoad);
  bool addLeft(BarbellDisc disc) {
    if (leftWeight + disc.weight <= maxLoad / 2) {
      leftWeight += disc.weight;
      return true;
    }
    return false;
  }
  bool addRight(BarbellDisc disc) {
    if (rightWeight + disc.weight <= maxLoad / 2) {
      rightWeight += disc.weight;
      return true;
    }
    return false;
  }
  double totalWeight() => leftWeight + rightWeight;
}

// 4. Конвертер валют
class CurrencyConverter {
  Map<String, double> rates;
  CurrencyConverter(this.rates);
  double convert(double amount, String from, String to) =>
      amount / rates[from]! * rates[to]!;
}

// 5. Гараж с дженериками
class Garage<T> {
  List<T> items = [];
  void store(T item) => items.add(item);
  T? retrieve() => items.isNotEmpty ? items.removeLast() : null;
}

// 6. Класс с перегрузкой арифметических операций
class Vector {
  int x, y;
  Vector(this.x, this.y);
  Vector operator +(Vector other) => Vector(x + other.x, y + other.y);
  Vector operator -(Vector other) => Vector(x - other.x, y - other.y);
  Vector operator *(int scalar) => Vector(x * scalar, y * scalar);
  Vector operator ~/(int scalar) => Vector(x ~/ scalar, y ~/ scalar);
  @override String toString() => '($x,$y)';
}

// 7. Автомобиль с перечислениями
enum CarState { stop, move, turn }
class Car {
  CarState state = CarState.stop;
  void drive() => state = CarState.move;
  void stop() => state = CarState.stop;
  void turn() => state = CarState.turn;
}

// 8. Геометрические фигуры
abstract class Shape {
  double area();
}
class Rectangle extends Shape {
  double w, h;
  Rectangle(this.w, this.h);
  @override double area() => w * h;
}
class Circle extends Shape {
  double r;
  Circle(this.r);
  @override double area() => 3.14159 * r * r;
}
class Triangle extends Shape {
  double base, height;
  Triangle(this.base, this.height);
  @override double area() => 0.5 * base * height;
}

// 9. Конвертер систем счисления
class BaseConverter {
  static String decToHex(int n) => n.toRadixString(16);
  static String decToOct(int n) => n.toRadixString(8);
  static int hexToDec(String hex) => int.parse(hex, radix: 16);
  static int octToDec(String oct) => int.parse(oct, radix: 8);
}

// 10. Список фигур с поиском макс площади
class ShapeList {
  List<Shape> shapes = [];
  void add(Shape s) => shapes.add(s);
  Shape get maxAreaShape => shapes.reduce((a, b) => a.area() > b.area() ? a : b);
}

// 11. Стол и столовые приборы
abstract class Utensil {}
class Fork extends Utensil {}
class Spoon extends Utensil {}
class Knife extends Utensil {}

class Table {
  List<Utensil> utensils = [];
  void put(Utensil u) => utensils.add(u);
  Utensil? take() => utensils.isNotEmpty ? utensils.removeLast() : null;
}

// Демонстрация
void main() {
  // 1
  var cup = Cup(500);
  var person = Person('Alice');
  person.drinkFrom(cup, 200);
  print('Cup left: ${cup.current} ml');

  // 2
  var wardrobe = Wardrobe([StorageSystem(), StorageSystem()]);
  wardrobe.putItem(0, 'Shirt');
  print('Take: ${wardrobe.takeItem(0)}');

  // 3
  var barbell = Barbell(100);
  barbell.addLeft(BarbellDisc(20));
  barbell.addRight(BarbellDisc(20));
  print('Barbell total: ${barbell.totalWeight()} kg');

  // 4
  var conv = CurrencyConverter({'USD': 1.0, 'EUR': 0.85});
  print('100 USD = ${conv.convert(100, 'USD', 'EUR')} EUR');

  // 5
  var garage = Garage<String>();
  garage.store('Bike');
  print('Garage retrieve: ${garage.retrieve()}');

  // 6
  var v1 = Vector(1, 2);
  var v2 = Vector(3, 4);
  print('v1+v2 = ${v1 + v2}');

  // 7
  var car = Car();
  car.drive();
  print('Car state: ${car.state}');

  // 8
  ShapeList shapes = ShapeList();
  shapes.add(Rectangle(3, 4));
  shapes.add(Circle(5));
  shapes.add(Triangle(6, 8));
  print('Max area: ${shapes.maxAreaShape.area()}');

  // 9
  print('255 in hex: ${BaseConverter.decToHex(255)}');
  print('FF in dec: ${BaseConverter.hexToDec('FF')}');

  // 10 (уже показано)

  // 11
  var table = Table();
  table.put(Fork());
  table.put(Spoon());
  print('Taken utensil: ${table.take().runtimeType}');
}