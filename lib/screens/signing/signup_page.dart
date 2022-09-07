import 'package:crop_recommend/widgets/Exporting.dart';
import 'package:crop_recommend/widgets/background_image.dart';
import 'package:crop_recommend/widgets/curved_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool hidepassword = true;

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
              Column(children: [
                const GetTextField(icon: Icons.person, hint: 'Username',inputType: TextInputType.name,inputAction: TextInputAction.next),
                const GetTextField(icon: Icons.email_outlined, hint: 'Email',inputType: TextInputType.emailAddress,inputAction: TextInputAction.next),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.grey[500]?.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: TextField(
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
                      ),
                    ),
                  ),
                ),
                const GetTextField(icon: FontAwesomeIcons.lock, hint: 'Confirm Password', inputType: TextInputType.visiblePassword,inputAction: TextInputAction.done),
                const SizedBox(
                  height: 20,
                ),
                const CurvedButton(buttonText: 'Signup')
              ])
            ]),
          ),
        )
      ],
    );
  }
}
