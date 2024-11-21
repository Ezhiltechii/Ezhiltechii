class LoginApi {
  String? status;
  ResData? resData;

  LoginApi({this.status, this.resData});

  LoginApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resData = json['res_data'] != null
        ? new ResData.fromJson(json['res_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.resData != null) {
      data['res_data'] = this.resData!.toJson();
    }
    return data;
  }
}

class ResData {
  String? mobile;
  int? otp;

  ResData({this.mobile, this.otp});

  ResData.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['otp'] = this.otp;
    return data;
  }
}