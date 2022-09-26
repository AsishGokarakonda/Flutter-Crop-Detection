// import 'package:flutter/material.dart';

// class GetTextField extends StatelessWidget {
//   const GetTextField({
//     Key? key,
//     required this.icon,
//     required this.hint,
//     this.inputType,
//     this.inputAction,
//   }) : super(key: key);

//   final IconData icon;
//   final String hint;
//   final TextInputType? inputType;
//   final TextInputAction? inputAction;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10.0),
//               child: Container(
//                 height: 60.0,
//                 width: MediaQuery.of(context).size.width * 0.85,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[500]?.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Center(
//                   child: TextFormField(
//                     cursorColor: Colors.white54,
//                     style: const TextStyle(color: Colors.white,height: 1.4),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintStyle: const TextStyle(color: Colors.white),
//                       prefixIcon: Icon(
//                         icon,
//                         color: Colors.white,
//                       ),
//                       hintText: hint,
//                     ),
//                     keyboardType: inputType,
//                     textInputAction: inputAction,
//                     onSaved:  
//                     // save values according to the input type
//                     (value) {
//                       if (inputType == TextInputType.name) {
//                         // save value to static variable in signup_page.dart
                        
//                       } else if (inputType == TextInputType.emailAddress) {
//                         // save email
//                       } else if (inputType == TextInputType.visiblePassword) {
//                         // save password
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             );
//   }
// }