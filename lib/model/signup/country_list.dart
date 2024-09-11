class CountryPojo {
  bool? status;
  String? message;
  List<Data>? data;
  int? code;

  CountryPojo({this.status, this.message, this.data, this.code});

  CountryPojo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? name;
  String? isoCode;
  String? flag;
  String? phonecode;
  String? currency;
  String? latitude;
  String? longitude;
  List<Timezones>? timezones;

  Data(
      {this.name,
        this.isoCode,
        this.flag,
        this.phonecode,
        this.currency,
        this.latitude,
        this.longitude,
        this.timezones});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isoCode = json['isoCode'];
    flag = json['flag'];
    phonecode = json['phonecode'];
    currency = json['currency'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['timezones'] != null) {
      timezones = <Timezones>[];
      json['timezones'].forEach((v) {
        timezones!.add(new Timezones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isoCode'] = this.isoCode;
    data['flag'] = this.flag;
    data['phonecode'] = this.phonecode;
    data['currency'] = this.currency;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.timezones != null) {
      data['timezones'] = this.timezones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timezones {
  String? zoneName;
  int? gmtOffset;
  String? gmtOffsetName;
  String? abbreviation;
  String? tzName;

  Timezones(
      {this.zoneName,
        this.gmtOffset,
        this.gmtOffsetName,
        this.abbreviation,
        this.tzName});

  Timezones.fromJson(Map<String, dynamic> json) {
    zoneName = json['zoneName'];
    gmtOffset = json['gmtOffset'];
    gmtOffsetName = json['gmtOffsetName'];
    abbreviation = json['abbreviation'];
    tzName = json['tzName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zoneName'] = this.zoneName;
    data['gmtOffset'] = this.gmtOffset;
    data['gmtOffsetName'] = this.gmtOffsetName;
    data['abbreviation'] = this.abbreviation;
    data['tzName'] = this.tzName;
    return data;
  }
}
