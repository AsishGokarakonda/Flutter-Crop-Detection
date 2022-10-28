import 'dart:convert';

import 'package:crop_recommend/widgets/curved_buttons.dart';
import 'package:crop_recommend/utils/routes.dart';
import 'package:crop_recommend/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:crop_recommend/utils/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  bool changebutton = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool hidepassword = true;
  List<String> list = <String>['Admin', 'User'];
  // Create storage
  final storage = const FlutterSecureStorage();

  static String username = "";
  static String password = "";
  List<String> _locations = ['Admin', 'User']; // Option 2
  String _selectedLocation = 'User'; // Option 2

  Future<void> _validationcheck() async {
    final validation = _formkey.currentState!.validate();
    if (validation) {
      _formkey.currentState!.save();
      print(username);
      print(password);
    }
  }

  // check if already logged in
  var jwt;
  Future checklogin() async{
      final storage = FlutterSecureStorage();
      jwt = await storage.read(key: 'jwt');
      if(jwt != null){
            Navigator.pushNamedAndRemoveUntil(context,MyRoutes.newrootRoute, (route) => false);
      }
      return false;
  }



  @override
  void initState() {
    // TODO: implement initState
    // check if already logged in or not
    checklogin();
    super.initState();
        SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // keep constrain of not rotating the screen

    return Stack(
      children: [
        const BackgroundImage(bgimage: 'assets/signup/login.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formkey,
            child: Column(children: [
              const Flexible(
                  child: Center(
                child: Text(
                  'Agri Grow',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                
              )),
              // make a dropdown button for selecting the type of user (admin or farmer)
              const GetTextField(
                  icon: Icons.person,
                  hint: 'Username',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                  ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, top: 10.0, right: 20.0, bottom: 10.0),
                child: Stack(children: [
                  Container(
                    height: 56.0,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.grey[500]?.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Password cannot be empty' : null,
                        cursorColor: Colors.white54,
                        style: TextStyle(color: Colors.white, height: 1.4),
                        obscureText: hidepassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                hidepassword = !hidepassword;
                              });
                            },
                            child: Icon(
                              hidepassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Password',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          _LoginPageState.password = value!;
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, MyRoutes.forgotPasswordRoute),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text('Forgot Password?',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 183, 159, 62)),
                child: TextButton(
                    onPressed: () {
                      _validationcheck();
                      // if there is no error in the form then send the data to the server
                      if (_formkey.currentState!.validate()) {
                        // if there is no error in the form then send the data to the server
                        var url = "${APILoad.api}/api/login/";
                        // if server is not running then show error message
            
                        http.post(Uri.parse(url), body: {
                          "username": username,
                          "password": password,
                        }).then((response) async {
                          print(response.body);
                          if (response.statusCode == 200) {
                            var data = json.decode(response.body);
                            print(data['status']);
                            if (data['status'] == "success") {
                              await storage.write(
                                  key: "jwt", value: data["jwt"]);
                              Map<String, String> allValues =
                                  await storage.readAll();
                              // delete the stack and replace it with the new route
                              Navigator.pushNamedAndRemoveUntil(context,
                                  MyRoutes.newrootRoute, (route) => false);
                            } else {
                              // show error message popup
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Error"),
                                      content: const Text(
                                          "Username or password is incorrect"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Ok"))
                                      ],
                                    );
                                  });
                            }
                          }
                        });
                      }
                      // if clause ends here
                    },
                    child: Text(
                      'Login',
                      style: const TextStyle(
                          color: Colors.white,
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    )),
              ),
              // onPressed: () => movetohome(context),changebutton: changebutton
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, MyRoutes.signupRoute),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
        )
      ],
    );
  }
}


// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   List<String> list = <String>['Admin', 'User'];
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }


class GetTextField extends StatelessWidget {
  const GetTextField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, top: 10.0, right: 20.0, bottom: 10.0),
      child: Stack(children: [
        Container(
          height: 56.0,
          width: MediaQuery.of(context).size.width * 0.88,
          decoration: BoxDecoration(
            color: Colors.grey[500]?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              cursorColor: Colors.white54,
              style: TextStyle(color: Colors.white, height: 1.4),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  icon,
                  color: Colors.white,
                ),
                hintText: hint,
              ),
              keyboardType: inputType,
              textInputAction: inputAction,
              validator: hint == 'Username'
                  ? (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Username must be atleast 4 characters';
                      }
                      return null;
                    }
                  : (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Password must be atleast 6 characters';
                      }
                      return null;
                    },
              onSaved: (value) {
                if (hint == 'Username') {
                  _LoginPageState.username = value!;
                } else if (hint == 'Password') {
                  _LoginPageState.password = value!;
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}
