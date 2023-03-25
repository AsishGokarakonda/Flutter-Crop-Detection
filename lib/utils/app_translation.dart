import 'package:get/get.dart';

class AppTranslation extends Translations {
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'hello':"Hello",
      'Login':"Login",
      'Settings':"Settings",
      'Select Language':"Select Language",
      'English':"English",
      'Hindi':"Hindi",
      'Kannada':"Kannada",
    },
    // kannada translation
    'kn_IN':{
      'hello':"ಹಲೋ",
      'Login':"ಲಾಗಿನ್",
      'Settings':"ಸೆಟ್ಟಿಂಗ್ಗಳು",
      'Select Language':"ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ",
      'English':"ಇಂಗ್ಲೀಷ್",
      'Hindi':"ಹಿಂದಿ",
      'Kannada':"ಕನ್ನಡ",
    },
    // hindi translation
    'hi_IN':{
      'hello':"नमस्ते",
      'Login':"लॉग इन करें",
      'Settings':"सेटिंग्स",
      'Select Language':"भाषा चुनें",
      'English':"अंग्रेज़ी",
      'Hindi':"हिंदी",
      'Kannada':"ಕನ್ನಡ",
    }
  };
}