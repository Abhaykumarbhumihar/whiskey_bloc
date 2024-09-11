class SplashPojo {
  int? code;
  String? message;
  Data? data;

  SplashPojo({this.code, this.message, this.data});

  SplashPojo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? desc;
  String? media;
  String? mediaType;
  String? contentType;

  Data(
      {this.sId,
        this.title,
        this.desc,
        this.media,
        this.mediaType,
        this.contentType});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    desc = json['desc'];
    media = json['media'];
    mediaType = json['media_type'];
    contentType = json['content_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['media'] = this.media;
    data['media_type'] = this.mediaType;
    data['content_type'] = this.contentType;
    return data;
  }
}
