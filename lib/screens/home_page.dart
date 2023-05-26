// import 'package:api_with_provider/widgets/components/carousel.dart';
import 'package:api_with_provider/datas/featureCard.dart';
import 'package:api_with_provider/utils/string_extensions.dart';
import 'package:api_with_provider/widgets/sagarui/features.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/text_utils.dart';
import '../widgets/components/carousel/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var ww = media.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.indigo,
                    )),
                Text("HA License Preparation",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                        fontFamily: 'Sofia')),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.indigo,
                        ))
                  ],
                )
              ],
            ),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(TextUtils.greeting(),
                                style: TextStyle(
                                    fontFamily: "Quando",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text(snapshot.data!['name'].toString().capitalize(),
                                // user.displayName!.capitalize(),
                                style: TextStyle(
                                  fontFamily: "sofia",
                                  fontSize: 20,
                                ))
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const FloatingButtonDemo()));
                          },
                          child: CircleAvatar(
                            radius: 30,
                            child: CircleAvatar(
                              // backgroundColor: ColorUtils.dblue,
                              backgroundColor: Colors.transparent,
                              radius: 28,
                              // backgroundImage:
                              //    const  AssetImage("assets/images/person.jpg"),
                              child: Center(
                                child: Text(TextUtils.getFirstWords(
                                    snapshot.data!['name'])),
                              ),
                            ),
                          ),
                        )
                      ]);
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
          Expanded(flex: 3, child: Carousel()),
          Expanded(
            flex: 7,
            child: Row(children: [
              Expanded(
                child: Container(
                    // color: Colors.indigo,
                    ),
              ),
              Expanded(
                  flex: 30,
                  child: Container(
                      width: ww * 1,
                      // color: Colors.yellow,
                      child: ListView(
                        children: [
                          Wrap(
                            children: List.generate(
                                feature.length,
                                (index) => FeatureCard(
                                      image: feature[index]['image'],
                                      name: feature[index]['name'],
                                      pageName: feature[index]['pageName'],
                                    )),
                          )
                        ],
                      ))),
              Expanded(
                child: Container(
                    // color: Colors.green,
                    ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
