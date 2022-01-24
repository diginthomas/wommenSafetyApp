class User {
  int id;
  String phone;
  User({required this.id, required this.phone});

  static User fromMap(Map<String, dynamic> data) {
    final id = data['id'] as int;
    final phone = data['Phnum'].toString();
    return User(id: id, phone: phone);
  }
}
