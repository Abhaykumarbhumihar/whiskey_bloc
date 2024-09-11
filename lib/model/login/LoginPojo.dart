class LoginPojo {
  int? code;
  String? message;
  Data? data;
  Tokens? tokens;

  LoginPojo({this.code, this.message, this.data, this.tokens});

  LoginPojo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    tokens =
    json['tokens'] != null ? new Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.tokens != null) {
      data['tokens'] = this.tokens!.toJson();
    }
    return data;
  }
}

class Data {
  CountryLocation? countryLocation;
  SocialLinks? socialLinks;
  NotificationPref? notificationPref;
  String? userName;
  String? countryCode;
  String? countryIsoCode;
  String? loginType;
  String? googleToken;
  String? facebookToken;
  String? appleToken;
  int? isBiometricEnabled;
  String? avatar;
  String? city;
  String? state;
  List<String>? tastePref;
  List<dynamic>? whiskeyType;
  List<String>? followIds;
  List<String>? sharingPref;
  int? profileCompleted;
  List<dynamic>? wishlist;
  String? country;
  int? followerCount;
  int? followingCount;
  int? status;
  String? sId;
  String? email;
  String? timezone;
  int? iV;
  String? firstName;
  String? lastName;
  String? yearOfBirth;
  String? zipcode;
  int? idealWhiskeyPrice;
  int? whiskeyStrength;

  Data(
      {this.countryLocation,
        this.socialLinks,
        this.notificationPref,
        this.userName,
        this.countryCode,
        this.countryIsoCode,
        this.loginType,
        this.googleToken,
        this.facebookToken,
        this.appleToken,
        this.isBiometricEnabled,
        this.avatar,
        this.city,
        this.state,
        this.tastePref,
        this.whiskeyType,
        this.followIds,
        this.sharingPref,
        this.profileCompleted,
        this.wishlist,
        this.country,
        this.followerCount,
        this.followingCount,
        this.status,
        this.sId,
        this.email,
        this.timezone,
        this.iV,
        this.firstName,
        this.lastName,
        this.yearOfBirth,
        this.zipcode,
        this.idealWhiskeyPrice,
        this.whiskeyStrength});

  Data.fromJson(Map<String, dynamic> json) {
    countryLocation = json['country_location'] != null
        ? new CountryLocation.fromJson(json['country_location'])
        : null;
    socialLinks = json['social_links'] != null
        ? new SocialLinks.fromJson(json['social_links'])
        : null;
    notificationPref = json['notification_pref'] != null
        ? new NotificationPref.fromJson(json['notification_pref'])
        : null;
    userName = json['user_name'];
    countryCode = json['country_code'];
    countryIsoCode = json['country_iso_code'];
    loginType = json['loginType'];
    googleToken = json['googleToken'];
    facebookToken = json['facebookToken'];
    appleToken = json['appleToken'];
    isBiometricEnabled = json['is_biometric_enabled'];
    avatar = json['avatar'];
    city = json['city'];
    state = json['state'];
    tastePref = json['taste_pref'].cast<String>();
    if (json['whiskey_type'] != null) {
    //  whiskeyType = <dynamic>[];
    //  json['whiskey_type'].forEach((v) {
    //    whiskeyType!.add(new Null.fromJson(v));
    //  });
    }
    followIds = json['follow_ids'].cast<String>();
    sharingPref = json['sharing_pref'].cast<String>();
    profileCompleted = json['profile_completed'];
    if (json['wishlist'] != null) {
    //  wishlist = <Null>[];
    //  json['wishlist'].forEach((v) {
    //    wishlist!.add(new Null.fromJson(v));
    //  });
    }
    country = json['country'];
    followerCount = json['followerCount'];
    followingCount = json['followingCount'];
    status = json['status'];
    sId = json['_id'];
    email = json['email'];
    timezone = json['timezone'];
    iV = json['__v'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    yearOfBirth = json['year_of_birth'];
    zipcode = json['zipcode'];
    idealWhiskeyPrice = json['ideal_whiskey_price'];
    whiskeyStrength = json['whiskey_strength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countryLocation != null) {
      data['country_location'] = this.countryLocation!.toJson();
    }
    if (this.socialLinks != null) {
      data['social_links'] = this.socialLinks!.toJson();
    }
    if (this.notificationPref != null) {
      data['notification_pref'] = this.notificationPref!.toJson();
    }
    data['user_name'] = this.userName;
    data['country_code'] = this.countryCode;
    data['country_iso_code'] = this.countryIsoCode;
    data['loginType'] = this.loginType;
    data['googleToken'] = this.googleToken;
    data['facebookToken'] = this.facebookToken;
    data['appleToken'] = this.appleToken;
    data['is_biometric_enabled'] = this.isBiometricEnabled;
    data['avatar'] = this.avatar;
    data['city'] = this.city;
    data['state'] = this.state;
    data['taste_pref'] = this.tastePref;
    if (this.whiskeyType != null) {
      data['whiskey_type'] = this.whiskeyType!.map((v) => v.toJson()).toList();
    }
    data['follow_ids'] = this.followIds;
    data['sharing_pref'] = this.sharingPref;
    data['profile_completed'] = this.profileCompleted;
    if (this.wishlist != null) {
      data['wishlist'] = this.wishlist!.map((v) => v.toJson()).toList();
    }
    data['country'] = this.country;
    data['followerCount'] = this.followerCount;
    data['followingCount'] = this.followingCount;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['timezone'] = this.timezone;
    data['__v'] = this.iV;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['year_of_birth'] = this.yearOfBirth;
    data['zipcode'] = this.zipcode;
    data['ideal_whiskey_price'] = this.idealWhiskeyPrice;
    data['whiskey_strength'] = this.whiskeyStrength;
    return data;
  }
}

class CountryLocation {
  String? type;
  List<int>? coordinates;

  CountryLocation({this.type, this.coordinates});

  CountryLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class SocialLinks {
  String? twitter;
  String? fb;
  String? insta;

  SocialLinks({this.twitter, this.fb, this.insta});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    twitter = json['twitter'];
    fb = json['fb'];
    insta = json['insta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['twitter'] = this.twitter;
    data['fb'] = this.fb;
    data['insta'] = this.insta;
    return data;
  }
}

class NotificationPref {
  int? rating;
  int? wishlist;
  int? bottle;
  int? message;
  int? notification;

  NotificationPref(
      {this.rating,
        this.wishlist,
        this.bottle,
        this.message,
        this.notification});

  NotificationPref.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    wishlist = json['wishlist'];
    bottle = json['bottle'];
    message = json['message'];
    notification = json['notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['wishlist'] = this.wishlist;
    data['bottle'] = this.bottle;
    data['message'] = this.message;
    data['notification'] = this.notification;
    return data;
  }
}

class Tokens {
  Access? access;
  Access? refresh;
  String? xCsrfToken;

  Tokens({this.access, this.refresh, this.xCsrfToken});

  Tokens.fromJson(Map<String, dynamic> json) {
    access =
    json['access'] != null ? new Access.fromJson(json['access']) : null;
    refresh =
    json['refresh'] != null ? new Access.fromJson(json['refresh']) : null;
    xCsrfToken = json['x-csrf-token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.access != null) {
      data['access'] = this.access!.toJson();
    }
    if (this.refresh != null) {
      data['refresh'] = this.refresh!.toJson();
    }
    data['x-csrf-token'] = this.xCsrfToken;
    return data;
  }
}

class Access {
  String? token;
  String? expires;

  Access({this.token, this.expires});

  Access.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expires'] = this.expires;
    return data;
  }
}
