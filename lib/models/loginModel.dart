class LoginModel {
  String? message;
  String? status;
  Data? data;

  LoginModel({this.message, this.status, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Loan? loan;
  User? user;
  String? token;

  Data({this.loan, this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    loan = json['loan'] != null ? new Loan.fromJson(json['loan']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loan != null) {
      data['loan'] = this.loan!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Loan {
  int? amountToPay;
  String? appliedOn;
  int? initialAmount;
  int? amountRemaining;
  String? id;
  Null? disbursedOn;
  String? status;

  Loan(
      {this.amountToPay,
        this.appliedOn,
        this.initialAmount,
        this.amountRemaining,
        this.id,
        this.disbursedOn,
        this.status});

  Loan.fromJson(Map<String, dynamic> json) {
    amountToPay = json['amountToPay'];
    appliedOn = json['appliedOn'];
    initialAmount = json['initialAmount'];
    amountRemaining = json['amountRemaining'];
    id = json['id'];
    disbursedOn = json['disbursedOn'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountToPay'] = this.amountToPay;
    data['appliedOn'] = this.appliedOn;
    data['initialAmount'] = this.initialAmount;
    data['amountRemaining'] = this.amountRemaining;
    data['id'] = this.id;
    data['disbursedOn'] = this.disbursedOn;
    data['status'] = this.status;
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? mobile;
  String? middleName;
  String? id;
  String? userId;
  String? email;

  User(
      {this.firstName,
        this.lastName,
        this.mobile,
        this.middleName,
        this.id,
        this.userId,
        this.email});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    middleName = json['middleName'];
    id = json['id'];
    userId = json['userId'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobile'] = this.mobile;
    data['middleName'] = this.middleName;
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['email'] = this.email;
    return data;
  }
}
