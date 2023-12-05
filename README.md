# Dart 기초 for Flutter

## Important rules

- **;(세미콜론)** 주의하기 (세미콜론 자동완성 X)
- main() 함수 필수 (C언어처럼)
- Object 타입 = 타입스크립트의 any 타입
- Class에서 this 안 써도 됨(constructor 예외)

---

## #1 Variables

```dart
  var name = "nico";
  String name = "nico";
  bool alive = true;
  int age = 12;
  double money = 69.99;
  num x = 12;
  x = 1.1;
```

**\<Null Safety>**  
어떤 변수가 null이 될 가능성이 있을 때, null로 인한 런타임 에러가 나지 않도록 미리 예방  
String? name = "nico"; -> nico = null  
nico?.length 등등 자바스크립트의 Optional Chaining(?)과 비슷

**\<Dynamic 타입>**  
타입스크립트의 any와 같음

```dart
  dynamic name;
  name = 'nico';
  name = 12;
  name = true;
```

**\<Final 타입>**  
자바스크립트의 const와 같음

```dart
  final name = 'nico';
  final String name = 'nico';
```

**\<Late 타입>**  
초기 변수 설정할 때 사용

```dart
  late final String name;
  name = 'nico'; _----> (final 타입이므로 한번만 선언 가능)_
```

사용 예시) API에서 값 받아올 때

**\<Const 타입>**  
**자바스크립트의 const랑 조금 다름. 역할은 비슷함(고정된 변수)**

**컴파일 후 <span style="font-size: 1.5rem">절대</span> 바뀌지 않는 변수는 const, API fetch할 때와 같이 값이 한번은 바뀌고나서 고정되는 변수는 final 사용**  
따라서 late const는 불가능, late final은 가능

```dart
  const API_KEY = "";
  const max_allowed_price = 120;
```

---

## #2 Data Types

**\<List>**  
자바스크립트의 Array와 같음

- Collection if  
  배열에 조건문 포함 가능

```dart
  var numbers = [
    1,
    2,
    3,
    4,
    if (true) 5, //collection if
  ];

  print(numbers) // [1, 2, 3, 4, 5]
```

- Collection for  
  배열에 for문 포함 가능

```dart
  var oldFriends = ['nico', 'lynn'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var friend in oldFriends) "❤︎ $friend",
  ];

  print(newFriends); //[lewis, ralph, darren, ❤︎ nico, ❤︎ lynn]
```

**\<String Interpolation>**  
자바스크립트의 Template Literal과 비슷함

```dart
  var name = 'nico';
  var age = 10;
  var greeting = "Hello everyone, my name is $name and I'm ${age + 2}";

  print(greeting); //Hello everyone, my name is nico and I'm 12
```

**\<Map>**  
key, value로 이루어진 자바스크립트의 object와 비슷함

```dart
  var player = {1: true, 2: false, 3: true};

  Map<List<int>, bool> player = {
    [1, 2, 3, 4]: true,
  };

  List<Map<String, Object>> players = [
    {'name': 'nico', 'xp': 1234.123},
    {'name': 'lynn', 'xp': 1234.123}
  ];

  .
  .
  .

```

**\<Sets>**  
brackets로 감싸진 List, but 모든 요소가 고유함(중복 X)  
자바스크립트의 Set과 같음

```dart
  var numbers = {1, 2, 3, 4};

  Set<int> numbers = {1, 2, 3, 4};
  numbers.add(1);
  numbers.add(1);
  numbers.add(1);
  print(numbers); //{1, 2, 3, 4}
```

---

## #3 Functions

**\<Fat Arrow Notation>**  
"return . . ." = "=> . . ."

```dart
  String sayHello(String potato) => "Hello $potato nice to meet you!";

  String sayHello(String potato) {
    return . . .;
  }

  num plus(num a, num b) => a + b;

  void main() {
    print(sayHello('nico')); //Hello nico nice to meet you!
  }
```

**\<Named Parameters>**  
함수의 parameter들을 순서 상관없이 각각 이름을 지정하여 parameter를 전달할 수 있음 **+ Null Safety**

```dart
  String sayHello({String name, int age, String country}) => "Hello $name, you are $age, and you come from $country";


  void main() {
    print(sayHello(
        age: 12,
        country: 'cuba',
        name: 'nico',
    ));
  }
```

- Null Safety 해결 방법

> 1. default value 지정

```dart
  String sayHello({String name = 'default name', int age = 99, String country = 'default country'}) => . . .;
```

> 2. required 붙이기

```dart
  String sayHello({required String name, required int age, required String country}) => . . .;
```

> 3. Named Parameters 사용하지 않고 Optional Positional Parameters 사용하기

```dart
  String sayHello(String name, int age, [String? country = 'cuba']) => . . .; //default value 설정 안하면 null로 나옴
```

더 자세히: https://dart.dev/language/functions#optional-positional-parameters

**\<QQ Operator>**  
간단한 삼항연사자라고 보면 됨

```dart
left ?? right //left가 존재하면 left 그대로, 만약 left가 null이면 left = right가 됨
```

```dart
//before
  String capitalizeName(String? name) => name != null ? name.toUpperCase() : "default";

//after(QQ Operator)
  String capitalizeName(String? name) => name?.toUpperCase() ?? 'default';
```

```dart
  String? name;
  name ??= 'nico'; //name이 null이면 nico
  name = null; //name = null이므로
  name ??= 'another'; //name = 'another'가 된다
  print(name); //another
```

---

## #4 Classes

**\<Typedef>**  
자료형에 별칭을 붙여줄 수 있음

