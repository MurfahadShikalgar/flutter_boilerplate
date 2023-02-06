// ignore_for_file: prefer_collection_literals

class Response400Model {
  int? code;
  String? message;
  List<Errors>? errors;

  Response400Model({this.code, this.message, this.errors});

  Response400Model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String? message;
  String? domain;
  String? reason;

  Errors({this.message, this.domain, this.reason});

  Errors.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    domain = json['domain'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['domain'] = domain;
    data['reason'] = reason;
    return data;
  }
}
