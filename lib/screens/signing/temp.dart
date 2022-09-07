import 'package:crop_recommend/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          body: Column(
            children: [
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.grey[500]?.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: TextField(
                    cursorColor: Colors.white54,
                    style: const TextStyle(color: Colors.white,height: 1.4),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey[500],
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
                // height: 60,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.grey[500]?.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: TextField(
                    cursorColor: Colors.white54,
                    style: const TextStyle(color: Colors.white,height: 1.4),
                    obscureText: hidepassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: InkWell(
                            onTap: (){
                              setState(() {
                                hidepassword = !hidepassword;
                              });
                            } ,
                            child: Icon(
                              hidepassword?Icons.visibility_off:Icons.visibility ,
                              color: Colors.grey[500],
                            ),
                          ) ,
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
                  children: const [
                    Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: Text('Forgot Password?',
                            textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,)),
                )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height:15,
            ),
            const LoginButton(),
            const SizedBox(
              height:25,
            ),
            Container(
              child: Text(
                'Create New Account',
                style: TextStyle(
                    color: Colors.white
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

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromARGB(255, 183, 159, 62)
      ),
      child: TextButton(
        onPressed: (){},
        child: Text('Login',style: TextStyle(color: Colors.white,height: 1.4,fontWeight: FontWeight.bold,fontSize: 17.0),)
        ) ,
    );
  }
}
