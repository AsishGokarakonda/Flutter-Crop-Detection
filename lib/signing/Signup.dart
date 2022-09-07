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
        ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Color.fromARGB(255, 18, 17, 17), Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/signup/login.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              ),
            ),
          ),
        ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.grey[500]?.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: TextField(
                        cursorColor: Colors.white54,
                        style: TextStyle(color: Colors.white, height: 1.4),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintText: 'Username',
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.grey[500]?.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: TextField(
                        cursorColor: Colors.white54,
                        style: TextStyle(color: Colors.white, height: 1.4),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          hintText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ),
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
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.grey[500]?.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: TextField(
                        cursorColor: Colors.white54,
                        style: TextStyle(color: Colors.white, height: 1.4),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            FontAwesomeIcons.lock,
                            color: Colors.white70,
                          ),
                          hintText: 'Confirm Password',
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromARGB(255, 212, 183, 67)),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            height: 1.4,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      )),
                )
              ])
            ]),
          ),
        )
      ],
    );
  }
}
