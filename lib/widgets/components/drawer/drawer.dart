import 'package:api_with_provider/screens/extras/about_us.dart';
import 'package:api_with_provider/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:launch_review/launch_review.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_update.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // margin: EdgeInsets.zero,
            decoration: const BoxDecoration(color: Colors.indigo),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 75.0,
                    height: 75.0,
                    decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('assets/images/ic_launcher.png'))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 3.0),
                        child: const Text(
                          'Ha License',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                              fontFamily: 'Quando'),
                        ),
                      ),
                      const Text(
                        'HA License Preparation',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: 'Quando'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text(" Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              LineAwesomeIcons.link,
            ),
            title: const Text("Privacy Policy"),
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: const Text("Share"),
            onTap: () {
              Share.share(
                  " Download app by copying this link https://play.google.com/store/apps/details?id=com.rangin.hapreparation");
            },
          ),
          ListTile(
            onTap: () {
              // _showInterstitialAd();
              checkForUpdate();
              isUpdateAvailable().then((value) {
                if (!value) {
                  Fluttertoast.showToast(
                    msg: 'No updates available',
                  );
                } else {
                  startImmediateUpdate();
                }
              });
            },
            leading: const Icon(LineAwesomeIcons.upload),
            title: const Text("Check for Updates"),
          ),
          ListTile(
            onTap: () {
              LaunchReview.launch(androidAppId: "com.rangin.haprepartaion");
            },
            leading: const Icon(
              LineAwesomeIcons.star_struck_1,
            ),
            title: const Text("Rate Us"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutusPage()));
            },
            leading: const Icon(
              Icons.info_outline,
              color: Colors.indigo,
            ),
            title: const Text("About Us"),
          ),
          ListTile(
            onTap: () {
              // write latest code
              launchUrl(Uri.parse(
                  "https://play.google.com/store/apps/developer?id=Rangin+Apps"));
            },
            leading: const Icon(
              LineAwesomeIcons.plus_circle,
              color: Colors.indigo,
            ),
            title: const Text(" More Apps "),
          ),
          ListTile(
            onTap: () {
              AuthServices().signOut();
            },
            title: Text("Sign Out"),
            leading: Icon(
              LineAwesomeIcons.alternate_sign_out,
              color: Colors.indigo,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          )
        ],
      ),
    );
  }
}
