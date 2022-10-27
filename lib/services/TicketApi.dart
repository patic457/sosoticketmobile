import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sosomobile/models/TicketModel.dart';
import 'package:http/http.dart' as http;

class TicketApi {
  _setHeaders() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  // getLists() async {
  //   String baseUrl = "https://sosoapi.herokuapp.com/api/ticket";
  //   try {
  //     var response = await Dio().get(baseUrl);
  //     var json = response.data;
  //     if (response.statusCode == 200) {
  //       var ticket = TicketModel.fromJson(response.data);
  //       print(ticket.status);
  //     } else {
  //       throw Exception("Ticket StatusCode Not 200");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<List<TicketModel?>> getAllTicket() async {
  //   String baseUrl = "https://sosoapi.herokuapp.com/api/ticket";
  //   List<TicketModel> ticketList = [];
  //   try {
  //     var response = await Dio().get(
  //       baseUrl,
  //       options: Options(headers: _setHeaders()),
  //     );
  //     if (response.statusCode == 200) {
  //       var jsonData = response.data;
  //       ticketList = ticketModelFromJson(jsonData);
  //       // print("ticketList : " + ticketList.toString());
  //     } else {
  //       throw Exception("Ticket StatusCode Not 200");
  //     }
  //   } catch (e) {
  //     // print("Error : " + e.toString());
  //   }
  //   return ticketList;
  // }

  Future<List<TicketModel>?> getAllTicket() async {
    String baseUrl = "https://sosoapi.herokuapp.com/api/ticket";
    //retrun List ? List สามารถเป็น null ได้
    final res = await http.get(
      Uri.parse(baseUrl),
      headers: _setHeaders(),
    );
    if (res.body != null) {
      return ticketModelFromJson(res.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<TicketModel> getTicket(id) async {
    var baseUrl = "https://sosoapi.herokuapp.com/api/ticket/" + id.toString();
    //retrun List ? List สามารถเป็น null ได้
    final res = await http.get(
      Uri.parse(baseUrl),
      headers: _setHeaders(),
    );
    if (res.body != null) {
      // print(res.body);
      return ticketDetailModelFromJson(res.body);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
