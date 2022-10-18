// To parse this JSON data, do
//
//     final pagerDutyModel = pagerDutyModelFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

List<PagerDutyModel> pagerDutyModelFromJson(String str) =>
    List<PagerDutyModel>.from(
        json.decode(str).map((x) => PagerDutyModel.fromJson(x)));

String pagerDutyModelToJson(List<PagerDutyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class PagerDutyModel {
  PagerDutyModel({
    required this.incidentEvent,
    required this.incidentNumber,
    required this.incidentStatus,
    required this.notificationStatus,
  });

  String incidentEvent;
  int incidentNumber;
  String incidentStatus;
  int notificationStatus;

  factory PagerDutyModel.fromJson(Map<String, dynamic> json) => PagerDutyModel(
        incidentEvent: json["incident_event"],
        incidentNumber: json["incident_number"],
        incidentStatus: json["incident_status"],
        notificationStatus: json["notification_status"],
      );

  Map<String, dynamic> toJson() => {
        "incident_event": incidentEvent,
        "incident_number": incidentNumber,
        "incident_status": incidentStatus,
        "notification_status": notificationStatus,
      };
}
