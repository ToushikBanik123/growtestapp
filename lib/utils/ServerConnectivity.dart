import 'dart:convert';
import 'package:http/http.dart' as http;

class ServerConnectivity {

  // static String url = "http://192.168.10.10/php/spa_api";
  static String url = "https://thetechnicalsolution.in/php_api/";
  // static String url = "https://relaxho.com/php_api/";
  static String encrypt = "${url}/encrypt.php";
  static String decrypt = "${url}/decrypt.php";
  static String insertURL = "${url}/insert.php";
  static String fetchURL = "${url}/fetch.php";
  static String updateURL = "${url}/update.php";
  static String fetchImageUrl = "${url}/fetch_image.php";
  static String insertImageUrl = "${url}/insert_image.php";
  // static String fetchServerUrl = "http://192.168.83.189/php/spa_api/fetch-api.php?key=${key}";

  static Future encryptData(String text) async {
    var uri = Uri.parse(encrypt);
    var response = await http.post(uri, body: {
      "text" : text
    });
    // var data = json.decode(response.body);
    return response.body;
  }

  static Future decryptData(String text) async {
    var uri = Uri.parse(decrypt);
    var response = await http.post(uri, body: {
      "text" : text
    });
    // var data = json.decode(response.body);
    return response.body;
  }

  static Future fetchImage(String sql) async {
    var uri = Uri.parse(fetchImageUrl);
    var response = await http.post(uri, body: {
      "sql" : sql
    });
    var data = json.decode(response.body);
  }

  static Future insertImage(String sql) async {
    var uri = Uri.parse(insertImageUrl);
    var response = await http.post(uri, body: {
      "sql" : sql,
    });
    var data = json.decode(response.body);
    print("Image status of upload: ");
    print(data);
    if (data=="success") {
      return "success";
    } else if (data=="failed") {
      return "failed";
    }
  }

  static Future fetch({
    required String sql,
    var fun
  }) async {
    var uri = Uri.parse(fetchURL);
    var response = await http.post(uri, body: {
      "sql" : sql
    });
    var data = json.decode(response.body);
    // print("data we fetched: ");
    // print(data);
    if (data=="failed") {
      return jsonDecode(response.body);
    } else {
      Map<String, dynamic> json = jsonDecode(response.body)[0];
      fun();
      return json;
      // print("json['sno']");
      // print(json['sno']);
    }
  }

  static Future fetchList({
    required String sql,
    var fun
  }) async {
    var uri = Uri.parse(fetchURL);
    var response = await http.post(uri, body: {
      "sql" : sql
    });
    var data = json.decode(response.body);
    if (data=="failed") {
      return jsonDecode(response.body);
    } else {
      var json = jsonDecode(response.body);
      fun();
      return json;
      // print("json['sno']");
      // print(json['sno']);
    }
  }

  static Future insert(String query) async {
    var uri = Uri.parse(insertURL);
    var response = await http.post(uri, body: {
      "sql" : query
    });
    var data = json.decode(response.body);
    print("response we got: ");
    print(data);
    if (data=="success") {
      return "success";
    } else if (data=="failed") {
      return "failed";
    }
  }
}