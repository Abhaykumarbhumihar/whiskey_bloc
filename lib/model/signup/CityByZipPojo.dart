class CityByZipPojo {
  bool? status;
  String? message;
  int? code;
  Data? data;

  CityByZipPojo({this.status, this.message, this.code, this.data});

  CityByZipPojo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? areaName;
  int? areaCode;
  String? districtName;
  String? districtNo;
  String? deliveryZipcode;
  String? localeName;
  String? physicalDelvAddr;
  String? physicalCity;
  String? physicalState;
  String? physicalZip;
  String? physicalZip4;
  int? status;
  String? sId;
  String? id;

  Data(
      {this.areaName,
        this.areaCode,
        this.districtName,
        this.districtNo,
        this.deliveryZipcode,
        this.localeName,
        this.physicalDelvAddr,
        this.physicalCity,
        this.physicalState,
        this.physicalZip,
        this.physicalZip4,
        this.status,
        this.sId,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    areaName = json['area_name'];
    areaCode = json['area_code'];
    districtName = json['district_name'];
    districtNo = json['district_no'];
    deliveryZipcode = json['delivery_zipcode'];
    localeName = json['locale_name'];
    physicalDelvAddr = json['physical_delv_addr'];
    physicalCity = json['physical_city'];
    physicalState = json['physical_state'];
    physicalZip = json['physical_zip'];
    physicalZip4 = json['physical_zip_4'];
    status = json['status'];
    sId = json['_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area_name'] = this.areaName;
    data['area_code'] = this.areaCode;
    data['district_name'] = this.districtName;
    data['district_no'] = this.districtNo;
    data['delivery_zipcode'] = this.deliveryZipcode;
    data['locale_name'] = this.localeName;
    data['physical_delv_addr'] = this.physicalDelvAddr;
    data['physical_city'] = this.physicalCity;
    data['physical_state'] = this.physicalState;
    data['physical_zip'] = this.physicalZip;
    data['physical_zip_4'] = this.physicalZip4;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['id'] = this.id;
    return data;
  }
}
