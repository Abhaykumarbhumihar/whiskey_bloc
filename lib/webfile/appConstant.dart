class AppConstant {
  //local=http://192.168.0.111:3004/v1/
  //server=http://107.23.70.70:3000/v1/

  /*-------------------------------------for urls ---------------------------------*/

  static String BEARER = "Bearer ";
  static String INTERNETCCONNECTIONS = "Please check your internet connection";
  static String BASE_URL = "http://107.23.70.70:3000/v1/";
  static String IMAGE_BASE_URL = "https://d2bf3rz6mahu9p.cloudfront.net/";

  /*------------------------------------- for shared preference ---------------------------------*/

  /*------------------------------------- for api's ---------------------------------*/

  static String UPDATE_PROFILE = "";

  static String SOCIAL_LOGIN = "user/auth/social_login";
  static String GOOGLE = "google";
  static String FACEBOOK = "facebook";
  static String APPLE = "apple";

  static String CHECKEMAIL = "user/auth/check_email";
  static String VERIFYOTP = "user/auth/verify_otp";
  static String VERIFFORGOTYOTP = "user/auth/verify_forgot_otp";
  static String REGISTER = "user/auth/register";
  static String PRIVACYPOLICY = "user/appdata/policies";

  static String UPLOADPROFILEPIC = "user/upload_profile_pic";
  static String COMPLETEUSERPROFILE = "user/complete_profile";

  static String FORGOTPASSWORD = "user/auth/forgot_password";
  static String RESETPASSWORD = "user/auth/reset_password";
  static String LOGIN = "user/auth/login";
  static String USERPREFERENCE = "user/preference";
  static String DEACTIVATE = "user/deactivate_account";
  static String DELETEACCOUNT = "user/delete_account";
  static String REMOVEFOLLOWER = "user/remove_follower";
  static String REMOVEFOLLOWING = "user/remove_following";

  static String GETPROFILE = "user/my_profile";
  static String COUNTRYLIST = "user/get_country_list";
  static String STATELIST = "user/get_state_list";
  static String CITYLIST = "user/get_city_list";
  static String ZIPCODE = "user/get_city_by_zipcode";
  static String WHISKEYSTAT = "user/user_stat";
  static String REVIEW = "review/addReview";
  static String DYNAMICLIST = "user/dynamic_list";

  static String ADDBOTTLE = "bottle/createBottle";
  static String MYBOOTELLIST = "bottle/listBottles";
  static String REFRESHTOKEN = "user/auth/refresh_token";

  static String CREATECOLLECTION = "collection/createUpdateCollection";
  static String GETUSERCOLLECTION = "collection/userCollections";
  static String BOTTLEDETAIL = "bottle/getBottleDetail";
  static String UPDATEWISHLIST = "bottle/updateWishList";
  static String MoveBottleToCollection = "collection/moveBottleToCollection";
  static String WISHLIST = "bottle/listWishlist";
  static String ADDTOCOLLECTION = "collection/addCollection";
  static String SHELFDETAIL = "collection/getCollectionByShelf";
  static String DASHOBOARDDATA = "bottle/getDashboard";
  static String ADDTOPOINTINGSHELF = "collection/addCollection";
  static String POINTINGSHELF = "collection/listPointingShelfs";
  static String CHANGEPASSWORD = "user/change_password";
  static String TUTORIALS = "user/appdata/tutorials";
  static String CONTACTUS = "user/appdata/create_contact";
  static String DELTESHELF = "collection/deleteShelf";
  static String USERTRASTEPREF = "user/get_users_taste";
  static String FOLLWERFOLLWINGLIST = "user/get_follower_following";
  static String AWARDLIST = "award/listAwards";
  static String TOPTROVERS = "notification/listTopTrovers";
  static String DeleteBottleShelf = "bottle/deleteBottleShelf";

  static String ALLNOTIFICATION = "notification/listNotifications";
  static String MARKNOTIFICATIONREAD = "notification/markNotificationRead";
  static String MARKFAVUNFAVNOTIFICATION = "notification/favUnFavNotification";
  static String LISTFAVNOTIFICATION = "notification/listFavNotifications";
  static String CLEARALLNOTIFICATION = "notification/clearAllNotifications";

  static String OTHERUSERPROFILE = "user/other_user_profile";
  static String SEARCHUSER = "user/search_user";
  static String SEARCHFILTERBOTTLE = "bottle/filterBottles";

  static String FOLLOWUNFOLLOW = "user/add_update_following";
  static String ADDBOTTLETOSHELFWISHLISTPOINITN =
      "collection/addBottleToShelfWishlist";
  static String INTROSCREEN = "user/appdata/intro_screens";
  static String GETSHAREAWARD = "award/award_share";
}
