import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../utils/api.dart';
import 'package:get/get.dart';
class EachAdvisory extends StatefulWidget {
  // create a variable to store the argument passed from the previous page.

  final String cropName;
  final String dasInAdvisory;
  const EachAdvisory(
      {super.key, required this.cropName, required this.dasInAdvisory});

  @override
  State<EachAdvisory> createState() => _EachAdvisoryState();
}

class _EachAdvisoryState extends State<EachAdvisory> {
  List<BoxShadow> shadowList = [
    BoxShadow(
        color: Color.fromARGB(255, 190, 190, 190),
        blurRadius: 30,
        offset: Offset(0, 10))
  ];
  List<String> Cropadvisory = [];
  void initState() {
    if (widget.cropName == 'Cotton') {
      for (var i = 0;
          i < CottonAdvisory.fulladvisory[widget.dasInAdvisory]!.length;
          i++) {
        // add each string to Cropadvisory list
        Cropadvisory.add(CottonAdvisory.fulladvisory[widget.dasInAdvisory]![i]);
      }
    }
    print(Cropadvisory);
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
                      title: Text('${widget.cropName.tr} ${'Advisory'.tr}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          )),
                      background: Image.asset(
                        'assets/crophealth/cotton/cottonDay${widget.dasInAdvisory}.jpg',
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
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    '${widget.dasInAdvisory} ${'Days after sowing'.tr}',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
                // use listview.builder to display the list of strings in Cropadvisory
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Cropadvisory.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: shadowList),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6,left: 5),
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  Cropadvisory[index].tr,
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),
                                ),
                              )
                            ],
                        )
                      );
                    })
              ]),
            )));
  }
}
