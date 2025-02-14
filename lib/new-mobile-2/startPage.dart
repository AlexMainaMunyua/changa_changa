// ignore_for_file: file_names

import 'package:changa_changa/new-mobile-2/create-campaign.dart';
import 'package:changa_changa/new-mobile-2/joinchannel.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String? _username;
  String? _title;

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<String?> getUserTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('title');
  }

  Future<String?> getSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('full_name');
  }

  Future<void> _loaduserData() async {
    final savedUsername = await getSavedUsername();
    final accessToken = await getAccessToken();
    final userTitle = await getUserTitle();
    if (savedUsername != null) {
      setState(() {
        _username = savedUsername;
      });
    }
    if (accessToken != null) {
      setState(() {});
    }
    if (userTitle != null) {
      setState(() {
        _title = userTitle;
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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(

            // iphone11promax179p5 (2935:11875)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group1171274828yYD (2935:11925)
                  width: double.infinity,
                  height: height,
                  child: Stack(
                    children: [
                      Positioned(
                        // frame2pHw (2935:11927)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 15 * fem),
                          width: 414 * fem,
                          height: 800 * fem,
                          decoration: const BoxDecoration(
                            color: Color(0xff00313d),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // frame1571dmB (2935:11928)
                                margin: EdgeInsets.fromLTRB(
                                    35 * fem, 65 * fem, 18 * fem, 0 * fem),
                                width: double.infinity,
                                height: 20 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogrouprhx5th7 (WNzAvJkjfsM9o16auJrHx5)
                                      padding: EdgeInsets.fromLTRB(
                                          2 * fem, 2 * fem, 0 * fem, 2 * fem),
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            // welcomemrjoekingsleyp4y (2935:11934)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 0 * fem),
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 18 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height:
                                                      0.8888888889 * ffem / fem,
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: 'Welcome $_title.',
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 18 * ffem,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      height: 0.8888888889 *
                                                          ffem /
                                                          fem,
                                                      color: const Color(
                                                          0xffffffff),
                                                    ),
                                                  ),
                                                  const TextSpan(
                                                    text: ' ',
                                                  ),
                                                  TextSpan(
                                                    text: _username == null
                                                        ? "Username"
                                                        : _username![0]
                                                                .toUpperCase() +
                                                            _username!
                                                                .substring(1)
                                                                .toLowerCase(),
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 18 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 0.8888888889 *
                                                          ffem /
                                                          fem,
                                                      color: const Color(
                                                          0xffffffff),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   // group93i3s (2935:11935)
                                          //   width: 19.07 * fem,
                                          //   height: 2.77 * fem,
                                          //   child: Image.asset(
                                          //     'assets/new-mobile-2/images/group-93-rwB.png',
                                          //     width: 19.07 * fem,
                                          //     height: 2.77 * fem,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle5dRj (2935:11939)
                        left: 0 * fem,
                        top: 111 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 414 * fem,
                            height: 785 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // frame310ixy (2935:11953)
                        left: 15 * fem,
                        top: 500 * fem,
                        child: SizedBox(
                          width: 384 * fem,
                         // height: 225 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // frame313qXo (2935:11954)
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.fromLTRB(
                                    26 * fem, 0 * fem, 35 * fem, 24 * fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      // createorjoincampaignye1 (2935:11956)
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(10 * fem,
                                            0 * fem, 0 * fem, 8 * fem),
                                        child: Text(
                                          'Create or Join Campaign',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 24 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1 * ffem / fem,
                                            color: const Color(0xff00313d),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      // acampaignisanaccountsetuptorec (2935:11957)
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 312 * fem,
                                        ),
                                        child: Text(
                                          'A campaign is an account set up to \nreceive payments related to a particular course',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5714285714 * ffem / fem,
                                            color: const Color(0xff4f4f4f),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // buttonYqX (2935:11959)
                                // margin: EdgeInsets.fromLTRB(
                                //     0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateCampaign(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    // padding: EdgeInsets.fromLTRB(121 * fem,
                                    //     12 * fem, 121 * fem, 12 * fem),
                                    width: double.infinity,
                                    height: 48 * fem,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff71ae00),
                                      borderRadius:
                                          BorderRadius.circular(50 * fem),
                                    ),
                                    child: SizedBox(
                                      // autogroup6vvfpo3 (WNzBCJJ69yUDiGbE9n6vVF)
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Center(
                                        child: Center(
                                          child: Text(
                                            'Create Campaign',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 17 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.4117647059 * ffem / fem,
                                              color: const Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 10,),

                              Container(
                                child: TextButton(
                                  // button7n9 (2935:11960)
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const JoinChannel(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        130 * fem, 0 * fem, 130 * fem, 0 * fem),
                                    width: double.infinity,
                                    height: 48 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(50 * fem),
                                    ),
                                    child: SizedBox(
                                      // autogroupu3pmdkV (WNzBKDGEi4XsxY3omwU3pm)
                                    //  width: double.infinity,
                                     // height: double.infinity,
                                      child: Center(
                                        child: Center(
                                          child: Text(
                                            'Join Campaign',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 17 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.4117647059 * ffem / fem,
                                              color: const Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // group1171274790Leu (2935:12228)
                        left: 93 * fem,
                        top: 289 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 229 * fem,
                            height: 123.51 * fem,
                            child: Opacity(
                              opacity: 0.9,
                              child: Image.asset(
                                'assets/new-mobile-2/images/group-1171274790.png',
                                width: 229 * fem,
                                height: 123.51 * fem,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
