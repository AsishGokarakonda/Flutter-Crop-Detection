import 'package:crop_recommend/widgets/curved_buttons.dart';
import 'package:crop_recommend/utils/routes.dart';
import 'package:crop_recommend/widgets/background_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  bool hidepassword = true;
  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(seconds: 1, milliseconds: 20));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(bgimage: 'assets/signup/login.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(children: [
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
            const GetTextField(
                icon: Icons.person,
                hint: 'Username',
                inputType: TextInputType.name,
                inputAction: TextInputAction.next),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                // height: 60,
                height: 60,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.grey[500]?.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: TextField(
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
                          color: Colors.grey[500],
                        ),
                      ),
                      hintText: 'Password',
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
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
            const CurvedButton(buttonText:'Login'),
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
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: Colors.grey[500]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
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
          ),
        ),
      ),
    );
  }
}