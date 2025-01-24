import 'dart:convert';
import 'package:http/http.dart' as http;

class UserServices {
  Future<void> createUser(
      String email, String password, Map<String, dynamic> userData) async {
    //name is not required
    //number too not required
    //profile img
    int role = 1; //Default role
    String url = "http://147.93.97.78:5060/users/";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          "email": email,
          "password": password,
          "role": role,
          "created_by": "admin"
        },
      );

      if (response.statusCode == 201) {
        print("User Created Successfully");
        userData = jsonDecode(response.body);
      } else {
        print("error at response");
        //handle error statements
      }

      if (response.statusCode != 201) {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      print("this error happening in create user $e");
    }
  }

  Future<void> loginUser(String email, String password, int userID) async {
    String url = "http://147.93.97.78:5060/users/login/";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        print("User logined Successfully");
        var temp = jsonDecode(response.body);

        if (temp["message"] == "Login successful." && temp["user_id"] != null) {
          print(temp["user_id"]);
          userID = temp["user_id"];
        } else {
          print("error at respone body");
        }
      } else {
        print("error at response");
        //handle error statements
      }

      if (response.statusCode != 201) {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      print("Error happening in login uer $e");
    }
  }

  Future<void> fetchUserById(int userID) async {
    String url = "http://147.93.97.78:5060/users/$userID/";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print("User fetched successfully");
        var userData = jsonDecode(response.body);
        print(userData);
      } else {
        print("Error fetching user by ID. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching user by ID: $e");
    }
  }

  Future<void> fetchUserByEmail(String email) async {
    String url = "http://147.93.97.78:5060/users/email/$email/";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print("User fetched successfully");
        var userData = jsonDecode(response.body);
        print(userData);
      } else {
        print(
            "Error fetching user by email. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching user by email: $e");
    }
  }

  
}
