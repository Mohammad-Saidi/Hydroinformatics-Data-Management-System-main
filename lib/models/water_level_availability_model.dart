/// status : "success"
/// surface_water_list : [{"name":"Water Level","icon":"http://103.141.9.234/himsmobappapi/images/swl/water level.png","serial_no":"1"},{"name":"Rainfall","icon":"http://103.141.9.234/himsmobappapi/images/swl/rainfall.png","serial_no":"2"},{"name":"Evaporation","icon":"http://103.141.9.234/himsmobappapi/images/swl/evaporation.png","serial_no":"3"},{"name":"Observed Discharged","icon":"http://103.141.9.234/himsmobappapi/images/swl/observe discharged.png","serial_no":"4"},{"name":"Observed Sediment","icon":"http://103.141.9.234/himsmobappapi/images/swl/observed sediment.png","serial_no":"5"},{"name":"Salinity","icon":"http://103.141.9.234/himsmobappapi/images/swl/salinity.png","serial_no":"6"},{"name":"Tidal Discharge","icon":"http://103.141.9.234/himsmobappapi/images/swl/tidal discharge.png","serial_no":"7"},{"name":"Surface Water Quality","icon":"http://103.141.9.234/himsmobappapi/images/swl/surface water quality.png","serial_no":"8"},{"name":"Climatology","icon":"http://103.141.9.234/himsmobappapi/images/swl/climatology.png","serial_no":"9"},{"name":"Sunshine Data","icon":"http://103.141.9.234/himsmobappapi/images/swl/sunshine data.png","serial_no":"10"},{"name":"MDD","icon":"http://103.141.9.234/himsmobappapi/images/swl/mdd.png","serial_no":"11"}]

class WaterLevelAvailabilityModel {
  WaterLevelAvailabilityModel({
      String? status, 
      List<SurfaceWaterList>? surfaceWaterList,}){
    _status = status;
    _surfaceWaterList = surfaceWaterList;
}

  WaterLevelAvailabilityModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['surface_water_list'] != null) {
      _surfaceWaterList = [];
      json['surface_water_list'].forEach((v) {
        _surfaceWaterList?.add(SurfaceWaterList.fromJson(v));
      });
    }
  }
  String? _status;
  List<SurfaceWaterList>? _surfaceWaterList;
WaterLevelAvailabilityModel copyWith({  String? status,
  List<SurfaceWaterList>? surfaceWaterList,
}) => WaterLevelAvailabilityModel(  status: status ?? _status,
  surfaceWaterList: surfaceWaterList ?? _surfaceWaterList,
);
  String? get status => _status;
  List<SurfaceWaterList>? get surfaceWaterList => _surfaceWaterList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_surfaceWaterList != null) {
      map['surface_water_list'] = _surfaceWaterList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Water Level"
/// icon : "http://103.141.9.234/himsmobappapi/images/swl/water level.png"
/// serial_no : "1"

class SurfaceWaterList {
  SurfaceWaterList({
      String? name, 
      String? icon, 
      String? serialNo,}){
    _name = name;
    _icon = icon;
    _serialNo = serialNo;
}

  SurfaceWaterList.fromJson(dynamic json) {
    _name = json['name'];
    _icon = json['icon'];
    _serialNo = json['serial_no'];
  }
  String? _name;
  String? _icon;
  String? _serialNo;
SurfaceWaterList copyWith({  String? name,
  String? icon,
  String? serialNo,
}) => SurfaceWaterList(  name: name ?? _name,
  icon: icon ?? _icon,
  serialNo: serialNo ?? _serialNo,
);
  String? get name => _name;
  String? get icon => _icon;
  String? get serialNo => _serialNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['icon'] = _icon;
    map['serial_no'] = _serialNo;
    return map;
  }

}