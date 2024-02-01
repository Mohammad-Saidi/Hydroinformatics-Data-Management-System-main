/// status : "success"
/// hr6 : "1"
/// hr9 : "2"
/// hr12 : "2"
/// hr15 : "3"
/// hr18 : "3"
/// rainfall : "12"

class GetFfwcDataModel {
  GetFfwcDataModel({
      String? status, 
      String? hr6, 
      String? hr9, 
      String? hr12, 
      String? hr15, 
      String? hr18, 
      String? rainfall,}){
    _status = status;
    _hr6 = hr6;
    _hr9 = hr9;
    _hr12 = hr12;
    _hr15 = hr15;
    _hr18 = hr18;
    _rainfall = rainfall;
}

  GetFfwcDataModel.fromJson(dynamic json) {
    _status = json['status'];
    _hr6 = json['hr6'];
    _hr9 = json['hr9'];
    _hr12 = json['hr12'];
    _hr15 = json['hr15'];
    _hr18 = json['hr18'];
    _rainfall = json['rainfall'];
  }
  String? _status;
  String? _hr6;
  String? _hr9;
  String? _hr12;
  String? _hr15;
  String? _hr18;
  String? _rainfall;
GetFfwcDataModel copyWith({  String? status,
  String? hr6,
  String? hr9,
  String? hr12,
  String? hr15,
  String? hr18,
  String? rainfall,
}) => GetFfwcDataModel(  status: status ?? _status,
  hr6: hr6 ?? _hr6,
  hr9: hr9 ?? _hr9,
  hr12: hr12 ?? _hr12,
  hr15: hr15 ?? _hr15,
  hr18: hr18 ?? _hr18,
  rainfall: rainfall ?? _rainfall,
);
  String? get status => _status;
  String? get hr6 => _hr6;
  String? get hr9 => _hr9;
  String? get hr12 => _hr12;
  String? get hr15 => _hr15;
  String? get hr18 => _hr18;
  String? get rainfall => _rainfall;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['hr6'] = _hr6;
    map['hr9'] = _hr9;
    map['hr12'] = _hr12;
    map['hr15'] = _hr15;
    map['hr18'] = _hr18;
    map['rainfall'] = _rainfall;
    return map;
  }

}