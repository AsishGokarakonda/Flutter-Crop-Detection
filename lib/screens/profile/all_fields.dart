import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:crop_recommend/utils/api.dart';
class AllFields extends StatefulWidget {
  const AllFields({super.key});

  @override
  State<AllFields> createState() => _AllFieldsState();
}





class _AllFieldsState extends State<AllFields> {

  List<Map> fields = [];
  void getfields() async {
    const storage = FlutterSecureStorage();
    final jwt = await storage.read(key: 'jwt');
    var response = await http.get(
      Uri.parse('${APILoad.api}/api/getfields/'), headers: {
        'jwt': jwt!,
      });
    var data = json.decode(response.body);
    // print(data);
    for (var i in data) {
      fields.add(i);
    }
    setState(() {});
    print(fields);
  }
  @override
void initState() {
  getfields();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black54,
                  elevation: 0,
                  expandedHeight: 300.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      // keep title at top
                      title: Text('Your Fields',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          )),
                        background: Image.asset(
                        'assets/profile/fields.jpg',
                        colorBlendMode: BlendMode.darken,
                        color: Colors.black.withOpacity(0.25),
                        fit: BoxFit.cover,
                      )
                      ),
                ),
              ];
            },
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                ListView.builder(itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      title: Text(fields[index]['field_name']),
                      subtitle: Text(fields[index]['area'].toString()),
                    ),
                  );
                },
                itemCount: fields.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, '/AllFields');
                }, child: 
                               Text(
                'Add Fields',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
                )
              ],
              )
            )
          )
      );
  }
}