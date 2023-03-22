// class Persons {
//   final int? id;
//   final String name;
//   final int age ;
//   final String city;
//   final String description;
//   final String phone;
//
//   Persons({
//     this.id,
//     required this.name,
//     required this.age,
//     required this.city,
//     required this.description,
//     required this.phone,
//   });
//
//   factory Persons.fromMap(Map<String, dynamic> json) => Persons(
//     id: json['id'],
//     name: json['name'],
//     age: json['age'],
//     city: json['city'],
//     description: json['description'],
//     phone: json['phone'],
//   );
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'age' : age,
//       'city' : city,
//       'description' : description,
//       'phone' : phone
//     };
//   }
// }