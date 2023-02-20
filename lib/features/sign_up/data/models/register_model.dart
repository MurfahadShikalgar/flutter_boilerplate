// ignore_for_file: prefer_collection_literals

class RegisterModel {
  late final String kind;
  late final String idToken;
  late final String email;
  late final String refreshToken;
  late final String expiresIn;
  late final String localId;

  RegisterModel(
      {this.kind = "",
      this.idToken = "",
      this.email = "",
      this.refreshToken = "",
      this.expiresIn = "",
      this.localId = ""});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    idToken = json['idToken'];
    email = json['email'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
    localId = json['localId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['kind'] = kind;
    data['idToken'] = idToken;
    data['email'] = email;
    data['refreshToken'] = refreshToken;
    data['expiresIn'] = expiresIn;
    data['localId'] = localId;
    return data;
  }
}
