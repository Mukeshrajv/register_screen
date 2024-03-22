class Login {
  int? code;
  int? status;
  List<Data>? data;

  Login(item, {this.code, this.status, this.data});

  Login.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? websiteId;
  String? userName;
  String? email;
  String? password;
  String? passwordEncode;
  String? masterPassword;
  String? registerKeys;
  String? registerValues;
  String? customerType;
  String? multiplier;
  String? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? guestUserId;
  String? verifyEmailAddress;
  String? phone;

  Data(
      {this.id,
      this.websiteId,
      this.userName,
      this.email,
      this.password,
      this.passwordEncode,
      this.masterPassword,
      this.registerKeys,
      this.registerValues,
      this.customerType,
      this.multiplier,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.guestUserId,
      this.verifyEmailAddress,
      this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    websiteId = json['website_id'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
    passwordEncode = json['password_encode'];
    masterPassword = json['master_password'];
    registerKeys = json['register_keys'];
    registerValues = json['register_values'];
    customerType = json['customer_type'];
    multiplier = json['multiplier'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    guestUserId = json['guest_user_id'];
    verifyEmailAddress = json['verify_email_address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['website_id'] = this.websiteId;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_encode'] = this.passwordEncode;
    data['master_password'] = this.masterPassword;
    data['register_keys'] = this.registerKeys;
    data['register_values'] = this.registerValues;
    data['customer_type'] = this.customerType;
    data['multiplier'] = this.multiplier;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['guest_user_id'] = this.guestUserId;
    data['verify_email_address'] = this.verifyEmailAddress;
    data['phone'] = this.phone;
    return data;
  }
}