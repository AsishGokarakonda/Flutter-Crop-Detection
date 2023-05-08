import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class APILoad {
  static String api = 'http://10.196.10.102:8000';
  // http://10.196.10.102:8000/api/login/
  // this should be the ip address of the machine where the server is running.
  // for simplicity connect phone and laptop to same wifi and use the ip address of the laptop
  // turn off the firewall of the laptop in firewall and network protection settings
}

class CropHealthselection {
  static List<String>  selectedcrops = [];
  static Map<String, bool> cropsbool = {
    'Cotton': false,
    'Banana': false,
    'Tomato': false,
    'Sugarcane': false,
    'Wheat': false,
    'Potato': false,
  };
  static Map<String, int> dayaftersowing = {
    'Cotton': 0,
    'Banana': 0,
    'Tomato': 0,
    'Sugarcane': 0,
    'Wheat': 0,
    'Potato': 0,
  };

  static void intialisevars() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, bool> spCropsbool = {
      'Cotton': false,
      'Banana': false,
      'Tomato': false,
      'Sugarcane': false,
      'Wheat': false,
      'Potato': false,
    };
    Map<String, int> spDayaftersowing = {
      'Cotton': 0,
      'Banana': 0,
      'Tomato': 0,
      'Sugarcane': 0,
      'Wheat': 0,
      'Potato': 0,
    };

    prefs.setString('language', 'en_US');
    prefs.setStringList('spSelectedcrops', []);

    String encodedMap = json.encode(spCropsbool);
    prefs.setString('spCropsbool', encodedMap);

