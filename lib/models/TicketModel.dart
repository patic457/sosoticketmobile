import 'dart:convert';

List<TicketModel> ticketModelFromJson(String str) => List<TicketModel>.from(
    json.decode(str).map((x) => TicketModel.fromJson(x)));

String ticketModelToJson(List<TicketModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketModel {
  final String id;
  final String status;
  final String description;
  final String problemName;

  const TicketModel({
    required this.id,
    required this.status,
    required this.description,
    required this.problemName,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null ? null : json["description"],
        problemName: json["problemName"] == null ? null : json["problemName"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "status": status == null ? null : status,
        "description": description == null ? null : description,
        "problemName": problemName == null ? null : problemName,
      };

  // TicketModel.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       status = json['status'],
  //       description = json['description'],
  //       problemName = json['problemName'];

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'status': status,
  //       'description': description,
  //       'problemName': problemName,
  //     };

}
