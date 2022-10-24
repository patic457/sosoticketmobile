import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sosomobile/models/TicketModel.dart';

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

  Future<List<TicketModel>?> getAllTicket() async {
    String baseUrl = "https://sosoapi.herokuapp.com/api/ticket";
    try {
      var response = await Dio().get(baseUrl,
          options: Options(
            headers: _setHeaders(),
          ));
      var jsonData = response.data;
      if (response.statusCode == 200) {
        return ticketModelFromJson(response.data);
      } else {
        throw Exception("Ticket StatusCode Not 200");
      }
    } catch (e) {
      print("Error : " + e.toString());
    }
  }
}
