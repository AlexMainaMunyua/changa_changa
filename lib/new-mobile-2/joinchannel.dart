// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/join_channel.dart';
import 'package:changa_changa/new-mobile-2/preview.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoinChannel extends StatefulWidget {
  const JoinChannel({super.key});

  @override
  State<JoinChannel> createState() => _JoinChannelState();
}

class _JoinChannelState extends State<JoinChannel> {
  String? _accessToken;
  String _errorTextValue = '';
  String _textInput = '';
  bool _isLoading = false;
  final _textControllerId = TextEditingController();
  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<void> _loadAccessToken() async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      setState(() {
        _accessToken = accessToken;
      });
    }
  }

  @override
  void dispose() {
    _textControllerId.dispose();
    super.dispose();
  }

  void _validateInput() {
    final input = _textControllerId.text;
    setState(() {
      if (input.isEmpty) {
        _errorTextValue = 'The id field is required';
        return;
      } else {
        _textInput = input;
        _errorTextValue = '';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAccessToken();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            // iphone11promax169iR (2935:11442)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group1171274828weH (2935:11728)
                  width: double.infinity,
                  height: 896 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // frame3Njb (2935:12446)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 15 * fem),
                          width: 414 * fem,
                          height: 102.27 * fem,
                          decoration: const BoxDecoration(
                            color: Color(0xff00313d),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // frame1572aqf (2935:12458)
                                margin: EdgeInsets.fromLTRB(
                                    26.5 * fem, 65 * fem, 26.5 * fem, 0 * fem),
                                width: double.infinity,
                                height: 20 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        // navbaru7F (2935:12459)
                                        width: 20.08 * fem,
                                        height: 20 * fem,
                                        child: Image.asset(
                                          'assets/new-mobile-2/images/nav-bar-gpZ.png',
                                          width: 20.08 * fem,
                                          height: 20 * fem,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // autogroupypgvRLV (WNzdMP3ap53tXuvkrGYPgV)
                                      padding: EdgeInsets.fromLTRB(97.43 * fem,
                                          2 * fem, 0 * fem, 2 * fem),
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // joincampaignwpd (2935:12464)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 97.43 * fem, 0 * fem),
                                            child: Text(
                                              'Join Campaign',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 18 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    0.8888888889 * ffem / fem,
                                                color: const Color(0xffffffff),
                                              ),
                                            ),
                                          ),
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
                        // rectangle5Z5K (2935:11742)
                        left: 0 * fem,
                        top: 111.1662597656 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 414 * fem,
                            height: 784.83 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // frame15684nm (2935:11743)
                        left: 15 * fem,
                        top: 303 * fem,
                        child: SizedBox(
                          width: 394 * fem,
                          // height: 150 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // frame312yuj (2935:12481)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                width: double.infinity,
                              //  color: Colors.pink,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // mediumlabelsemibold14pxWem (2935:12482)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                      child: Text(
                                        'Invite code',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5714285714 * ffem / fem,
                                          letterSpacing: 0.07 * fem,
                                          color: const Color(0xff00313d),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // frame1oNy (2935:12483)
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10 * fem),
                                        border: Border.all(
                                            color: const Color(0xffc4c4c4)),
                                      ),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              if (value.contains(' ')) {
                                                _errorTextValue =
                                                    'Don\'t use blank spaces';
                                              } else {
                                                _errorTextValue = '';
                                              }
                                            },
                                          );
                                        },
                                        controller: _textControllerId,
                                        decoration: InputDecoration(
                                          errorText: _errorTextValue.isEmpty
                                              ? null
                                              : _errorTextValue,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              15 * fem,
                                              14 * fem,
                                              15 * fem,
                                              14 * fem),
                                          hintText: 'Paste code here',
                                          hintStyle: const TextStyle(
                                              color: Color(0xff78828a)),
                                        ),
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.6666666667 * ffem / fem,
                                          letterSpacing: 0.06 * fem,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                // group1171274967TCd (2955:13993)
                                width: double.infinity,
                                height: 48 * fem,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(100 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // frame1171274967ywf (2955:13994)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 8 * fem, 0 * fem),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: SizedBox(
                                          width: 48 * fem,
                                          height: 48 * fem,
                                          child: Image.asset(
                                            'assets/new-mobile-2/images/frame-1171274967-ek1.png',
                                            width: 48 * fem,
                                            height: 48 * fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      // frame1171274968GQy (2955:13996)
                                      onPressed: () async {
                                        _validateInput();
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        try {
                                          ChannelModel chanData =
                                              await fetchChannelModel(
                                                  _textInput, _accessToken!);

                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PreviewChannel(
                                                chanelData: chanData.channel!,
                                                loadFrom: 'join',
                                                inviteCode: _textInput,
                                              ),
                                            ),
                                          );
                                          setState(() {
                                            _isLoading = false;
                                          });
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
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(100 * fem,
                                            12 * fem, 100 * fem, 12 * fem),
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(0xff71ae00),
                                          borderRadius:
                                              BorderRadius.circular(100 * fem),
                                        ),
                                        child: _isLoading
                                            ? Center(
                                                child: LoadingAnimationWidget
                                                    .progressiveDots(
                                                        color: const Color(
                                                            0xffffffff),
                                                        size: 20),
                                              )
                                            : Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    // viewdetailsmsX (2955:13997)
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0 * fem,
                                                              0 * fem,
                                                              7 * fem,
                                                              0 * fem),
                                                      child: Text(
                                                        'View Details',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: SafeGoogleFont(
                                                          'Inter',
                                                          fontSize: 16 * ffem,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height:
                                                              1.5 * ffem / fem,
                                                          color: const Color(
                                                              0xffffffff),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    // vector125tD (2955:13998)
                                                    width: 14 * fem,
                                                    height: 14 * fem,
                                                    child: Image.asset(
                                                      'assets/new-mobile-2/images/vector-12-Skq.png',
                                                      width: 14 * fem,
                                                      height: 14 * fem,
                                                    ),
                                                  ),
                                                ],
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
                      Positioned(
                        // group1171274805pau (2935:11747)
                        left: 86 * fem,
                        top: 190 * fem,
                        child: SizedBox(
                          width: 243 * fem,
                          height: 79 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // joincampaignY17 (2935:11748)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 1 * fem, 11 * fem),
                                child: Text(
                                  'Join Campaign',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 22 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3533593091 * ffem / fem,
                                    color: const Color(0xff00313d),
                                  ),
                                ),
                              ),
                              Container(
                                // useyourinvitationcodetojoinand (2935:11749)
                                constraints: BoxConstraints(
                                  maxWidth: 243 * fem,
                                ),
                                child: Text(
                                  'Use your invitation code to join and \nparticipate in this campaign',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3533593587 * ffem / fem,
                                    letterSpacing: 0.14 * fem,
                                    color: const Color(0x99000000),
                                  ),
                                ),
                              ),
                            ],
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
