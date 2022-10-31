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
  String criticalityName;
  String problemCategoryName;
  String problemName;
  String description;
  String teamId;
  String dueDate;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;

  TicketModel({
    required this.id,
    required this.status,
    required this.criticalityName,
    required this.problemCategoryName,
    required this.problemName,
    required this.description,
    required this.teamId,
    required this.dueDate,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        id: json["id"],
        description: json["description"],
        problemName: json["problemName"],
        status: json["status"],
        criticalityName: json["criticalityName"],
        problemCategoryName: json["problemCategoryName"],
        teamId: json["teamId"],
        dueDate: json["dueDate"],
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        updatedAt: json["updatedAt"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "status": status == null ? null : status,
        "description": description == null ? null : description,
        "problemName": problemName == null ? null : problemName,
        "criticalityName": criticalityName == null ? null : criticalityName,
        "problemCategoryName":
            problemCategoryName == null ? null : problemCategoryName,
        "teamId": teamId == null ? null : teamId,
        "dueDate": dueDate == null ? null : dueDate,
        "createdAt": createdAt == null ? null : createdAt,
        "createdBy": createdBy == null ? null : createdBy,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "updatedBy": updatedBy == null ? null : updatedBy,
      };
}
