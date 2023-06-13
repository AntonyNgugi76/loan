class SeedFundModel {
  String? message;
  String? status;
  Data? data;

  SeedFundModel({this.message, this.status, this.data});

  SeedFundModel.fromJson(Map<String, dynamic> json) {
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
  List<SeedFunds>? seedFunds;

  Data({this.seedFunds});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['seedFunds'] != null) {
      seedFunds = <SeedFunds>[];
      json['seedFunds'].forEach((v) {
        seedFunds!.add(new SeedFunds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seedFunds != null) {
      data['seedFunds'] = this.seedFunds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeedFunds {
  String? reason;
  String? otherInfo;
  List<String>? sectors;
  String? impact;
  String? about;
  List<String>? founders;
  String? stemInitiative;
  bool? womanOwned;
  String? marketing;
  String? appliedOn;
  bool? fundraised;
  List<String>? primaryTarget;
  String? provenTransaction;
  String? id;
  User? user;
  String? bridging;
  String? problems;
  String? status;

  SeedFunds(
      {this.reason,
        this.otherInfo,
        this.sectors,
        this.impact,
        this.about,
        this.founders,
        this.stemInitiative,
        this.womanOwned,
        this.marketing,
        this.appliedOn,
        this.fundraised,
        this.primaryTarget,
        this.provenTransaction,
        this.id,
        this.user,
        this.bridging,
        this.problems,
        this.status});

  SeedFunds.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    otherInfo = json['otherInfo'];
    sectors = json['sectors'].cast<String>();
    impact = json['impact'];
    about = json['about'];
    founders = json['founders'].cast<String>();
    stemInitiative = json['stemInitiative'];
    womanOwned = json['womanOwned'];
    marketing = json['marketing'];
    appliedOn = json['appliedOn'];
    fundraised = json['fundraised'];
    primaryTarget = json['primaryTarget'].cast<String>();
    provenTransaction = json['provenTransaction'];
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    bridging = json['bridging'];
    problems = json['problems'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    data['otherInfo'] = this.otherInfo;
    data['sectors'] = this.sectors;
    data['impact'] = this.impact;
    data['about'] = this.about;
    data['founders'] = this.founders;
    data['stemInitiative'] = this.stemInitiative;
    data['womanOwned'] = this.womanOwned;
    data['marketing'] = this.marketing;
    data['appliedOn'] = this.appliedOn;
    data['fundraised'] = this.fundraised;
    data['primaryTarget'] = this.primaryTarget;
    data['provenTransaction'] = this.provenTransaction;
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['bridging'] = this.bridging;
    data['problems'] = this.problems;
    data['status'] = this.status;
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? userId;

  User({this.firstName, this.lastName, this.userId});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userId'] = this.userId;
    return data;
  }
}
