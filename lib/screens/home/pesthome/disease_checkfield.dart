import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../utils/api.dart';
import '../../profile/all_fields.dart';

class DiseaseCheckField extends StatefulWidget {
  const DiseaseCheckField({super.key});

  @override
  State<DiseaseCheckField> createState() => _DiseaseCheckFieldState();
}

class _DiseaseCheckFieldState extends State<DiseaseCheckField> {
  Future <List<Map>> getfields() async {
  List<Map> fields = [];
    const storage = FlutterSecureStorage();
    final jwt = await storage.read(key: 'jwt');
    var response =
        await http.get(Uri.parse('${APILoad.api}/api/getfields/'), headers: {
      'jwt': jwt!,
    });
    var data = json.decode(response.body);
    // print(data);
    for (var i in data) {
      fields.add(i);
    }
    setState(() {});
    return fields;
  }
  late Future<List<Map>> _fields;

  @override
  void initState() {
    _fields = getfields();
    print(_fields);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: // make background transparent
        AppBar(
      // back button color
      iconTheme: const IconThemeData(color: Colors.black),
      //increase the height of the appbar
      toolbarHeight: 110,
      // give border color to the appbar
      backgroundColor: Colors.transparent,
      elevation: 0,
      // center title
      centerTitle: true,
      // caption below title

      title: Column(children:  [
        SizedBox(
          height: 10,
        ),
        Text(
          'Select Your Field'.tr,
          style: TextStyle(color: Colors.green, fontSize: 20),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          'Select a field to detect disease'.tr,
          style: TextStyle(color: Colors.black54, fontSize: 13),
        ),
      ]),
    ),
    // if the user has not selected any crop then show the below body. Else show the selected crops
    // body: PestManagement.diseaseselectedcrop.length == 0
    //     ? const CropChoiceBody()
    //     : const SelectedCropBody());


    body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        child: Column(children: [
          FutureBuilder(
            future: _fields,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return 
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return 
                        FieldCard(fieldname: snapshot.data[index]['field_name'], cropname: snapshot.data[index]['crop_name'], days: snapshot.data[index]['cur_day'], area: snapshot.data[index]['area'],ontap: 1); 
                      },
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    );
              }}),
        ]) ,
      ) ,
    ),
    );
  }
}