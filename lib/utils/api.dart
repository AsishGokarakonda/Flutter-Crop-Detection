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
    ['15','Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.'],
    ['20','Adopt Alternatively Alternate Furrow Irrigation (AAFI) in heavy soils (Vertisols), which saves time, labour, irrigation water (to the extent of 30%) and minimizes the long term ill effects of irrigation on soil properties. Drip irrigation can be a viable option under constraints of irrigation water in zone 3 and 8 for hybrid cotton cultivation. Scheduled irrigation at 6 cm depth in black soils.'],
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
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.',
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.',
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.',
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.',
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.',
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.'
    ]
  };
}
