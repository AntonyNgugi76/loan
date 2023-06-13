class LoanApplicationModel {
  String? message;
  String? status;
  Data? data;

  LoanApplicationModel({this.message, this.status, this.data});

  LoanApplicationModel.fromJson(Map<String, dynamic> json) {
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

  Data({this.loan});

  Data.fromJson(Map<String, dynamic> json) {
    loan = json['loan'] != null ? new Loan.fromJson(json['loan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loan != null) {
      data['loan'] = this.loan!.toJson();
    }
    return data;
  }
}

class Loan {
  String? appliedOn;
  double? initialAmount;
  double? amountRemaining;
  String? id;
  Null? disbursedOn;
  String? status;

  Loan(
      {this.appliedOn,
        this.initialAmount,
        this.amountRemaining,
        this.id,
        this.disbursedOn,
        this.status});

  Loan.fromJson(Map<String, dynamic> json) {
    appliedOn = json['appliedOn'];
    initialAmount = json['initialAmount'];
    amountRemaining = json['amountRemaining'];
    id = json['id'];
    disbursedOn = json['disbursedOn'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appliedOn'] = this.appliedOn;
    data['initialAmount'] = this.initialAmount;
    data['amountRemaining'] = this.amountRemaining;
    data['id'] = this.id;
    data['disbursedOn'] = this.disbursedOn;
    data['status'] = this.status;
    return data;
  }
}
