import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:getmancar_ui/screens/home/components/show_lang_dialog.dart';
import 'package:getmancar_ui/style/colors_style.dart';
import 'package:latlong2/latlong.dart';

import 'components/marker_position.dart';
import 'components/reg_log_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool drawerCanOpen = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _builDrawer(),
        body: Stack(
          children: [
            _buildMap(),
            _buildMenuIcon(),
            _buildMenuSupport(),
            _buildSpecMenu(),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 165.0,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 23.0,
                    right: 16.0,
                  ),
                  child: Column(
                    children: [
                      RegLogButton(
                        backgroundColor: const Color(0xffFF9B55),
                        title: "I'm new here",
                        subTitle: 'REGISTER',
                        textColor: Colors.white,
                        onTap: _showLanguagesDialog,
                      ),
                      const SizedBox(height: 8.0),
                      RegLogButton(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        alignmentLeft: false,
                        alignmentLeftColumn: false,
                        title: "I have GETMANCAR account ",
                        subTitle: 'LOG IN',
                        textColor: const Color(0xff333333),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showLanguagesDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return ShowLangDialog();
        });
  }

  Container _builDrawer() {
    return Container(
      width: 250.0,
      color: Colors.white,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100.0,
                  child: DrawerHeader(
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Image.asset('assets/images/logo.png')),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: BrandColor.primaryColor,
                  ),
                  title: Text(
                    'Contacts',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  horizontalTitleGap: 1.0,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.video_call,
                    color: BrandColor.primaryColor,
                  ),
                  title: Text(
                    'Videos',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  horizontalTitleGap: 1.0,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 50.0),
              child: TextButton.icon(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.logout, color: BrandColor.primaryColor),
                  label: const Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildSpecMenu() {
    return Positioned(
      top: 104.0,
      right: 20.0,
      child: Container(
        width: 32.0,
        height: 32.0,
        decoration: BoxDecoration(
            color: const Color(0xffFAFAFA),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 6.0,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CustomDot(),
            SizedBox(width: 2.0),
            CustomDot(),
            SizedBox(width: 2.0),
            CustomDot(),
          ],
        ),
      ),
    );
  }

  Positioned _buildMenuSupport() {
    return Positioned(
        top: 40.0,
        right: 16.0,
        child: CustomIconButton(
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/ic_headphones.png',
                fit: BoxFit.fill,
              ),
            ),
            onTap: () {
              print('icon support onTap');
            }));
  }

  Positioned _buildMenuIcon() {
    return Positioned(
        top: 40.0,
        left: 23.0,
        child: CustomIconButton(
          onTap: () {
            print('Menu icon onTap');
            if (drawerCanOpen) {
              _scaffoldKey.currentState!.openDrawer();
            } else {
              resetApp();
            }
          },
          icon: Icons.menu,
        ));
  }

  resetApp() {
    setState(() {
      drawerCanOpen = true;
    });
  }

  FlutterMap _buildMap() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(50.450001, 30.523333),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return const Text("© OpenStreetMap contributors");
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(50.450001, 30.523333),
              builder: (ctx) => Container(
                child: const MarkerPosition(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomDot extends StatelessWidget {
  const CustomDot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0,
      width: 4.0,
      decoration: const BoxDecoration(
        color: Color(0xff555555),
        shape: BoxShape.circle,
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.icon,
    required this.onTap,
    this.widget,
  }) : super(key: key);

  final IconData? icon;
  final VoidCallback onTap;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
            color: BrandColor.primaryColor,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 6.0,
              )
            ]),
        child: widget ??
            Icon(
              icon,
              color: Colors.white,
              size: 24.0,
            ),
      ),
    );
  }
}
