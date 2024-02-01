/// status : "success"
/// message : "Login Successfully"
/// user_id : 322
/// name : "01767009920@ffwcsms"
/// authorization : {"token":"123|vjIRdYNTJAZiql7zuBB4SpYMQPNqLJhqJZIYaMqO05f4b977","type":"bearer"}
/// service_info : [{"type":"Water Level","icon":"http://192.168.91.160:8082/images/hidm/water_level.png","data":"WL"},{"type":"Rainfall","icon":"http://192.168.91.160:8082/images/hidm/rainfall.png","data":"RF"}]

class LoginModel {
  LoginModel({
      String? status, 
      String? message, 
      num? userId, 
      String? name, 
      Authorization? authorization, 
      List<ServiceInfo>? serviceInfo,}){
    _status = status;
    _message = message;
    _userId = userId;
    _name = name;
    _authorization = authorization;
    _serviceInfo = serviceInfo;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _userId = json['user_id'];
    _name = json['name'];
    _authorization = json['authorization'] != null ? Authorization.fromJson(json['authorization']) : null;
    if (json['service_info'] != null) {
      _serviceInfo = [];
      json['service_info'].forEach((v) {
        _serviceInfo?.add(ServiceInfo.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  num? _userId;
  String? _name;
  Authorization? _authorization;
  List<ServiceInfo>? _serviceInfo;
LoginModel copyWith({  String? status,
  String? message,
  num? userId,
  String? name,
  Authorization? authorization,
  List<ServiceInfo>? serviceInfo,
}) => LoginModel(  status: status ?? _status,
  message: message ?? _message,
  userId: userId ?? _userId,
  name: name ?? _name,
  authorization: authorization ?? _authorization,
  serviceInfo: serviceInfo ?? _serviceInfo,
);
  String? get status => _status;
  String? get message => _message;
  num? get userId => _userId;
  String? get name => _name;
  Authorization? get authorization => _authorization;
  List<ServiceInfo>? get serviceInfo => _serviceInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['user_id'] = _userId;
    map['name'] = _name;
    if (_authorization != null) {
      map['authorization'] = _authorization?.toJson();
    }
    if (_serviceInfo != null) {
      map['service_info'] = _serviceInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "Water Level"
/// icon : "http://192.168.91.160:8082/images/hidm/water_level.png"
/// data : "WL"

class ServiceInfo {
  ServiceInfo({
      String? type, 
      String? icon, 
      String? data,}){
    _type = type;
    _icon = icon;
    _data = data;
}

  ServiceInfo.fromJson(dynamic json) {
    _type = json['type'];
    _icon = json['icon'];
    _data = json['data'];
  }
  String? _type;
  String? _icon;
  String? _data;
ServiceInfo copyWith({  String? type,
  String? icon,
  String? data,
}) => ServiceInfo(  type: type ?? _type,
  icon: icon ?? _icon,
  data: data ?? _data,
);
  String? get type => _type;
  String? get icon => _icon;
  String? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['icon'] = _icon;
    map['data'] = _data;
    return map;
  }

}

/// token : "123|vjIRdYNTJAZiql7zuBB4SpYMQPNqLJhqJZIYaMqO05f4b977"
/// type : "bearer"

class Authorization {
  Authorization({
      String? token, 
      String? type,}){
    _token = token;
    _type = type;
}

  Authorization.fromJson(dynamic json) {
    _token = json['token'];
    _type = json['type'];
  }
  String? _token;
  String? _type;
Authorization copyWith({  String? token,
  String? type,
}) => Authorization(  token: token ?? _token,
  type: type ?? _type,
);
  String? get token => _token;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['type'] = _type;
    return map;
  }

}