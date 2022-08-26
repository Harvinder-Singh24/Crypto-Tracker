import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _apiUrl =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false";
  Future getData() async {
    http.Response response = await http.get(Uri.parse(_apiUrl));
    if (response.statusCode == 200) {
      var jsonDecode = json.decode(response.body);
      print(jsonDecode[0]['name']);
    } else {
      throw Exception("Url Not Fetched");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Unable to load data"));
          } else if (snapshot.hasData) {
            return const Center(child: Text("Data Received"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
