import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'search_del.dart';

class HomeWeather extends StatefulWidget {
  const HomeWeather({Key? key}) : super(key: key);

  @override
  State<HomeWeather> createState() => _HomeWeatherState();
}

class _HomeWeatherState extends State<HomeWeather> {
  getData(String q) async {
    String paseUrl = 'http://api.weatherapi.com/v1/current.json?';
    String apikey = 'f5c73daaa59e421f9fc180648223108';
    String lang = ' ar';

    final response =
        await http.get(Uri.parse('${paseUrl}key=${apikey}&q=${q}&lang=$lang '));
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  @override
  void initState() {
    getData('Iraq');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: search());
            },
            icon: Icon(Icons.search))
      ]),
      body: Container(),
    );
  }
}
