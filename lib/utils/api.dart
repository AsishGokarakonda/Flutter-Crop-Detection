class APILoad{
  static String api = 'http://10.196.10.102:8000';
  // this should be the ip address of the machine where the server is running. 
  // for simplicity connect phone and laptop to same wifi and use the ip address of the laptop
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