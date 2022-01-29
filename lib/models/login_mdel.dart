class UserModel{
bool? success;
int? statusCode;
List? message;
UserData? data;
Object? meta;
UserModel();

UserModel.fromJson(Map json){
  success=json['success'];
  statusCode=json['statusCode'];
  message=json['message'];
  data=UserData.fromJson(json['data']);
  meta=json['meta'];
}
}

class UserData{
  int? id ;
  String ?name;
  String? email;
  String? photoUrl;
  String? featuredProductName;
  int? featuredProductId;
  String? lang;
  String? provider;
  String? type;
  String? role;
  bool? notificationsEnabled;
  int? followersCount;
  int? productsCount;
  int? storiesCount;
  bool? isVerified ;
  String? createdAt;
  String? updatedAt;
  String? token;
  String? refreshToken;

UserData.fromJson(Map json){
  id=json['id'];
  name=json['name'];
  email=json['email'];
  photoUrl=json['photoUrl'];
  featuredProductName=json['featuredProductName'];
  featuredProductId=json['featuredProductId'];
  lang=json['lang'];
  provider=json['provider'];
  type=json['type'];
  role=json['role'];
  notificationsEnabled=json['notificationsEnabled'];
  followersCount=json['followersCount'];
  productsCount=json['productsCount'];
  storiesCount=json['storiesCount'];
  isVerified=json['isVerified'];
  createdAt=json['createdAt'];
  updatedAt=json['updatedAt'];
  token=json['token'];
  refreshToken=json['refreshToken'];
}




  }


