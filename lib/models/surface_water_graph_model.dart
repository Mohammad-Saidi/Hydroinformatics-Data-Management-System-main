/// status : "success"
/// WL Data : [{"log_date":"23-11-2023","hr6":"11.203","hr9":"","hr12":"","hr15":"","hr18":""},{"log_date":"21-11-2023","hr6":"52.07","hr9":"25.85","hr12":"85.55","hr15":"","hr18":""},{"log_date":"22-11-2023","hr6":"78.58","hr9":"96.99","hr12":"","hr15":"","hr18":""}]

class SurfaceWaterGraphModel {
  SurfaceWaterGraphModel({
      String? status, 
      List<WlData>? wLData,}){
    _status = status;
    _wLData = wLData;
}

  SurfaceWaterGraphModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['WL Data'] != null) {
      _wLData = [];
      json['WL Data'].forEach((v) {
        _wLData?.add(WlData.fromJson(v));
      });
    }
  }
  String? _status;
  List<WlData>? _wLData;
SurfaceWaterGraphModel copyWith({  String? status,
  List<WlData>? wLData,
}) => SurfaceWaterGraphModel(  status: status ?? _status,
  wLData: wLData ?? _wLData,
);
  String? get status => _status;
  List<WlData>? get wLData => _wLData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_wLData != null) {
      map['WL Data'] = _wLData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// log_date : "23-11-2023"
/// hr6 : "11.203"
/// hr9 : ""
/// hr12 : ""
/// hr15 : ""
/// hr18 : ""

class WlData {
  WlData({
      String? logDate, 
      String? hr6, 
      String? hr9, 
      String? hr12, 
      String? hr15, 
      String? hr18,}){
    _logDate = logDate;
    _hr6 = hr6;
    _hr9 = hr9;
    _hr12 = hr12;
    _hr15 = hr15;
    _hr18 = hr18;
}

  WlData.fromJson(dynamic json) {
    _logDate = json['log_date'];
    _hr6 = json['hr6'];
    _hr9 = json['hr9'];
    _hr12 = json['hr12'];
    _hr15 = json['hr15'];
    _hr18 = json['hr18'];
  }
  String? _logDate;
  String? _hr6;
  String? _hr9;
  String? _hr12;
  String? _hr15;
  String? _hr18;
WlData copyWith({  String? logDate,
  String? hr6,
  String? hr9,
  String? hr12,
  String? hr15,
  String? hr18,
}) => WlData(  logDate: logDate ?? _logDate,
  hr6: hr6 ?? _hr6,
  hr9: hr9 ?? _hr9,
  hr12: hr12 ?? _hr12,
  hr15: hr15 ?? _hr15,
  hr18: hr18 ?? _hr18,
);
  String? get logDate => _logDate;
  String? get hr6 => _hr6;
  String? get hr9 => _hr9;
  String? get hr12 => _hr12;
  String? get hr15 => _hr15;
  String? get hr18 => _hr18;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['log_date'] = _logDate;
    map['hr6'] = _hr6;
    map['hr9'] = _hr9;
    map['hr12'] = _hr12;
    map['hr15'] = _hr15;
    map['hr18'] = _hr18;
    return map;
  }

}