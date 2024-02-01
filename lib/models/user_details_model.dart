/// status : "success"
/// message : "Data"
/// user_details : {"user_id":"202305","name":"Test User 4","email":"test4@gmail.com","mobile_no":"01773768014","user_type_name":"Foreign","residence_address":"test4","create_datetime":"14-NOV-2023 12:29:56 PM","office_phone":null,"national_id":"5465456","student_id":null,"user_name":"test4"}

class UserDetailsModel {
  UserDetailsModel({
      String? status, 
      String? message, 
      UserDetails? userDetails,}){
    _status = status;
    _message = message;
    _userDetails = userDetails;
}

  UserDetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _userDetails = json['user_details'] != null ? UserDetails.fromJson(json['user_details']) : null;
  }
  String? _status;
  String? _message;
  UserDetails? _userDetails;
UserDetailsModel copyWith({  String? status,
  String? message,
  UserDetails? userDetails,
}) => UserDetailsModel(  status: status ?? _status,
  message: message ?? _message,
  userDetails: userDetails ?? _userDetails,
);
  String? get status => _status;
  String? get message => _message;
  UserDetails? get userDetails => _userDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_userDetails != null) {
      map['user_details'] = _userDetails?.toJson();
    }
    return map;
  }

}

/// user_id : "202305"
/// name : "Test User 4"
/// email : "test4@gmail.com"
/// mobile_no : "01773768014"
/// user_type_name : "Foreign"
/// residence_address : "test4"
/// create_datetime : "14-NOV-2023 12:29:56 PM"
/// office_phone : null
/// national_id : "5465456"
/// student_id : null
/// user_name : "test4"

class UserDetails {
  UserDetails({
      String? userId, 
      String? name, 
      String? email, 
      String? mobileNo, 
      String? userTypeName, 
      String? residenceAddress, 
      String? createDatetime, 
      dynamic officePhone, 
      String? nationalId, 
      dynamic studentId, 
      String? userName,}){
    _userId = userId;
    _name = name;
    _email = email;
    _mobileNo = mobileNo;
    _userTypeName = userTypeName;
    _residenceAddress = residenceAddress;
    _createDatetime = createDatetime;
    _officePhone = officePhone;
    _nationalId = nationalId;
    _studentId = studentId;
    _userName = userName;
}

  UserDetails.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _mobileNo = json['mobile_no'];
    _userTypeName = json['user_type_name'];
    _residenceAddress = json['residence_address'];
    _createDatetime = json['create_datetime'];
    _officePhone = json['office_phone'];
    _nationalId = json['national_id'];
    _studentId = json['student_id'];
    _userName = json['user_name'];
  }
  String? _userId;
  String? _name;
  String? _email;
  String? _mobileNo;
  String? _userTypeName;
  String? _residenceAddress;
  String? _createDatetime;
  dynamic _officePhone;
  String? _nationalId;
  dynamic _studentId;
  String? _userName;
UserDetails copyWith({  String? userId,
  String? name,
  String? email,
  String? mobileNo,
  String? userTypeName,
  String? residenceAddress,
  String? createDatetime,
  dynamic officePhone,
  String? nationalId,
  dynamic studentId,
  String? userName,
}) => UserDetails(  userId: userId ?? _userId,
  name: name ?? _name,
  email: email ?? _email,
  mobileNo: mobileNo ?? _mobileNo,
  userTypeName: userTypeName ?? _userTypeName,
  residenceAddress: residenceAddress ?? _residenceAddress,
  createDatetime: createDatetime ?? _createDatetime,
  officePhone: officePhone ?? _officePhone,
  nationalId: nationalId ?? _nationalId,
  studentId: studentId ?? _studentId,
  userName: userName ?? _userName,
);
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get mobileNo => _mobileNo;
  String? get userTypeName => _userTypeName;
  String? get residenceAddress => _residenceAddress;
  String? get createDatetime => _createDatetime;
  dynamic get officePhone => _officePhone;
  String? get nationalId => _nationalId;
  dynamic get studentId => _studentId;
  String? get userName => _userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile_no'] = _mobileNo;
    map['user_type_name'] = _userTypeName;
    map['residence_address'] = _residenceAddress;
    map['create_datetime'] = _createDatetime;
    map['office_phone'] = _officePhone;
    map['national_id'] = _nationalId;
    map['student_id'] = _studentId;
    map['user_name'] = _userName;
    return map;
  }

}