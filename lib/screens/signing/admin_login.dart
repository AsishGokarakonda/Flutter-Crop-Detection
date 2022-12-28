import 'dart:convert';
import 'package:crop_recommend/utils/routes.dart';
import 'package:crop_recommend/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crop_recommend/utils/api.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}


class _AdminLoginPageState extends State<AdminLoginPage> {
  bool changebutton = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool hidepassword = true;
  List<String> list = <String>['Admin', 'User'];
  // Create storage
  final storage = const FlutterSecureStorage();

  static String username = "";
  static String password = "";

  Future<void> _validationcheck() async {
    final validation = _formkey.currentState!.validate();
    if (validation) {
      _formkey.currentState!.save();
    }
  }

  // check if already logged in
  dynamic jwt;
  Future checklogin() async{
      const storage = FlutterSecureStorage();
      jwt = await storage.read(key: 'jwt');
      if(jwt != null){
        // get user type
        var response = await http.get(Uri.parse('${APILoad.api}/api/user/'), headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'jwt': '$jwt'
        });
        var data = jsonDecode(response.body);
        if(data['is_superuser'] == true){
            Navigator.pushNamedAndRemoveUntil(context,MyRoutes.adminhomeRoute, (route) => false);
        }
        else{
          // remove jwt from storage
          await storage.delete(key: 'jwt');
          Navigator.pushNamedAndRemoveUntil(context,MyRoutes.adminloginRoute, (route) => false);
        }
      }
      return false;
  }



  @override
  void initState() {
    // check if already logged in or not
    checklogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        style: const TextStyle(color: Colors.white, height: 1.4),
                        obscureText: hidepassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: const TextStyle(color: Colors.white),
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
                          _AdminLoginPageState.password = value!;
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Column(
              //       children: [
              //         GestureDetector(
              //           onTap: () => Navigator.pushNamed(
              //               context, MyRoutes.forgotPasswordRoute),
              //           child: const Padding(
              //             padding: EdgeInsets.only(right: 30.0),
              //             child: Text('Forgot Password?',
              //                 textAlign: TextAlign.end,
              //                 style: TextStyle(
              //                   color: Colors.blue,
              //                   fontSize: 15,
              //                 )),
              //           ),
              //         )
              //       ],
              //     ),
              //   ],
              // ),
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
                        var url = "${APILoad.api}/api/loginsuperuser/";
                        // if server is not running then show error message
            
                        http.post(Uri.parse(url), body: {
                          "username": username,
                          "password": password,
                        }).then((response) async {
                          if (response.statusCode == 200) {
                            var data = json.decode(response.body);
                            if (data['status'] == "success") {
                              await storage.write(
                                  key: "jwt", value: data["jwt"]);
                              // delete the stack and replace it with the new route
                              Navigator.pushNamedAndRemoveUntil(context,
                                  MyRoutes.adminhomeRoute, (route) => false);
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
                    child: const Text(
                      'Login',
                      style: TextStyle(
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
              // GestureDetector(
              //   onTap: () => Navigator.pushNamed(context, MyRoutes.signupRoute),
              //   child: Container(
              //     child: Text(
              //       'Create New Account',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
            ]),
          ),
        )
      ],
    );
  }
}

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
              style: const TextStyle(color: Colors.white, height: 1.4),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.white),
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
                  _AdminLoginPageState.username = value!;
                } else if (hint == 'Password') {
                  _AdminLoginPageState.password = value!;
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}
