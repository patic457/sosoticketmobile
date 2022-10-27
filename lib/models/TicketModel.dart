import 'dart:convert';

List<TicketModel> ticketModelFromJson(String str) => List<TicketModel>.from(
    json.decode(str).map((x) => TicketModel.fromJson(x)));

String ticketModelToJson(List<TicketModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

TicketModel ticketDetailModelFromJson(String str) =>
    TicketModel.fromJson(json.decode(str));

String ticketDetailModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  String id;
  String status;
  String description;
  String problemName;
  String criticalityName;

  TicketModel({
    required this.id,
    required this.status,
    required this.description,
    required this.problemName,
    required this.criticalityName,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        id: json["id"],
        description: json["description"],
        problemName: json["problemName"],
        status: json["status"],
        criticalityName: json["criticalityName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "status": status == null ? null : status,
        "description": description == null ? null : description,
        "problemName": problemName == null ? null : problemName,
        "criticalityName": criticalityName == null ? null : criticalityName,
      };
}
