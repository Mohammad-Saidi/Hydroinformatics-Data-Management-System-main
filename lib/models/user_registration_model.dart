/// status : "success"
/// message : [{"user_id":"202305","name":"Test User 4","email":"test4@gmail.com","mobile_no":"01773768014","user_type_name":"Foreign","create_datetime":"14-NOV-2023 12:29:56 PM"},{"user_id":"202304","name":"Test User 3","email":"test3@gmail.com","mobile_no":"01773768013","user_type_name":"Corporate","create_datetime":"13-NOV-2023 12:27:00 PM"},{"user_id":"202303","name":"Test User 2","email":"test2@gmail.com","mobile_no":"01700110012","user_type_name":"Individuals","create_datetime":"11-NOV-2023 04:00:00 PM"},{"user_id":"202302","name":"Test User 1","email":"test1@gmail.com","mobile_no":"01700110011","user_type_name":"Others","create_datetime":"11-NOV-2023 12:21:26 PM"},{"user_id":"202301","name":"sad","email":"sad@gmail.com","mobile_no":"01773768012","user_type_name":"Student","create_datetime":"23-OCT-2023 11:57:46 AM"},{"user_id":"202306","name":"Test User 5","email":"test5@gmail.com","mobile_no":"01773768015","user_type_name":"Research","create_datetime":"22-SEP-1999 12:33:07 PM"}]

class UserRegistrationModel {
  UserRegistrationModel({
      String? status,
      List<Message>? message,}){
    _status = status;
    _message = message;
}

  UserRegistrationModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['message'] != null) {
      _message = [];
      json['message'].forEach((v) {
        _message?.add(Message.fromJson(v));
      });
    }
  }
  String? _status;
  List<Message>? _message;
UserRegistrationModel copyWith({  String? status,
  List<Message>? message,
}) => UserRegistrationModel(  status: status ?? _status,
  message: message ?? _message,
);
  String? get status => _status;
  List<Message>? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_message != null) {
      map['message'] = _message?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// user_id : "202305"
/// name : "Test User 4"
/// email : "test4@gmail.com"
/// mobile_no : "01773768014"
/// user_type_name : "Foreign"
/// create_datetime : "14-NOV-2023 12:29:56 PM"

class Message {
  Message({
      String? userId,
      String? name,
      String? email,
      String? mobileNo,
      String? userTypeName,
      String? createDatetime,}){
    _userId = userId;
    _name = name;
    _email = email;
    _mobileNo = mobileNo;
    _userTypeName = userTypeName;
    _createDatetime = createDatetime;
}

  Message.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _mobileNo = json['mobile_no'];
    _userTypeName = json['user_type_name'];
    _createDatetime = json['create_datetime'];
  }
  String? _userId;
  String? _name;
  String? _email;
  String? _mobileNo;
  String? _userTypeName;
  String? _createDatetime;
Message copyWith({  String? userId,
  String? name,
  String? email,
  String? mobileNo,
  String? userTypeName,
  String? createDatetime,
}) => Message(  userId: userId ?? _userId,
  name: name ?? _name,
  email: email ?? _email,
  mobileNo: mobileNo ?? _mobileNo,
  userTypeName: userTypeName ?? _userTypeName,
  createDatetime: createDatetime ?? _createDatetime,
);
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get mobileNo => _mobileNo;
  String? get userTypeName => _userTypeName;
  String? get createDatetime => _createDatetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile_no'] = _mobileNo;
    map['user_type_name'] = _userTypeName;
    map['create_datetime'] = _createDatetime;
    return map;
  }

}