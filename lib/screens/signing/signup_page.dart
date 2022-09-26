// import 'package:crop_recommend/widgets/Exporting.dart';
import 'package:crop_recommend/widgets/background_image.dart';
// import 'package:crop_recommend/widgets/curved_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool hidepassword = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // create username varible and send to other dart file and set there and return it
  static String username = "";
  static String email = "";
  static String password = "";
  static String confirmpassword = "";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(bgimage: 'assets/signup/login.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Stack(children: [
                Center(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.15,
                    backgroundColor: Colors.grey[500]?.withOpacity(0.4),
                    child: Icon(
                      FontAwesomeIcons.user,
                      color: const Color.fromARGB(242, 240, 235, 235),
                      size: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Form(
                  key: _formkey,
                  child: Column(children: [
                    const GetTextField(
                      icon: Icons.person,
                      hint: 'Username',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    const GetTextField(
                      icon: Icons.email,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
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
                              validator: (value) => value!.isEmpty
                                  ? 'Password cannot be empty'
                                  : null,
                              cursorColor: Colors.white54,
                              style:
                                  TextStyle(color: Colors.white, height: 1.4),
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
                                _SignupPageState.password = value!;
                              },
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const GetTextField(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Confirm Password',
                        inputType: TextInputType.visiblePassword,
                        inputAction: TextInputAction.done),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromARGB(255, 183, 159, 62)),
                      child: TextButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              print(_SignupPageState.username);
                              print(_SignupPageState.email);
                              print(_SignupPageState.password);
                              print(_SignupPageState.confirmpassword);
                            }
                          },
                          child: const Text(
                            'Signup',
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.4,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          )),
                    )
                  ]))
            ]),
          ),
        )
      ],
    );
  }
}

// make get text field widget
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
                  : hint == 'Email'
                      ? (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }
                      : hint == 'Password'
                          ? (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return 'Password must be atleast 6 characters';
                              }
                              return null;
                            }
                          : (value) {
                              if (value!.isEmpty) {
                                return 'Confirm password cannot be empty';
                              }
                              return null;
                            },
              onSaved: (value) {
                if (hint == 'Username') {
                  _SignupPageState.username = value!;
                } else if (hint == 'Email') {
                  _SignupPageState.email = value!;
                } else if (hint == 'Password') {
                  _SignupPageState.password = value!;
                } else if (hint == 'Confirm Password') {
                  _SignupPageState.confirmpassword = value!;
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}
