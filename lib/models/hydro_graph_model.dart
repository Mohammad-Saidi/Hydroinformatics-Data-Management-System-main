/// status : "success"
/// data : [{"log_date":"2023-11-18","water_lvl":"12"},{"log_date":"2023-11-19","water_lvl":"10"}]

class HydroGraphModel {
  HydroGraphModel({
    String? status,
    List<Data>? data,
  }) {
    _status = status;
    _data = data;
  }

  HydroGraphModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  String? _status;
  List<Data>? _data;

  HydroGraphModel copyWith({
    String? status,
    List<Data>? data,
  }) =>
      HydroGraphModel(
        status: status ?? _status,
        data: data ?? _data,
      );

  String? get status => _status;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// log_date : "2023-11-18"
/// water_lvl : "12"

class Data {
  Data({
    String? logDate,
    String? waterLvl,
  }) {
    _logDate = logDate;
    _waterLvl = waterLvl;
  }

  Data.fromJson(dynamic json) {
    _logDate = json['log_date'];
    _waterLvl = json['water_lvl'];
  }

  String? _logDate;
  String? _waterLvl;

  Data copyWith({
    String? logDate,
    String? waterLvl,
  }) =>
      Data(
        logDate: logDate ?? _logDate,
        waterLvl: waterLvl ?? _waterLvl,
      );

  String? get logDate => _logDate;

  String? get waterLvl => _waterLvl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['log_date'] = _logDate;
    map['water_lvl'] = _waterLvl;
    return map;
  }
}
