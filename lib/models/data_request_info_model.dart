/// status : "success"
/// data_request_info : [{"req_mas_id":"3045","user_name":"shawana","mobile_no":"01767009920","email":"smobashsera@gmail.com","category":"Individuals","request_date":"07-DEC-23"}]

class DataRequestInfoModel {
  DataRequestInfoModel({
      String? status, 
      List<DataRequestInfo>? dataRequestInfo,}){
    _status = status;
    _dataRequestInfo = dataRequestInfo;
}

  DataRequestInfoModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data_request_info'] != null) {
      _dataRequestInfo = [];
      json['data_request_info'].forEach((v) {
        _dataRequestInfo?.add(DataRequestInfo.fromJson(v));
      });
    }
  }
  String? _status;
  List<DataRequestInfo>? _dataRequestInfo;
DataRequestInfoModel copyWith({  String? status,
  List<DataRequestInfo>? dataRequestInfo,
}) => DataRequestInfoModel(  status: status ?? _status,
  dataRequestInfo: dataRequestInfo ?? _dataRequestInfo,
);
  String? get status => _status;
  List<DataRequestInfo>? get dataRequestInfo => _dataRequestInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_dataRequestInfo != null) {
      map['data_request_info'] = _dataRequestInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// req_mas_id : "3045"
/// user_name : "shawana"
/// mobile_no : "01767009920"
/// email : "smobashsera@gmail.com"
/// category : "Individuals"
/// request_date : "07-DEC-23"

class DataRequestInfo {
  DataRequestInfo({
      String? reqMasId, 
      String? userName, 
      String? mobileNo, 
      String? email, 
      String? category, 
      String? requestDate,}){
    _reqMasId = reqMasId;
    _userName = userName;
    _mobileNo = mobileNo;
    _email = email;
    _category = category;
    _requestDate = requestDate;
}

  DataRequestInfo.fromJson(dynamic json) {
    _reqMasId = json['req_mas_id'];
    _userName = json['user_name'];
    _mobileNo = json['mobile_no'];
    _email = json['email'];
    _category = json['category'];
    _requestDate = json['request_date'];
  }
  String? _reqMasId;
  String? _userName;
  String? _mobileNo;
  String? _email;
  String? _category;
  String? _requestDate;
DataRequestInfo copyWith({  String? reqMasId,
  String? userName,
  String? mobileNo,
  String? email,
  String? category,
  String? requestDate,
}) => DataRequestInfo(  reqMasId: reqMasId ?? _reqMasId,
  userName: userName ?? _userName,
  mobileNo: mobileNo ?? _mobileNo,
  email: email ?? _email,
  category: category ?? _category,
  requestDate: requestDate ?? _requestDate,
);
  String? get reqMasId => _reqMasId;
  String? get userName => _userName;
  String? get mobileNo => _mobileNo;
  String? get email => _email;
  String? get category => _category;
  String? get requestDate => _requestDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['req_mas_id'] = _reqMasId;
    map['user_name'] = _userName;
    map['mobile_no'] = _mobileNo;
    map['email'] = _email;
    map['category'] = _category;
    map['request_date'] = _requestDate;
    return map;
  }

}