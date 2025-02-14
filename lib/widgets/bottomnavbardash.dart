// ignore_for_file: must_be_immutable, use_build_context_synchronously, duplicate_ignore

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/ChannelDashboard.dart';
import 'package:changa_changa/new-mobile-2/Participants.dart';
import 'package:changa_changa/new-mobile-2/statements.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBarDash extends StatefulWidget {
  ChannelRead channelReadData;
  BottomNavBarDash({super.key, required this.channelReadData});

  @override
  State<BottomNavBarDash> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarDash> {
  String? _accessToken;
  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<void> _loaduserData() async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      setState(() {
        _accessToken = accessToken;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loaduserData();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      padding: EdgeInsets.fromLTRB(30 * fem, 15 * fem, 30 * fem, 15 * fem),
      width: 414 * fem,
      height: 66.61 * fem,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChannelDashboard(
                      channelData: widget.channelReadData,
                      accessToken: _accessToken!,
                    ),
                  ),
                );
              } catch (e) {
                final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'On Snap!',
                    message: '$e',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.failure,
                  ),
                );

                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
            child: Container(
              // group43ihw (2967:8551)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0.85 * fem, 0 * fem, 0 * fem),
              height: 35.76 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group1171274970LDX (2967:8552)
                    margin: EdgeInsets.fromLTRB(
                        0.4 * fem, 0 * fem, 0 * fem, 6.36 * fem),
                    width: 18.4 * fem,
                    height: 18.4 * fem,
                    child: Image.asset(
                      'assets/new-mobile-2/images/group-1171274970.png',
                      width: 18.4 * fem,
                      height: 18.4 * fem,
                    ),
                  ),
                  Center(
                    // dashboard2MF (2967:8557)
                    child: Text(
                      'Dashboard',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 0.9283592918 * ffem / fem,
                        letterSpacing: -0.2200000262 * fem,
                        color: const Color(0xff494949),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 90 * fem,
          ),
          InkWell(
            onTap: () async {
              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Statements(
                       channelData: widget.channelReadData,
                      // accessToken: _accessToken!,
                    ),
                  ),
                );
              } catch (e) {
                final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'On Snap!',
                    message: '$e',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.failure,
                  ),
                );

                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
            child: Container(
              // group3789P (2967:8558)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0.85 * fem, 0 * fem, 0 * fem),
              height: 35.76 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // vectorSvm (2967:8559)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 4.76 * fem),
                    width: 17 * fem,
                    height: 20 * fem,
                    child: Image.asset(
                      'assets/new-mobile-2/images/vector-qs7.png',
                      width: 17 * fem,
                      height: 20 * fem,
                    ),
                  ),
                  Center(
                    // statementsxPK (2967:8560)
                    child: Text(
                      'Statements',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 0.9283592918 * ffem / fem,
                        letterSpacing: -0.2200000262 * fem,
                        color: const Color(0xff494949),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 90 * fem,
          ),
          InkWell(
            onTap: () async {
              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Participants(
                      channelData: widget.channelReadData,
                      accessToken: _accessToken!,
                    ),
                  ),
                );
              } catch (e) {
                final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'On Snap!',
                    message: '$e',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.failure,
                  ),
                );

                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
            child: SizedBox(
              // group41foX (2967:8561)
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // capa1ELq (2967:8562)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 5.61 * fem),
                    width: 20 * fem,
                    height: 20 * fem,
                    child: Image.asset(
                      'assets/new-mobile-2/images/capa1-7Bf.png',
                      width: 20 * fem,
                      height: 20 * fem,
                    ),
                  ),
                  Center(
                    // participantsLem (2967:8569)
                    child: Text(
                      'Participants',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 0.9283592918 * ffem / fem,
                        letterSpacing: -0.2200000262 * fem,
                        color: const Color(0xff494949),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
