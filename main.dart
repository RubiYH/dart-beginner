// mixin class Strong {
//   final double strengthLevel = 1234.12;

// }

// mixin class QuickRunner {
//   void runQuick() {
//     print("ruuuuuun!");
//   }
// }

// enum Team { blue, red }

// class Player with Strong, QuickRunner {
//   . . .
// }

// class Horse with Strong, QuickRunner {
//   . . .
// }

// class Kid with QuickRunner {
//   . . .
// }

// class Human {
//   final String name;
//   Human({required this.name});
//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// enum Team { blue, red }

// class Player extends Human {
//   final Team team;

//   Player({required this.team, required String name}) : super(name: name);

//   @override
//   void sayHello() {
//     super.sayHello();
//     print("and I play for ${team.name}");
//   }
// }

// void main() {
//   var player = Player(team: Team.red, name: 'nico');

//   player.sayHello();
// }

// abstract class Human {
//   void walk();

// }

// class Player extends Human {

// }

// class Coach extends Human {

// }

// enum Team { red, blue }

// enum XPLevel {beginner, medium, pro}

// class Player {
//   String name;
//   int xp;
//   String team;

//   Player({required this.name, required this.xp, required this.team});

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
// //before
//   var nico = Player(name: 'nico', xp: 1200, team: 'red');

//   nico.name = 'las';
//   nico.xp = 1200000;
//   nico.team = 'blue';

// //after(cascade notation)
//   var nico = Player(name: 'nico', xp: 1200, team: 'red')
//     ..name = 'las'
//     ..xp = 120000
//     ..team = 'blue';

//   var potato = nico
//   ..name = 'las'
//   ..xp = 120000
//   ..team = 'blue'
//   ..sayHello();
// }

// class Player {
//   final String name;
//   int xp;
//   String team;

//   Player.fromJson(Map<String, dynamic> playerJson)
//       : name = playerJson['name'],
//         xp = playerJson['xp'],
//         team = playerJson['team'];

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var apiData = [
//     {
//       "name": "nico",
//       "team": "red",
//       "xp": 0,
//     },
//     {
//       "name": "lynn",
//       "team": "red",
//       "xp": 0,
//     },
//     {
//       "name": "dal",
//       "team": "red",
//       "xp": 0,
//     },
//   ];

//   apiData.forEach((playerJson) {
//     var player = Player.fromJson(playerJson);
//     player.sayHello();
//   });
// }

// class Player {
//   final String name;
//   int xp;
//   String team;
//   int age;

//   Player(
//       {required this.name,
//       required this.xp,
//       required this.team,
//       required this.age});

// //using named parameters
//   Player.createBluePlayer({required String name, required int age})
//       : this.age = age,
//         this.name = name,
//         this.team = "red",
//         this.xp = 0;

// //without named parameters
//   Player.createRedPlayer(String name, int age)
//       : this.age = age,
//         this.name = name,
//         this.team = "red",
//         this.xp = 0;

// //more compact way
//   Player.createGreenPlayer(
//       {required this.name,
//       this.xp = 0,
//       this.team = 'green',
//       required this.age});
// }

// void main() {
//   var bluePlayer = Player.createBluePlayer(name: "nico", age: 21);
//   var redPlayer = Player.createRedPlayer("nico", 21);
//   var greenPlayer = Player.createGreenPlayer(name: "nico", age: 21);
// }

// class Player {
//   final String name;
//   int xp;
//   String team;
//   int age;

//   Player(
//       {required this.name,
//       required this.xp,
//       required this.team,
//       required this.age});
// }

// void main() {
//   var player = Player(name: "nico", xp: 1200, team: "blue", age: 21);
//   var player2 = Player(name: "lynn", xp: 2500, team: "blue", age: 12);
// }

// class Player {
//   String name = 'nico';
//   int xp = 1234;

//   // Player(String name, int xp) {
//   //   this.name = name;
//   //   this.xp = xp;
//   // }

//   Player(this.name, this.xp);

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// class Player {
//   final String name = 'nico';
//   int xp = 1234;

//   void sayHello() {
//     print("Hi my name is $name");
//   }
// }

// void main() {
//   var player = Player("nico", 1500);
//   player.sayHello();
//   var player2 = Player("lynn", 2500);
//   player2.sayHello();
// }

// void main() {
//   var player = Player();
//   print(player.name);
//   player.name = 'lalala';
//   print(player.name);
//   player.sayHello();
// }

// typedef ListOfInts = List<int>;

// ListOfInts reverseListOfNumbers(ListOfInts list) {
//   var reversed = list.reversed;
//   return reversed.toList();
// }

// typedef UserInfo = Map<String, String>;

// String sayHi(UserInfo userInfo) {
//   return "Hi ${userInfo['name']}";
// }

// void main() {
//   print(sayHi({"name": "nico"}));
// }

// void main() {
//   String? name;
//   name ??= 'nico';
//   name = null;
//   name ??= 'another';
//   print(name);
// }

// String capitalizeName(String? name) => name?.toUpperCase() ?? 'default';

// String capitalizeName(String? name) => name?.toUpperCase() ?? 'default';

// String capitalizeName(String? name) =>
//     name != null ? name.toUpperCase() : "default";

// String capitalizeName(String? name) {
//   if (name != null) {
//     return name.toUpperCase();
//   }
//   return 'default';
// }

// void main() {
//   capitalizeName('nico');
//   capitalizeName(null);
// }

// String sayHello(String name, int age, [String? country = 'cuba']) =>
//     "Hello $name, you are $age, and you come from $country";

// String sayHello(
//         {String name = 'default name',
//         int age = 99,
//         String country = 'default country'}) =>
//     "Hello $name, you are $age, and you come from $country";

// String sayHello(
//         {required String name, required int age, required String country}) =>
//     "Hello $name, you are $age, and you come from $country";

// void main() {
//   print(sayHello(
//     age: 12,
//     country: 'cuba',
//     // name: 'nico',
//   ));
// }

// void main() {

// Set<int> numbers = {1, 2, 3, 4};
// numbers.add(1);
// numbers.add(1);
// numbers.add(1);
// print(numbers); //{1, 2, 3, 4}

// var numbers = {1, 2, 3, 4};

// List<Map<String, Object>> players = [
//   {'name': 'nico', 'xp': 1234.123},
//   {'name': 'lynn', 'xp': 1234.123}
// ];

// Map<List<int>, bool> player = {
//   [1, 2, 3, 4]: true,
// };

// var player = {1: true, 2: false, 3: true};

// var oldFriends = ['nico', 'lynn'];
// var newFriends = [
//   'lewis',
//   'ralph',
//   'darren',
//   for (var friend in oldFriends) "❤︎ $friend",
// ];

// print(newFriends);

// var name = 'nico';
// var age = 10;
// var greeting = "Hello everyone, my name is $name and I'm ${age + 2}";

// print(greeting);

// var numbers = [
//   1,
//   2,
//   3,
//   4,
//   if (true) 5,
// ];

// print(numbers);

// late final String name;
// final name = 'nico';
// final String name = 'nico';

// dynamic name;
// name = 'nico';
// name = 12;
// name = true;

// var name = "nico";
// String name = "nico";
// bool alive = true;
// int age = 12;
// double money = 69.99;
// num x = 12;
// x = 1.1;
// }