```dart
  typedef ListOfInts = List<int>;

  ListOfInts reverseListOfNumbers(ListOfInts list) {
    . . .
  };

//before
  String sayHi(Map<String, String> userInfo) {
    return "Hi ${userInfo['name']}";
  }

//after(Typedef)
  typedef UserInfo = Map<String, String>;

  String sayHi(UserInfo userInfo) {
    return "Hi ${userInfo['name']}";
  }

```

---

## #4 ★☆ Classes ☆★

Dart는 Class로 이루어져 있다  
JSON 데이터 등을 다룰 때 많이 쓰임

```dart
class Player {
  String name = 'nico';
  int xp = 1234;

  void sayHello() {
    print("Hi my name is $name"); // this.name
  }
}

void main() {
  var player = Player(); // new Player();
  print(player.name); //nico
  player.name = 'lalala'; //만약 final 붙어있었으면 수정 안됨
  print(player.name); //lalala
  player.sayHello(); //Hi my name is lalala
}
```

**\<Constructors>**  
Class에 parameters 추가할 수 있음

```dart
class Player {
  final String name = 'nico';
  int xp = 1234;

//before
  // Player(String name, int xp) {
  //   this.name = name;
  //   this.xp = xp;
  // }

//after(constructor)
  Player(this.name, this,xp);

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player("nico", 1500);
  player.sayHello(); //Hi my name is nico
  var player2 = Player("lynn", 2500);
  player2.sayHello(); //Hi my name is nico
}
```

**\<Named Constructor Parameters>**  
함수의 Named Parameters를 Class에서도 사용할 수 있음

```dart
class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player(
      {required this.name,
      required this.xp,
      required this.team,
      required this.age});
}

void main() {
  var player = Player(name: "nico", xp: 1200, team: "blue", age: 21);
  var player2 = Player(name: "lynn", xp: 2500, team: "blue", age: 12);
}

```

**\<Named Constructor>**  
여러 constructors를 만들 때 특정 parameter를 변경한 후 초기화할 수 있음

```dart
class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player(
      {required this.name,
      required this.xp,
      required this.team,
      required this.age});

//using named parameters
  Player.createBluePlayer({required String name, required int age})
      : this.age = age,
        this.name = name,
        this.team = "red",
        this.xp = 0;

//without named parameters
  Player.createRedPlayer(String name, int age)
      : this.age = age,
        this.name = name,
        this.team = "red",
        this.xp = 0;

//more compact way
  Player.createGreenPlayer(
      {required this.name,
      this.xp = 0,
      this.team = 'green',
      required this.age});
}

void main() {
  var bluePlayer = Player.createBluePlayer(name: "nico", age: 21);
  var redPlayer = Player.createRedPlayer("nico", 21);
  var greenPlayer = Player.createGreenPlayer(name: "nico", age: 21);
}
```

- **Class 사용 예시 (API)**

```dart
class Player {
  final String name;
  int xp;
  String team;

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var apiData = [
    {
      "name": "nico",
      "team": "red",
      "xp": 0,
    },
    {
      "name": "lynn",
      "team": "red",
      "xp": 0,
    },
    {
      "name": "dal",
      "team": "red",
      "xp": 0,
    },
  ];

  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}
```

**결과**

```
Hi my name is nico
Hi my name is lynn
Hi my name is dal
```

**\<Cascade Notation>**  
constructor 초기화할 때 간단하게 표현할 수 있음

```dart
class Player {
  String name;
  int xp;
  String team;

  Player({required this.name, required this.xp, required this.team});

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
//before
  // var nico = Player(name: 'nico', xp: 1200, team: 'red');

  // nico.name = 'las';
  // nico.xp = 1200000;
  // nico.team = 'blue';

//after(cascade notation)
  var nico = Player(name: 'nico', xp: 1200, team: 'red')
    ..name = 'las'
    ..xp = 120000
    ..team = 'blue';

  var potato = nico
  ..name = 'las'
  ..xp = 120000
  ..team = 'blue'
  ..sayHello();
}
```

**\<Enums>**  
코드 실수를 줄이기 위해 사용됨

```dart
  enum Team { red, blue }
  enum XPLevel { beginner, medium, pro }

  var nico = Player(
    name: 'nico',
    xp: XPLevel.medium,
    team: Team.red
  );
```

**\<Abstract Classes>**  
클래스가 무엇을 가지고 있는지 나타내는 청사진같은 역할을 함

```dart
  abstract class Human {
    void walk();
  }

  class Player extends Human {
    void walk() {
      . . .
    }
  }

  class Coach extends Human {
    void walk() {
      . . .
    }
  }
```

**\<Inheritance>**
여느 프로그래밍 언어의 클래스 상속 방식과 같음

```dart
class Human {
  final String name;
  Human({required this.name});
  void sayHello() {
    print("Hi my name is $name");
  }
}

enum Team { blue, red }

class Player extends Human {
  final Team team;

  Player({required this.team, required String name}) : super(name: name);

  @override
  void sayHello() {
    super.sayHello();
    print("and I play for ${team.name}");
  }
}

void main() {
  var player = Player(team: Team.red, name: 'nico');

  player.sayHello();
  // Hi my name is nico
  // and I play for red
}
```

**\<Mixins>**  
**constructor가 없는 클래스**가 가지고 있는 것들을 다른 클래스로 불러올 때 사용됨

```dart
mixin class Strong {
  final double strengthLevel = 1234.12;

}

mixin class QuickRunner {
  void runQuick() {
    print("ruuuuuun!");
  }
}

enum Team { blue, red }

class Player with Strong, QuickRunner {
  . . .
}

class Horse with Strong, QuickRunner {
  . . .
}

class Kid with QuickRunner {
  . . .
}

```
