class APILoad{
  static String api = 'http://192.168.29.109:8000';
}

class Cropchoiceselection{
  static List selectedcrops = [];
  static  Map<String, bool> cropsbool = {
    'Cotton': false,
    'Banana': false,
    'Tomato': false,
    'Sugarcane': false,
    'Wheat': false,
    'Potato': false,
  };
}


class PestManagement{
  static String diseaseselectedcrop = '';
  static String dayaftersowing = '';
}