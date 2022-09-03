import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'modal/data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CryptoCurrency> cryptoList = [];
  String apiUrl =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false";
  Future<List<CryptoCurrency>> getData() async {
    var response = await http.get(Uri.parse(apiUrl));
    var jsonDecode = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in jsonDecode) {
        cryptoList.add(CryptoCurrency.fromJSON(i));
      }
      return cryptoList;
    } else {
      return cryptoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CryptoToday"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
                itemCount: cryptoList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        width: 200,
                          height: 100,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Center(
                            child: ListTile(
                              leading: Image.network(cryptoList[index].image ?? ""),
                        title: Text(
                            cryptoList[index].name ?? "",
                            style: const TextStyle(
                              fontSize: 25,
                              color:Colors.black
                            ),
                        ),
                              subtitle: Row(
                                children: [
                                  const Text("Price-",style:  TextStyle(
                                  fontSize: 20,
                                  color:Colors.black
                              ),),
                                  Text(
                                    cryptoList[index].currentPrice.toString() ?? "",
                                      style: const TextStyle(
                                      fontSize: 20,
                                      color:Colors.red
                                  ),
                                  ),
                                ],
                              ),
                      ),
                          )),
                    ),
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  Widget _buildBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
      int index,
      ) {
    return Material(
      child: Container(
        child: Text(
          cryptoList[index].symbol.toString()
        )
      ),
    );
  }
}
