/// status : "success"
/// value : ""

class GetHydroDataModel {
  GetHydroDataModel({
      String? status, 
      String? value,}){
    _status = status;
    _value = value;
}

  GetHydroDataModel.fromJson(dynamic json) {
    _status = json['status'];
    _value = json['value'];
  }
  String? _status;
  String? _value;
GetHydroDataModel copyWith({  String? status,
  String? value,
}) => GetHydroDataModel(  status: status ?? _status,
  value: value ?? _value,
);
  String? get status => _status;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['value'] = _value;
    return map;
  }

}