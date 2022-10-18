import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sosomobile/models/PagerDutyModel.dart';

class PagerDutyApi {
  void getLists() async {
    String baseUrl = "https://sosomaintenance.herokuapp.com/apiGetList.php";
    try {
      var response = await Dio().get(baseUrl);
      List<PagerDutyModel> aa = pagerDutyModelFromJson(response.data);
      print(aa.toString());
    } catch (e) {
      print(e);
    }
  }
}
