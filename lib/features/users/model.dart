class UsersData {
  late final List<UsersModel> data;

  UsersData.fromJson(List<dynamic> json) {
    data = json.map((e) => UsersModel.fromJson(e)).toList();
  }
}

class UsersModel {
  late final num id;
  late final String name;
  late final String username;
  late final String email;
  late final Address address;

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    address = Address.fromJson(json['address']);
  }
}

class Address{
  late final String street;
  late final String suite;
  late final String city;
  late final String zipcode;

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'] ?? "";
    suite = json['suite'] ?? "";
    city = json['city'] ?? "";
    zipcode = json['zipcode'] ?? "";
  }
}
