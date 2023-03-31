import 'dart:ffi';

class APILoad {
  static String api = 'http://10.196.10.102:8000';
  // this should be the ip address of the machine where the server is running.
  // for simplicity connect phone and laptop to same wifi and use the ip address of the laptop
}

class CropHealthselection {
  static List selectedcrops = [];
  static Map<String, bool> cropsbool = {
    'Cotton': false,
    'Banana': false,
    'Tomato': false,
    'Sugarcane': false,
    'Wheat': false,
    'Potato': false,
  };
  // Map for day after sowing for each crop
  static Map<String, int> dayaftersowing = {
    'Cotton': 0,
    'Banana': 0,
    'Tomato': 0,
    'Sugarcane': 0,
    'Wheat': 0,
    'Potato': 0,
  };
}

class PestManagement {
  static String diseaseselectedcrop = '';
  static String dayaftersowing = '';
}

class Settings {
  static String language = 'en_US';
}

class CottonAdvisory {
  static List advisory = [
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
    ['10','Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'],
  ];
  static Map<String, List> fulladvisory = {
    '10': [
      'Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.',
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.'
    ]
  };
}
