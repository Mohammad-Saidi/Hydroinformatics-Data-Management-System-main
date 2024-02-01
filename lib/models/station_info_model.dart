/// status : "success"
/// station_info : [{"station_name":"Bogra","keyword":"Bog"},{"station_name":"Bahadurabad","keyword":"Bah"},{"station_name":"Akhterpara","keyword":"AKT"},{"station_name":"Atrai","keyword":"ATR"},{"station_name":"Austogram","keyword":"AST"}]

class StationInfoModel {
  StationInfoModel({
      String? status, 
      List<StationInfo>? stationInfo,}){
    _status = status;
    _stationInfo = stationInfo;
}

  StationInfoModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['station_info'] != null) {
      _stationInfo = [];
      json['station_info'].forEach((v) {
        _stationInfo?.add(StationInfo.fromJson(v));
      });
    }
  }
  String? _status;
  List<StationInfo>? _stationInfo;
StationInfoModel copyWith({  String? status,
  List<StationInfo>? stationInfo,
}) => StationInfoModel(  status: status ?? _status,
  stationInfo: stationInfo ?? _stationInfo,
);
  String? get status => _status;
  List<StationInfo>? get stationInfo => _stationInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_stationInfo != null) {
      map['station_info'] = _stationInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// station_name : "Bogra"
/// keyword : "Bog"

class StationInfo {
  StationInfo({
      String? stationName, 
      String? keyword,}){
    _stationName = stationName;
    _keyword = keyword;
}

  StationInfo.fromJson(dynamic json) {
    _stationName = json['station_name'];
    _keyword = json['keyword'];
  }
  String? _stationName;
  String? _keyword;
StationInfo copyWith({  String? stationName,
  String? keyword,
}) => StationInfo(  stationName: stationName ?? _stationName,
  keyword: keyword ?? _keyword,
);
  String? get stationName => _stationName;
  String? get keyword => _keyword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['station_name'] = _stationName;
    map['keyword'] = _keyword;
    return map;
  }

}