/// status : "success"
/// RF Data : [{"log_date":"19-11-2023","rainfall":"12"},{"log_date":"18-11-2023","rainfall":"5"}]

class RainfallGraphModel {
  RainfallGraphModel({
      String? status, 
      List<RfData>? rFData,}){
    _status = status;
    _rFData = rFData;
}

  RainfallGraphModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['RF Data'] != null) {
      _rFData = [];
      json['RF Data'].forEach((v) {
        _rFData?.add(RfData.fromJson(v));
      });
    }
  }
  String? _status;
  List<RfData>? _rFData;
RainfallGraphModel copyWith({  String? status,
  List<RfData>? rFData,
}) => RainfallGraphModel(  status: status ?? _status,
  rFData: rFData ?? _rFData,
);
  String? get status => _status;
  List<RfData>? get rFData => _rFData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_rFData != null) {
      map['RF Data'] = _rFData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// log_date : "19-11-2023"
/// rainfall : "12"

class RfData {
  RfData({
      String? logDate, 
      String? rainfall,}){
    _logDate = logDate;
    _rainfall = rainfall;
}

  RfData.fromJson(dynamic json) {
    _logDate = json['log_date'];
    _rainfall = json['rainfall'];
  }
  String? _logDate;
  String? _rainfall;
RfData copyWith({  String? logDate,
  String? rainfall,
}) => RfData(  logDate: logDate ?? _logDate,
  rainfall: rainfall ?? _rainfall,
);
  String? get logDate => _logDate;
  String? get rainfall => _rainfall;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['log_date'] = _logDate;
    map['rainfall'] = _rainfall;
    return map;
  }

}