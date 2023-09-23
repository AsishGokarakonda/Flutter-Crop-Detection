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

  @override
  void initState() {
    // getfields();
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
                      )),
                ),
              ];
            },
            body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    FutureBuilder(
            future: getfields(),
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
                        FieldCard(fieldname: snapshot.data[index]['field_name'], cropname: snapshot.data[index]['crop_name'], days: snapshot.data[index]['cur_day'], area: snapshot.data[index]['area'],); 
                      },
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    );
              }}),
                    SizedBox(
                      height: 20,
                    ),
                    
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/addfield');
                      },
                      child: Text(
                        'Add Fields',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.3 ,
                               vertical: 15),
                          backgroundColor: Colors.green,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ))));
  }
}

class FieldCard extends StatelessWidget {
  const FieldCard({
    super.key,
    this.fieldname,
    this.cropname,
    this.days,
    this.area,
  });
  final fieldname;
  final cropname;
  final days;
  final area;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(
            'assets/fields/$cropname.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.darken),
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        margin: const EdgeInsets.all(10),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end ,
              children: [
              Text(
                'Day: ${days.toString()}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            Row(
              // keep this row in left and bottom
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end ,
            children: [
            Column(
                // keep this column in left and bottom
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    cropname,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    fieldname,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                Text(
                  '${area} Acres',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15 ,
                      fontWeight: FontWeight.bold),
                )
          ]),
          ]
        )
      ),
    );
  }
}
