import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class search extends SearchDelegate {
  //get http => null;

  getData(String q) async {
    String paseUrl =
        'http://api.weatherapi.com/v1/current.json?'; //جبت كود الي يرسل بيانات الطقس خليته داخل الكلاس ومن اضغط على كلمة سيرج واكتب كلمة عراق راح يجيب البيانات
    String apikey = 'f5c73daaa59e421f9fc180648223108';
    String lang = ' ar';

    final response =
        await http.get(Uri.parse('${paseUrl}key=${apikey}&q=${q}&lang=$lang '));
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  List<String> contryes = ['Iraq', 'Egypt', 'london', 'china'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = ''; //تمسح الكتابه الي بمكان البحث
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchContryes = //دالة البحث عن اي كلمة في البيانات
        contryes.where((element) => element.contains(query)).toList();
    return ListView.separated(
      itemBuilder: ((context, index) => ListTile(
            //عرضت البيانات على شكل قائمة ومن اضغط على كلمة تنطبع
            title: query == ''
                ? Text(contryes[index])
                : Text(searchContryes[index]),
            onTap: () {
              getData(contryes[index]);
            },
          )),
      separatorBuilder: (context, index) => Divider(
        thickness: 1,
      ),
      itemCount: query == '' ? contryes.length : searchContryes.length,
    );
  }
}
