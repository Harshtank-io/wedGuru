class User {
  final int? id;
  final String name;
  final String gender;
  final String city;
  final String description;
  static final columns = ["id", "name", "gender", "city", "description" , "isLiked"];
   bool isliked;


  User({
    this.id,
    required this.name,
    required this.gender,
    required this.city,
    required this.description,
    this.isliked = false,
  });

  User copyWith({int? id, String? name, String? city, String? gender , String? description ,}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      city: city ?? this.city,
      gender: gender ?? this.gender,
      description: description ?? this.description,
    );
  }

  // Convert the User object to a map for database insertion.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'city': city,
      'description': description,
      'isLiked' : isliked ? 1 : 0,
    };
  }

  // Convert a map to a User object.
  static User fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      name: data['name'],
      gender: data['gender'],
      city: data['city'],
      description: data['description'],
        isliked :data['isLiked'].toString()=="0"?false:true,
    );
  }
}
