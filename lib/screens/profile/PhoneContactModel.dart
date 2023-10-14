class PhoneContact {
  List<Data>? data;

  PhoneContact({this.data});

  PhoneContact.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? memberId;
  String? name;
  String? phone;
  String? email;
  String? type;

  Data({this.memberId, this.name, this.phone, this.email, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.memberId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['type'] = this.type;
    return data;
  }
}