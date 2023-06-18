class User {
  String id;
  String names;
  String surnames;
  String identification;
  String contactNumber;
  String username;

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        names = json["names"],
        surnames = json["surnames"],
        identification = json["identification"],
        username = json["username"],
        contactNumber = json["contactNumber"];
}