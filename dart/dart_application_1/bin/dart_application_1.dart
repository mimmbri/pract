import 'dart:io';

// первоеS
class Cup {
  int voda = 500;
  void drank(int kolvo) {
    voda -= kolvo;
    print('Выпито $kolvo мл');
  }
}

class Chelovek {
  void drink(Cup c) {
    print('Пить? (да/нет)');
    String otvet = stdin.readLineSync()!;
    
    if (otvet == 'да') {
      print('Человек пьет, первое задание выполнено');
      c.drank(200);
    } else {
      print('Не пьет');
    }
  }
}

//второе

class Scaf {
  List<String> up_polka = [];
  List<String> down_polka = [];

  void klast(String kuda, String chto) {
    if (kuda == "верх") {
      up_polka.add(chto);
      print("$chto лежит на верхней полке");
    } else if (kuda == "низ") {
      down_polka.add(chto);
      print("$chto лежит на нижней полке");
    }
  }
  
  void vzat(String otkuda, String chto) {
    if (otkuda == "верх") {
      if (up_polka.contains(chto)) {
        up_polka.remove(chto);
        print("$chto взята с верхней полки");
      }
    } else if (otkuda == "низ") {
      if (down_polka.contains(chto)) {
        down_polka.remove(chto);
        print("$chto взята с нижней полки");
      }
    }
  }
  
  void pokazat() {
    print('Верхняя полка: $up_polka');
    print('Нижняя полка: $down_polka');
  }
}

//третье
class Blin {
  int ves;
  Blin(this.ves);
}

class Grif {
  int maxLoad;
  List<Blin> left = [];
  List<Blin> right = [];
  
  Grif(this.maxLoad);
  
  int currentWeight() {
    int sum = 0;
    for (var b in left) sum += b.ves;
    for (var b in right) sum += b.ves;
    return sum;
  }
  
  void addBlin(Blin b, String side) {
    if (currentWeight() + b.ves > maxLoad) {
      print('Много, масимум можно: $maxLoad кг');
      return;
    }
    
    if (side == 'left') {
      left.add(b);
      print('Блин ${b.ves} кг на левую сторону');
    } else if (side == 'right') {
      right.add(b);
      print('Блин ${b.ves} кг на правую сторону');
    }
  }
  
  void removeBlin(String side) {
    if (side == 'left' && left.isNotEmpty) {
      Blin removed = left.removeLast();
      print('Блин ${removed.ves} кг снят с левой стороны');
    } else if (side == 'right' && right.isNotEmpty) {
      Blin removed = right.removeLast();
      print('Блин ${removed.ves} кг снят с правой стороны');
    } else {
      print('На этой стороне нет блинов');
    }
  }
  
  void show() {
    print('Гриф: ${currentWeight()}/$maxLoad кг');
    print('Слева: ${left.length} блинов');
    print('Справа: ${right.length} блинов');
  }
}

void main() {
  // Первое задание
  print('первое');
  Chelovek a = Chelovek();
  Cup b = Cup();
  a.drink(b);
  
  // Второе задание
  print('\nвторое');
  Scaf sh = Scaf();
  
  sh.klast("верх", "Книга");
  sh.klast("верх", "Тетрадь");
  sh.klast("низ", "Обувь");
  sh.klast("низ", "Носки");
  
  sh.pokazat();
  
  sh.vzat("верх", "Книга");
  sh.vzat("низ", "Носки");
  
  sh.pokazat();
  
  print('Второе задание выполнено');
  
  // Третье задание
  print('\nтретье');
  Grif g = Grif(50);
  
  g.addBlin(Blin(10), 'left');
  g.addBlin(Blin(10), 'left');
  g.addBlin(Blin(20), 'right');
  g.addBlin(Blin(20), 'right');
  
  g.show();
  
  print('\nДобавим блинчч:');
  g.addBlin(Blin(15), 'left');
  
  print('\nСнимем блин:');
  g.removeBlin('left');
  
  g.show();
  
  print('Третье задание выполнено');
}