    encodedMap = json.encode(spDayaftersowing);
    prefs.setString('spDayaftersowing', encodedMap);
  }

  // static void getvars() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? encodedMap = prefs.getString('timeData');
  //   Map<String, dynamic> decodedMap = json.decode(encodedMap!);
  //   print(decodedMap);
  // }
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
    [
      '10',
      'Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.'
    ],
    ['15', 'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.'],
    [
      '20',
      'Adopt Alternatively Alternate Furrow Irrigation (AAFI) in heavy soils (Vertisols), which saves time, labour, irrigation water (to the extent of 30%) and minimizes the long term ill effects of irrigation on soil properties. Drip irrigation can be a viable option under constraints of irrigation water in zone 3 and 8 for hybrid cotton cultivation. Scheduled irrigation at 6 cm depth in black soils.'
    ],
    ['30', 'Under irrigated conditions, top dress 50 % N & K2O at 30 DAS'],
    ['40', 'Scheduled irrigation at 6 cm depth in black soils'],
    [
      '45',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils at sympodial branching and square formation stage.'
    ],
    [
      '50',
      'Under irrigated conditions in Zone -3 top dress 50 % N & remaining 1/3rd of K2O from recommended dosage.'
    ],
    [
      '60',
      'Under assured rainfall conditions, top dress remaining 50% N at 60 DAS.'
    ],
    [
      '75',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils at flowering and fruiting stage.'
    ],
    [
      '80',
      'Under irrigated conditions in Zone -3, top dress 50 % N & 1/3rd K2O from recommended dosage'
    ],
    [
      '90',
      'Under heavy rainfall areas (Malanad), apply 1/3rd of N, P2O5 and K2O from recommended dosage.'
    ],
    [
      '100',
      'In all the situations give foliar sprays of 2% Urea or DAP + 1% MOP'
    ],
    [
      '105',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils at peak boll formation.'
    ],
    [
      '110',
      'Foliar sprays of 1% MgSO4 or 2% urea or DAP reduces the leaf reddening during winter season.'
    ],
    [
      '120',
      'Under irrigated conditions in Zone -3, remaining 1/3rd K2O from recommended dosage',
    ],
    [
      '135',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.'
    ],
    [
      '150',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.',
    ],
  ];
  static Map<String, List> fulladvisory = {
    '10': [
      'Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.',
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.',
    ],
    '15': ['Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.'],
    '20': [
      'Adopt Alternatively Alternate Furrow Irrigation (AAFI) in heavy soils (Vertisols), which saves time, labour, irrigation water (to the extent of 30%) and minimizes the long term ill effects of irrigation on soil properties. Drip irrigation can be a viable option under constraints of irrigation water in zone 3 and 8 for hybrid cotton cultivation. Scheduled irrigation at 6 cm depth in black soils.',
      'chanceofdisease:Bacterial blight',
      'Water soaked angular leaf spots appear on the leaves, later spread to the veins and vein lets.',
      'Foliar sprays of Streptocycline Sulphate @ 0.5 gm/litre and Copper-Oxychlode @ 3 g / litre of water as and when symptoms seen.'
    ],
    '30': [
      'Under irrigated conditions, top dress 50 % N & K2O at 30 DAS.',
      'Three - four intercultivations at an interval of 15 days helps in controlling weeds and acts as dust mulch in conserving the available soil moisture.',
      'In rainfed situations weeds can be managed effectively by 2-3 intercultivations followed by hand weeding.',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils'
    ],
    '40': [
      'Scheduled irrigation at 6 cm depth in black soils',
      'Sucking pest management'
    ],
    '45': [
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils at sympodial branching and square formation stage.',
      'chanceofdisease:Rust',
      'Circular brown to reddish pustules appear during boll maturation stage on lower surface of leaves and later on they coalesce in to large spots lowering photosynthesis, affecting nutrient supply from source to sink thus affecting the yields. High humidity is needed in June or July for disease development.',
      'Foliar sprays of Copper Oxychloride @ 3g/litre or Mancozeb @ 2gm/litre of water, as and when symptoms are seen.',
      'chanceofdisease:Spotted bollworm',
      'Feeds on squares, flowers and bolls. Flaring up of squares and damage holes on bolls.',
      'Installation of pheromone traps @ 5/ha for monitoring of bollworm moths activity. Use separate traps for each kind of boll bollworms. Change the lure at every 15-20 days.',
      'Release egg parasitoid i.e. Trichogramma chilonis @ 2.5 lakh/ha (Tricho card) twice a week at 45-50 DAS.'
    ],
    '50': [
      'Under irrigated conditions in Zone -3 top dress 50 % N & remaining 1/3rd of K2O from recommended dosage.',
      'chanceofdisease:Wilt',
      'Adult plants become weak coupled with yellowing of leaves with senescence and drying',
      'Drenching of Carbendazim @ 2g/litre of water around the diseased plants',
      'chanceofdisease:White flies',
      'Erection of yellow sticky traps @ 50 /ha, Foliar sprays of NSKE @ 5.0% or 1.5 ml Triazophos 40 EC per liter of water.'
    ],
    '60': [
      'Under assured rainfall conditions, top dress remaining 50% N at 60 DAS.',
      'Under irrigated conditions, top dress 25% N & K2O at 60 DAS.',
      'Under heavy rainfall areas (Malanad), apply 1/3rd of N, P2O5 and K2O from recommended dosage.',
      'Keep the plots weed free up to 60 days as the crop growth is slow during this period and this is the critical crop growth stage for crop weed competition.',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.',
      'Scheduled irrigation at 6 cm depth in black soils.',
      'Physiological disorder like squares, flowers and boll dropping can be minimized by foliar sprays of Planofix @ 0.25ml/lit of water during pre- flowering (55-60 DAS) stage.',
      'chanceofdisease:Grey mildew / areolate mildew ',
      'A whitish mycelial growth appears chiefly on the under surface of the leaves. Under congenial conditions defoliation is observed in diploid cottons.',
      'Foliar sprays of Carbendazim @ 1g /litre of water as and when symptoms seen.',
      'Spraying of neem based insecticides or Endosulfon 35 EC @ 2.75 ml/liter after 5-7 days of T. chilonis release.',
      'Under irrigated situations spray Methomyl 40 SP @ 0.6g/lit.',
      'Spray Ha NPV @ 500 LE/ha + 5 % jaggery water + 0.1% Boric acid (Spray during morning or evening hours) at 60-70 DAS.',
      'Twist tying of PB Ropel sticks @ 200/ha Or Mass trapping and killing of pink bollworm moths through pheromone traps @ 30/ha.'
    ],
    '75': [
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils at flowering and fruiting stage.',
      'chanceofdisease:Boll rot',
      'The bolls nearer to the ground becomes decay, with mycelial growth and some times bacterial ooze comes out of the bolls.',
      'Foliar sprays of Copper oxychlode @ 3g/litre and Streptocycline Sulphate @ 0.5 gm/litre or Mancozeb @ 2g /litre and Chlorothalonil @ 2g/litre of water at boll initiation stage.',
      'Use delta traps (5.0/ha) for monitoring PBW activities',
      'Twist tying of PB Ropel sticks @ 200/ha at 30-40 DAS Or Mass trapping and killing of moths through pheromone traps @ 30/ha',
      'Selective use of following insecticides based on incidence of bollworms: Emamectin benzoate 5 SG @ 0.25g/lit or Indoxcarb 14.5 SC @ 0.5 ml/lit or Spinosad 48 SC @ 0.2 ml/lit or Carbaryl 50% WP @ 3.0 g/lit or Quinolpho 25 EC @ 2.0 ml/lit or Cholrpyriphos 20 EC @ 2.5 ml/lit.water.'
    ],
    '80': [
      'Under irrigated conditions in Zone -3, top dress 50 % N & 1/3rd K2O from recommended dosage',
      'In all the situations give foliar sprays of 2% Urea or DAP + 1% MOP',
      'Scheduled irrigation at 6 cm depth in black soils at flowering and fruiting stage.',
      'Physiological disorder like squares, flowers and boll dropping can be minimized by foliar sprays of Planofix @ 0.25ml/lit of water during peak flowering stage (80-90 DAS) of the crop.',
      'Nipping and disposal of terminal shoots at 70-90 DAS to reduce egg laying by bollworm moths and to prevent aphid breeding.'
    ],
    '90': [
      'Under heavy rainfall areas (Malanad), apply 1/3rd of N, P2O5 and K2O from recommended dosage.',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.',
      'Foliar sprays of 1% MgSO4 or 2% urea or DAP at 90 DAS reduces the leaf reddening during winter season.',
      'For boll rot, need based foliar sprays of Copper oxychlode @ 3g/litre and Streptocycline Sulphate @ 0.5 gm/litre or Mancozeb @ 2g /litre and Chlorothalonil @ 2g/litre of water at boll formation stage after 10-12 days of previous spray in heavy rainfall /irrigated areas on interspecific hybrids.'
    ],
    '100': [
      'In all the situations give foliar sprays of 2% Urea or DAP + 1% MOP',
      'Scheduled irrigation at 6 cm depth in black soils at peak boll formation',
      'Spray with recommended synthetic pyrethroids in severe cases of bollworm incidence (0.5ml of Decamethtrin 2.8 EC or Cypermethrin 10 EC or Fenvalrate 10 EC or β- Cyfluthrin 25 SC or 0.25ml/lit Alphamethrin 10 EC, however its use should be avoided or restricted to one or two spays after 100 days of sowing alternating with Insecticides of other groups.'
    ],
    '105': [
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils at peak boll formation.'
    ],
    '110': [
      'Foliar sprays of 1% MgSO4 or 2% urea or DAP reduces the leaf reddening during winter season.'
    ],
    '120': [
      'Under irrigated conditions in Zone -3, remaining 1/3rd K2O from recommended dosage',
      'In all the situations give foliar sprays of 2% Urea or DAP + 1% MOP',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils at boll development and boll opening stage.',
      'Scheduled irrigation at 6 cm depth in black soils at boll development and boll opening stage.',
      'Apply recommended synthetic pyrethroids at 110-130 days after sowing for Bt resistant population of American bollworm and pink boll worms.'
    ],
    '135': [
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.'
    ],
    '150': [
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.',
      'Conservation of soil moisture till boll opening stage is essential.'
    ],
  };
}
