import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
// import 'package:register_screen/models/login.dart';

class LoginController extends GetxController {
  List<dynamic> loginList = [].obs;

  void fetchLogin(username, password, context) async {
    String url =
        'https://www.texasknife.com/dynamic/texasknifeapi.php?action=static_login&email=$username&password=$password';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final body = res.body;
      final json = jsonDecode(body);
      // List<dynamic> data = json.decode(res.body)['data']; // Explicitly defining data type
      // loginList.value = data.map((item) => Login.fromJson(item)).toList();
      // print(data);

      loginList = json['data'];
      print(loginList);
    }
// Parse the JSON string
    // Map<String, dynamic> jsonObject = json.decode(loginList[0]);
    //     print("object  :");
    // print(jsonObject['user_name']);

    // for (var obj in loginList) {
    //   String userName = obj['user_name'];
    //   print('userName: $userName');
    // }
  }
}
