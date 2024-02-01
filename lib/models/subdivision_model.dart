/// status : "success"
/// sub_division_list : [{"hydsubdivcode":"SWSDBA","subdivision_name":"Barisal"},{"hydsubdivcode":"SWSDBB","subdivision_name":"Brahmanbaria"},{"hydsubdivcode":"SWSDCT","subdivision_name":"Chattogram"},{"hydsubdivcode":"SWSDCO","subdivision_name":"Cumilla"},{"hydsubdivcode":"SWSDDA","subdivision_name":"Dhaka"},{"hydsubdivcode":"SWSDDP","subdivision_name":"Dinajpur"},{"hydsubdivcode":"SWSDFP","subdivision_name":"Faridpur"},{"hydsubdivcode":"SWSDJS","subdivision_name":"Jessore"},{"hydsubdivcode":"SWSDKH","subdivision_name":"Khulna"},{"hydsubdivcode":"SWSDMY","subdivision_name":"Mymensingh"},{"hydsubdivcode":"SWSDPB","subdivision_name":"Pabna"},{"hydsubdivcode":"SWSDRS","subdivision_name":"Rajshahi"},{"hydsubdivcode":"SWSDSY","subdivision_name":"Sylhet"},{"hydsubdivcode":"N/A","subdivision_name":null}]

class SubdivisionModel {
  SubdivisionModel({
      String? status, 
      List<SubDivisionList>? subDivisionList,}){
    _status = status;
    _subDivisionList = subDivisionList;
}

  SubdivisionModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['sub_division_list'] != null) {
      _subDivisionList = [];
      json['sub_division_list'].forEach((v) {
        _subDivisionList?.add(SubDivisionList.fromJson(v));
      });
    }
  }
  String? _status;
  List<SubDivisionList>? _subDivisionList;
SubdivisionModel copyWith({  String? status,
  List<SubDivisionList>? subDivisionList,
}) => SubdivisionModel(  status: status ?? _status,
  subDivisionList: subDivisionList ?? _subDivisionList,
);
  String? get status => _status;
  List<SubDivisionList>? get subDivisionList => _subDivisionList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_subDivisionList != null) {
      map['sub_division_list'] = _subDivisionList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// hydsubdivcode : "SWSDBA"
/// subdivision_name : "Barisal"

class SubDivisionList {
  SubDivisionList({
      String? hydsubdivcode, 
      String? subdivisionName,}){
    _hydsubdivcode = hydsubdivcode;
    _subdivisionName = subdivisionName;
}

  SubDivisionList.fromJson(dynamic json) {
    _hydsubdivcode = json['hydsubdivcode'];
    _subdivisionName = json['subdivision_name'];
  }
  String? _hydsubdivcode;
  String? _subdivisionName;
SubDivisionList copyWith({  String? hydsubdivcode,
  String? subdivisionName,
}) => SubDivisionList(  hydsubdivcode: hydsubdivcode ?? _hydsubdivcode,
  subdivisionName: subdivisionName ?? _subdivisionName,
);
  String? get hydsubdivcode => _hydsubdivcode;
  String? get subdivisionName => _subdivisionName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hydsubdivcode'] = _hydsubdivcode;
    map['subdivision_name'] = _subdivisionName;
    return map;
  }

}