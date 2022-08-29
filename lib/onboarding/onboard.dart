import 'package:crop_recommend/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
    required String backgroundImg,
  })=>Container(
    // write a condition such that if backgroundImg is not nobg then it should show color:color else it should show backgroundImg in decoration
    decoration: BoxDecoration(
      color: color,
      image: DecorationImage(
        image: AssetImage(backgroundImg),
        fit: BoxFit.fill,
      ),
    ),
    child: Column(mainAxisAlignment: MainAxisAlignment.center,

    children: [ urlImage =='noimg' ? const SizedBox(height: 10.0,) :  Container(child: Image.asset(urlImage,fit: BoxFit.cover,width: MediaQuery.of(context).size.height * 0.25)),
    const SizedBox(height: 64),
    Text(title,
    style: const TextStyle(color: Color.fromARGB(255, 94, 94, 94),fontSize: 32,fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 24,),
    Container(
      margin: const EdgeInsets.only(left: 30,right: 25),
      child: urlImage != 'noimg' ? Text(subtitle,style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize:  16.0,),): Text(subtitle,style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize:  20.0),) ,
    )
    ],),
  );

  @override
  Widget build(BuildContext context) {
    movetologin(BuildContext context) async {

      await Future.delayed(const Duration(seconds: 1, milliseconds: 20));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.loginRoute);
    
  }
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.only(bottom: 80),
        margin: const EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(() => isLastPage = index ==2);
          },
          children: [
            buildPage(color: Color.fromARGB(77, 136, 255, 63),
            urlImage: 'noimg',
            title: 'Welcome !',
            subtitle: 'This is a simple app to help you detect what crops are best and detect diseases',
            backgroundImg: 'assets/onboard/login.png'
            ),

// color: Color.fromARGB(77, 136, 255, 63),
            buildPage(color: Colors.white,
            urlImage: 'assets/onboard/page1.png',
            title: 'Check Health',
            subtitle: 'Take a photo, upload and check if crop is healthy or not',
            backgroundImg: 'nobg'
            ),
// Color.fromARGB(77, 242, 255, 0),
            buildPage(color: Colors.white,
            urlImage: 'assets/onboard/page2.png',
            title: 'Best Crop',
            subtitle: 'Select a best crop from your area based on prices, weather and many more...',
            backgroundImg: 'nobg'
            ),

            // buildPage(color: Color.fromARGB(77, 222, 219, 219),
            // urlImage: 'assets/onboard/page1.png',
            // title: 'Community',
            // subtitle: 'ask questions and get answers from users across all over the world'),
          ],
        ),
      ),
      bottomSheet: isLastPage ? InkWell(
                      onTap: () => movetologin(context),
                      child: AnimatedContainer(
                        // color: Colors.white,
                        duration: const Duration(seconds: 1),
                        width:MediaQuery.of(context).size.height * 0.6,
                        height: 60,
                        //  padding: EdgeInsets.only(
                        // right: MediaQuery.of(context).size.height * 0.5,
                        // left: MediaQuery.of(context).size.height * 0.5),
                        decoration: BoxDecoration(
                            color: Colors.blue[400]),
                        alignment: Alignment.center,
                        child: const Text(
                                "Get Started",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                      ),
                    )
      : Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => controller.jumpToPage(2),
                child: const Text('SKIP',style: TextStyle(color: Color.fromARGB(255, 58, 211, 234),fontSize: 17),
                )),
            Center(
              child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(activeDotColor: Color.fromARGB(255, 58, 211, 234)),
            )),
            TextButton(
                onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
                child: const Text('NEXT',style: TextStyle(color: Color.fromARGB(255, 58, 211, 234),fontSize: 17),
                )),
          ],
        ),
      ),
    );
  }
}
