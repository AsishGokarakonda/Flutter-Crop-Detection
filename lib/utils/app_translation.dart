import 'package:get/get.dart';

class AppTranslation extends Translations {
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'hello':"Hello",
      'Login':"Login",
      'Select Language':"Select Language",
      'English':"English",
      'Hindi':"Hindi",
      'Kannada':"Kannada",
      'My Profile':"My Profile",
      'Add Field':"Add Field",
      'Settings':"Settings",
      'FAQs':"FAQs",
      'About Us':"About Us",
      'Log Out':"Log Out",
      'Selected Crops':'Selected Crops',
      // all_home_page.dart
      'Kisaan Margadarshak':'Kisaan Margadarshak',
      'A Smart App':'A Smart App',
      'Crop Choice':'Crop Choice',
      'Your Dashboard':'Your Dashboard',
      'Crop Health':'Crop Health',
      'Weed Management':'Weed Management',
      'Market Choice':'Market Choice',
      'Pest Management':'Pest Management',
      'Weather Info': 'Weather Info',
      // pest management
      'Detect Disease':'Detect Disease',
      'Your Crops':'Your Crops',
      'Select a crop so that we can help you':'Select a crop so that we can help you',
      // detect disease
      'Select Your Crop':'Select Your Crop',
      'Select a crop to detect disease':'Select a crop to detect disease',
      'Cotton':'Cotton',
      'Banana':'Banana',
      'Sugarcane':'Sugarcane',
      'Tomato':'Tomato',
      'Wheat':'Wheat',
      'Potato':'Potato',
      'Confirm':'Confirm',
      'Selected crops':'Selected crops',
      'Ok':'Ok',
      // disease detection
      'Disease Detector':'Disease Detector',
      'Selected Crop':'Selected Crop',
      'Enter day after sowing':'Enter day after sowing',
      'Tap on the below icon to take a picture':'Tap on the below icon to take a picture',
      'Tap To Upload':'Tap To Upload',
      'Please enter day after sowing before uploading image':'Please enter day after sowing before uploading image',
      'Error':'Error',
      'Disease':'Disease',
      // Advisory
      'Crop Advisory':'Crop Advisory',
      'Advisory':'Advisory',
      'Days after sowing:':'Days after sowing:',
      'Days after sowing':'Days after sowing',
      'Add Crops':'Add Crops',
      'days':'days',
      'Change days after sowing':'Change days after sowing',
      'Show more':'Show more',
       'Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.':'Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.',
       'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.':'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.':'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.',
       'Adopt Alternatively Alternate Furrow Irrigation (AAFI) in heavy soils (Vertisols), which saves time, labour, irrigation water (to the extent of 30%) and minimizes the long term ill effects of irrigation on soil properties. Drip irrigation can be a viable option under constraints of irrigation water in zone 3 and 8 for hybrid cotton cultivation. Scheduled irrigation at 6 cm depth in black soils.':'Adopt Alternatively Alternate Furrow Irrigation (AAFI) in heavy soils (Vertisols), which saves time, labour, irrigation water (to the extent of 30%) and minimizes the long term ill effects of irrigation on soil properties. Drip irrigation can be a viable option under constraints of irrigation water in zone 3 and 8 for hybrid cotton cultivation. Scheduled irrigation at 6 cm depth in black soils.',
      'chanceofdisease:Bacterial blight':'chanceofdisease:Bacterial blight',
      'Water soaked angular leaf spots appear on the leaves, later spread to the veins and vein lets.':'Water soaked angular leaf spots appear on the leaves, later spread to the veins and vein lets.',
      'Foliar sprays of Streptocycline Sulphate @ 0.5 gm/litre and Copper-Oxychlode @ 3 g / litre of water as and when symptoms seen.':'Foliar sprays of Streptocycline Sulphate @ 0.5 gm/litre and Copper-Oxychlode @ 3 g / litre of water as and when symptoms seen.',
    },
    // kannada translation
    'kn_IN':{
      'hello':"ಹಲೋ",
      'Weather Info': "ಹವಾಮಾನ ಮಾಹಿತಿ",
      'Login':"ಲಾಗಿನ್",
      'Select Language':"ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ",
      'English':"ಇಂಗ್ಲೀಷ್",
      'Hindi':"ಹಿಂದಿ",
      'Kannada':"ಕನ್ನಡ",
      'My Profile':"ನನ್ನ ಪ್ರೊಫೈಲ್",
      'Add Field':"ಕ್ಷೇತ್ರವನ್ನು ಸೇರಿಸಿ",
      'Settings':"ಸೆಟ್ಟಿಂಗ್ಗಳು",
      'FAQs':"ಪ್ರಶ್ನೆಗಳು",
      'About Us':"ನಮ್ಮ ಬಗ್ಗೆ",
      'Log Out':"ಲಾಗ್ ಔಟ್",
      // all_home_page.dart
      'Kisaan Margadarshak':'ಕಿಸಾನ್ ಮಾರ್ಗದರ್ಶಕ್',
      'A Smart App':'ಒಂದು ಸ್ಮಾರ್ಟ್ ಅಪ್ಲಿಕೇಶನ್',
      'Crop Choice':'ಕ್ರಾಪ್ ಆಯ್ಕೆ',
      'Your Dashboard':'ನಿಮ್ಮ ಡ್ಯಾಶ್ಬೋರ್ಡ್',
      'Crop Health':'ಕ್ರಾಪ್ ಆರೋಗ್ಯ',
      'Weed Management':'ವೀಡ್ ಮ್ಯಾನೇಜ್ಮೆಂಟ್',
      'Market Choice':'ಮಾರ್ಕೆಟ್ ಆಯ್ಕೆ',
      'Pest Management':'ಪೆಸ್ಟ್ ಮ್ಯಾನೇಜ್ಮೆಂಟ್',
      // pest management
      'Detect Disease':'ರೋಗವನ್ನು ಕಂಡುಬಂದಿರಿ',
      'Your Crops':'ನಿಮ್ಮ ಕ್ರಾಪ್ಸ್',
      'Select a crop so that we can help you':'ನಿಮ್ಮನ್ನು ಸಹಾಯಿಸಲು ಕ್ರಾಪ್ನನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      // detect disease
      'Select Your Crop':'ನಿಮ್ಮ ಕ್ರಾಪ್ನನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'Select a crop to detect disease':'ರೋಗವನ್ನು ಕಂಡುಬಂದಿರಿ',
      'Cotton':'ಕಾಪ್ಸ್',
      'Banana':'ಬ್ಯಾನಾನಾ',
      'Sugarcane':'ಸಿಗರ್',
      'Tomato':'ಟೊಮೇಟೋ',
      'Wheat':'ಗೋಳಿ',
      'Potato':'ಪೋಟೇಟೋ',
      'Confirm':'ದೃಢಪಡಿಸಿ',
      'Selected crops':'ಆಯ್ಕೆಮಾಡಿದ ಕ್ರಾಪ್ಸ್',
      'Ok':'ಸರಿ',
      // disease detection
      'Disease Detector':'ರೋಗ ಕಂಡುಬಂದಿರಿ',
      'Selected Crop':'ಆಯ್ಕೆಮಾಡಿದ ಕ್ರಾಪ್',
      'Enter day after sowing':'ಸೇರಿಸಿದ ದಿನವನ್ನು ನಮೂದಿಸಿ',
      'Tap on the below icon to take a picture':'ಚಿತ್ರವನ್ನು ತೆಗೆದುಹಾಕಲು ಕೆಳಗಿನ ಐಕಾನ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ',
      'Tap To Upload':'ಅಪ್ಲೋಡ್ ಮಾಡಲು ಟ್ಯಾಪ್ ಮಾಡಿ',
      'Please enter day after sowing before uploading image':'ಚಿತ್ರವನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಲು ಸೇರಿಸಿದ ದಿನವನ್ನು ನಮೂದಿಸಿ',
      'Error':'ತಪ್ಪಾಗಿದೆ',
      'Disease': 'ರೋಗ',
      // Advisory
      'Crop Advisory':'ಕ್ರಾಪ್ ಸಲಹೆ',
      'Advisory':'ಸಲಹೆ',
      'Days after sowing:' : 'ಸೇರಿಸಿದ ದಿನಗಳು:',
      'Days after sowing' : 'ಸೇರಿಸಿದ ದಿನಗಳು',
      'Add Crops': 'ಕ್ರಾಪ್ಸ್ ಸೇರಿಸಿ',
      'days': 'ದಿನಗಳು',
      'Change days after sowing': 'ಸೇರಿಸಿದ ದಿನಗಳನ್ನು ಬದಲಾಯಿಸಿ',
      'Show more': 'ಹೆಚ್ಚು ತೋರಿಸಿ',
      // COTTON Advisory
       'Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.':'ಮುಖ್ಯವಾದರೆ ಸೇರಿಸಿದ ಮೊದಲ ದಿನಗಳಲ್ಲಿ ಸೀಡ್ಲಿಂಗ್ಗಳ ಮುಖ್ಯವಾದರೆ ಸೇರಿಸಿದ ಮೊದಲ ದಿನಗಳಲ್ಲಿ ಸೀಡ್ಲಿಂಗ್ಗಳ ಮುಖ್ಯವಾದರೆ ಸೇರಿಸಿದ ಮೊದಲ ದಿನಗಳಲ್ಲಿ ಸೀಡ್ಲಿಂಗ್ಗಳ ಮುಖ್ಯವಾದರೆ ಸೇರಿಸಿದ ಮೊದಲ ದಿನಗಳಲ್ಲಿ ಸೀಡ್ಲಿಂಗ್ಗಳ ಮುಖ್ಯವಾದರೆ ಸೇರಿಸಿದ ಮೊದಲ ದಿನಗಳಲ್ಲಿ ಸೀಡ್ಲಿಂಗ್ಗಳ ಮುಖ್ಯವಾದರೆ ಸೇರಿಸಿದ ಮೊದಲ ದಿನಗಳಲ್ಲಿ ಸೀಡ್ಲಿಂಗ್ಗಳ ಮುಖ',
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.':'ರೋಗಿತ ಸೀಡ್ಲಿಂಗ್ಗಳ ಮೇಲೆ ವಾಟರ್ ಮಾಡಿ 2 ಜಿ / ಲಿಟರ್ ತಿರಾಮ್ ಡ್ರೆಂಚ್ ಮಾಡಿ.',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.':'ಲೈಟ್ / ರೆಡ್ / ಸ್ಯಾಂಡಿ ಲೂಮ್ ಸ್ಥಳಗಳಲ್ಲಿ 5 ಸಿ.ಎಂ. ಗಾಲಿನಲ್ಲಿ ನಿರ್ಧಾರಿತ ಜಾಲನೆ.',
       'Adopt Alternatively Alternate Furrow Irrigation (AAFI) in heavy soils (Vertisols), which saves time, labour, irrigation water (to the extent of 30%) and minimizes the long term ill effects of irrigation on soil properties. Drip irrigation can be a viable option under constraints of irrigation water in zone 3 and 8 for hybrid cotton cultivation. Scheduled irrigation at 6 cm depth in black soils.':'ಭಾರೀ ಮಣ್ಣಿನಲ್ಲಿ (ವರ್ಟಿಸೋಲ್ಸ್) ಪರ್ಯಾಯವಾಗಿ ಪರ್ಯಾಯ ಫರ್ರೋ ನೀರಾವರಿ (ಎಎಎಫ್‌ಐ) ಅನ್ನು ಅಳವಡಿಸಿಕೊಳ್ಳಿ, ಇದು ಸಮಯ, ಶ್ರಮ, ನೀರಾವರಿ ನೀರನ್ನು (30% ವರೆಗೆ) ಉಳಿಸುತ್ತದೆ ಮತ್ತು ಮಣ್ಣಿನ ಗುಣಲಕ್ಷಣಗಳ ಮೇಲೆ ನೀರಾವರಿಯ ದೀರ್ಘಾವಧಿಯ ದುಷ್ಪರಿಣಾಮಗಳನ್ನು ಕಡಿಮೆ ಮಾಡುತ್ತದೆ. ಹೈಬ್ರಿಡ್ ಹತ್ತಿ ಕೃಷಿಗಾಗಿ 3 ಮತ್ತು 8 ನೇ ವಲಯದಲ್ಲಿ ನೀರಾವರಿ ನೀರಿನ ನಿರ್ಬಂಧಗಳ ಅಡಿಯಲ್ಲಿ ಹನಿ ನೀರಾವರಿಯು ಒಂದು ಕಾರ್ಯಸಾಧ್ಯವಾದ ಆಯ್ಕೆಯಾಗಿದೆ. ಕಪ್ಪು ಮಣ್ಣಿನಲ್ಲಿ 6 ಸೆಂ.ಮೀ ಆಳದಲ್ಲಿ ನಿಗದಿತ ನೀರಾವರಿ.',
      'chanceofdisease:Bacterial blight':'ಬ್ಯಾಕ್ಟೆರಿಯಲ್ ಬ್ಲೈಟ್',
      'Water soaked angular leaf spots appear on the leaves, later spread to the veins and vein lets.':'ನೀರಿನಿಂದ ನೆನೆಸಿದ ಕೋನೀಯ ಎಲೆಗಳ ಕಲೆಗಳು ಎಲೆಗಳ ಮೇಲೆ ಕಾಣಿಸಿಕೊಳ್ಳುತ್ತವೆ, ನಂತರ ರಕ್ತನಾಳಗಳು ಮತ್ತು ರಕ್ತನಾಳಗಳಿಗೆ ಹರಡುತ್ತವೆ.',
      'Foliar sprays of Streptocycline Sulphate @ 0.5 gm/litre and Copper-Oxychlode @ 3 g / litre of water as and when symptoms seen.':'ಸ್ಟ್ರೆಪ್ಟೋಸೈಕ್ಲಿನ್ ಸಲ್ಫೇಟ್ @ 0.5 ಗ್ರಾಂ/ಲೀಟರ್ ಮತ್ತು ಕಾಪರ್-ಆಕ್ಸಿಕ್ಲೋಡ್ @ 3 ಗ್ರಾಂ/ಲೀಟರ್ ನೀರಿಗೆ ರೋಗಲಕ್ಷಣಗಳು ಕಂಡುಬಂದಾಗ ಎಲೆಗಳ ಮೇಲೆ ಸಿಂಪಡಿಸಿ.'

    },
    // hindi translation
    'hi_IN':{
      'hello':"नमस्ते",
      'Login':"लॉग इन करें",
      'Weather Info':"मौसम की जानकारी",
      'Settings':"सेटिंग्स",
      'Select Language':"भाषा चुनें",
      'English':"अंग्रेज़ी",
      'Hindi':"हिंदी",
      'Kannada':"ಕನ್ನಡ",
      'My Profile':"मेरी प्रोफ़ाइल",
      'Add Field':"फ़ील्ड जोड़ें",
      'FAQs':"पूछे जाने वाले प्रश्न",
      'About Us':"हमारे बारे में",
      'Log Out':"लॉग आउट",
      // all_home_page.dart
      'Kisaan Margadarshak':'किसान मार्गदर्शक',
      'A Smart App':'एक स्मार्ट ऐप',
      'Crop Choice':'फसल विकल्प',
      'Your Dashboard':'आपका डैशबोर्ड',
      'Crop Health':'फसल स्वास्थ्य',
      'Weed Management':'बीज का प्रबंधन',
      'Market Choice':'मार्केट विकल्प',
      'Pest Management':'पेस्ट मैनेजमेंट',
      // pest management
      'Detect Disease':'बीमारी का पता लगाएं',
      'Your Crops':'आपके फसल',
      'Select a crop so that we can help you':'आपकी मदद करने के लिए एक फसल चुनें',
      // detect disease
      'Select Your Crop':'अपना फसल चुनें',
      'Select a crop to detect disease':'बीमारी का पता लगाने के लिए एक फसल चुनें',
      'Cotton':'कपड़ा',
      'Banana':'केला',
      'Sugarcane':'चीनी',
      'Tomato':'टमाटर',
      'Wheat':'गेहूँ',
      'Potato':'आलू',
      'Confirm':'पुष्टि करें',
      'Selected crops':'चयनित फसल',
      'Ok':'ठीक है',
      // disease detection
      'Disease Detector':'बीमारी का पता लगाने वाला',
      'Selected Crop':'चयनित फसल',
      'Enter day after sowing':'बोटने के बाद दिन दर्ज करें',
      'Tap on the below icon to take a picture':'चित्र लेने के लिए नीचे दिए गए आइकन पर टैप करें',
      'Tap To Upload':'अपलोड करने के लिए टैप करें',
      'Please enter day after sowing before uploading image':'चित्र अपलोड करने से पहले बोटने के बाद दिन दर्ज करें',
      'Error': 'त्रुटि',
      'Disease': 'बीमारी',
      // Advisory
      'Crop Advisory':'फसल सलाहकार',
      'Advisory':'सलाहकार',
      'Days after sowing:':'बोटने के बाद दिन:',
      'Days after sowing':'बोटने के बाद दिन',
      'Add Crops':'फसल जोड़ें',
      'days':'दिन',
      'Change days after sowing':'बोटने के बाद दिन बदलें',
      'Show more':'और दिखाएं',
      // COTTON Advisory
       'Decay of the seedlings before emergence, girdling of the seedling stems and root rot.Sometimes mustard like seeds appear on the roots.':'उत्पन्न होने से पहले बीज की बच्चों की अवस्था की तरह, बीज की बच्चों के रस्सों और जड़ की रोट। कभी-कभी जड़ के जड़ों पर मसाला जैसे बीज दिखाई देते हैं।',
      'Drenching of Thiram @ 2 g/litre of water around the diseased seedlings.':'बीमारी की बीज की बच्चों के चारों ओर थीरम @ 2 ग्राम / लीटर पानी का ड्रेंचिंग।',
      'Scheduled irrigation at 5 cm depth in light/red/sandy loam soils.': 'प्रकाश / लाल / रेती लूम भूमि में 5 सेंटीमीटर गहराई में अनुसूचित जल देना।',
       'Adopt Alternatively Alternate Furrow Irrigation (AAFI) in heavy soils (Vertisols), which saves time, labour, irrigation water (to the extent of 30%) and minimizes the long term ill effects of irrigation on soil properties. Drip irrigation can be a viable option under constraints of irrigation water in zone 3 and 8 for hybrid cotton cultivation. Scheduled irrigation at 6 cm depth in black soils.':'भारी भूमि (वर्टिसोल्स) में वैकल्पिक फरो जलवायु (AAFI) का लाभ उठाएं, जो समय, कामगार, जलवायु जल (अधिकतम 30%) को बचाता है और जलवायु के लंबवत असाधारण प्रभावों को न्यूनतम करता है। जलवायु की सीमाओं के अनुभव के लिए ज़ोन 3 और 8 के लिए हाइब्रिड कपड़े की उगाने के लिए ड्रिप जलवायु एक वैयक्तिक विकल्प हो सकता है। भूरे भूमि में 6 सेंटीमीटर गहराई में अनुसूचित जल देना।',
      'chanceofdisease:Bacterial blight':'बीमारी की संभावना: बैक्टीरियल ब्लाइट',
      'Water soaked angular leaf spots appear on the leaves, later spread to the veins and vein lets.':'पत्ते पर पानी की तरह गोली लगती है, बाद में वैन और वैन लेट्स पर फैलती है।',
      'Foliar sprays of Streptocycline Sulphate @ 0.5 gm/litre and Copper-Oxychlode @ 3 g / litre of water as and when symptoms seen.':'जब लक्षण दिखाई देते हैं, फोलियर स्प्रे Streptocycline Sulphate @ 0.5 gm / लीटर और Copper-Oxychlode @ 3 g / लीटर पानी के रूप में।',
    }
  };
}