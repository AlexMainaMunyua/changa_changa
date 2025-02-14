// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/auth/reg.dart';
import 'package:changa_changa/new-mobile-2/startPage.dart';
import 'package:changa_changa/widgets/topbarner.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String? _savedPhone;

  Future<String?> getSavedPoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone_number');
  }

  Future<void> _loadPhoneNumber() async {
    final savedPhoneNumber = await getSavedPoneNumber();
    if (savedPhoneNumber != null) {
      setState(() {
        _savedPhone = savedPhoneNumber;
      });
    }
  }

  final _authService = AuthService();
  bool _isLoading = false;
  bool _isVerifyLoading = false;

  // ignore: non_constant_identifier_names
  late final String Otp;
  final TextEditingController _textEditingController = TextEditingController();
  String _errorTextValue = '';
  String _textInput = '';

  void _validateInput() {
    final input = _textEditingController.text;
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
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadPhoneNumber();
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
            // iphone11promax35dey (2990:8626)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // autogroupnyyxjxu (WNzU1ecF9VfyYjpkXMNYyX)
                  width: double.infinity,
                  height: 896 * fem,
                  child: Stack(
                    children: [
                      const TopBarner(),
                      Positioned(
                        // frame296UPK (2990:8653)
                        left: 0 * fem,
                        top: 289 * fem,
                        child: Container(
                          width: 414 * fem,
                          height: 607 * fem,
                          decoration: const BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // frame2969nH (2990:8657)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      15 * fem, 50 * fem, 15 * fem, 50 * fem),
                                  width: 414 * fem,
                                  height: 607 * fem,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  child: SizedBox(
                                    // group1171274990fEq (2990:8758)
                                    width: double.infinity,
                                    height: 387 * fem,
                                    child: Form(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // frame313beH (2990:8759)
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // phonenumberverificationKqB (2990:8761)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      8 * fem),
                                                  child: Text(
                                                    'Phone Number Verification',
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 24 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1 * ffem / fem,
                                                      color: const Color(
                                                          0xff00313d),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // wevesentloginverificationcodet (2990:8762)
                                                  constraints: BoxConstraints(
                                                    maxWidth: 222 * fem,
                                                  ),
                                                  child: Text(
                                                    'We’ve sent login verification code\nto your phone ',
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 14 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.5714285714 *
                                                          ffem /
                                                          fem,
                                                      color: const Color(
                                                          0xff4f4f4f),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // frame314XAZ (2990:8763)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 8 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // mediumlabelsemibold14pxdzH (2990:8764)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      5 * fem),
                                                  child: Text(
                                                    'Phone number',
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 14 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.5714285714 *
                                                          ffem /
                                                          fem,
                                                      letterSpacing: 0.07 * fem,
                                                      color: const Color(
                                                          0xff151940),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // frame1jXX (2990:8765)
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10 * fem),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffc4c4c4)),
                                                    color:
                                                        const Color(0xfffcfcfc),
                                                  ),
                                                  child: TextFormField(
                                                    initialValue: _savedPhone,
                                                    readOnly: true,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              15 * fem,
                                                              14 * fem,
                                                              15 * fem,
                                                              14 * fem),
                                                      hintText:
                                                          '+254 | ${_savedPhone?.substring(3)}',
                                                      hintStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xff78828a)),
                                                    ),
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.6666666667 *
                                                          ffem /
                                                          fem,
                                                      letterSpacing: 0.06 * fem,
                                                      color: const Color(
                                                          0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // didntreceivecoderesendBuK (2990:8768)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 24 * fem),
                                            child: Row(
                                              children: [
                                                RichText(
                                                  textAlign: TextAlign.right,
                                                  text: TextSpan(
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 14 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.5714285714 *
                                                          ffem /
                                                          fem,
                                                      color: const Color(
                                                          0xff4f4f4f),
                                                    ),
                                                    children: const [
                                                      TextSpan(
                                                        text:
                                                            'Didn’t receive code? ',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                _isLoading
                                                    ? Center(
                                                        child: LoadingAnimationWidget
                                                            .progressiveDots(
                                                                color: const Color(
                                                                    0xff71ae00),
                                                                size: 20),
                                                      )
                                                    : InkWell(
                                                        onTap: () async {
                                                          setState(() {
                                                            _isLoading = true;
                                                          });
                                                          try {
                                                            //print(_savedPhone);
                                                            // String complete =
                                                            //     await _authService
                                                            //         .phoneValidation(
                                                            //             _savedPhone!);
                                                            // if (complete ==
                                                            //     "done") {
                                                            //   setState(() {
                                                            //     _isLoading =
                                                            //         false;
                                                            //   });
                                                            // }
                                                          } catch (e) {
                                                            final snackBar =
                                                                SnackBar(
                                                              /// need to set following properties for best effect of awesome_snackbar_content
                                                              elevation: 0,
                                                              behavior:
                                                                  SnackBarBehavior
                                                                      .floating,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              content:
                                                                  AwesomeSnackbarContent(
                                                                title:
                                                                    'On Snap!',
                                                                message: '$e',

                                                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                contentType:
                                                                    ContentType
                                                                        .failure,
                                                              ),
                                                            );

                                                            // ignore: use_build_context_synchronously
                                                            ScaffoldMessenger
                                                                .of(context)
                                                              ..hideCurrentSnackBar()
                                                              ..showSnackBar(
                                                                  snackBar);
                                                            setState(() {
                                                              _isLoading =
                                                                  false;
                                                            });
                                                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoUpload()));
                                                          }
                                                        },
                                                        child: Text(
                                                          'Resend',
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize: 14 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height:
                                                                1.5714285714 *
                                                                    ffem /
                                                                    fem,
                                                            color: const Color(
                                                                0xff71ae00),
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // frame315re5 (2990:8769)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 35 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // mediumlabelsemibold14pxo3X (2990:8770)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      5 * fem),
                                                  child: Text(
                                                    'Verification',
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 14 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.5714285714 *
                                                          ffem /
                                                          fem,
                                                      letterSpacing: 0.07 * fem,
                                                      color: const Color(
                                                          0xff151940),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // frame1h8u (2990:8771)
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10 * fem),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffc4c4c4)),
                                                    color:
                                                        const Color(0xfffcfcfc),
                                                  ),
                                                  child: TextField(
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          if (value
                                                              .contains(' ')) {
                                                            _errorTextValue =
                                                                'Don\'t use blank spaces';
                                                          } else {
                                                            _errorTextValue =
                                                                '';
                                                          }
                                                        },
                                                      );
                                                    },
                                                    controller:
                                                        _textEditingController,
                                                    decoration: InputDecoration(
                                                      errorText: _errorTextValue
                                                              .isEmpty
                                                          ? null
                                                          : _errorTextValue,
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.fromLTRB(
                                                              236 * fem,
                                                              14 * fem,
                                                              15 * fem,
                                                              14 * fem),
                                                      hintText:
                                                          'Enter Verification Code',
                                                      hintStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xff71ae00)),
                                                    ),
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.6666666667 *
                                                          ffem /
                                                          fem,
                                                      letterSpacing: 0.06 * fem,
                                                      color: const Color(
                                                          0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // group11712749678zu (2990:8774)
                                            width: double.infinity,
                                            height: 48 * fem,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      100 * fem),
                                            ),
                                            child: TextButton(
                                              // frame1171274968KJh (2990:8777)
                                              onPressed: () async {
                                                _validateInput();
                                                setState(() {
                                                  _isLoading = true;
                                                });
                                                String otp = _textInput;
                                                try {
                                                  setState(() {
                                                    _isVerifyLoading = true;
                                                  });
                                                  // await _authService.otp(
                                                  //     _savedPhone!, otp);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const StartPage()));
                                                } catch (e) {
                                                  final snackBar = SnackBar(
                                                    /// need to set following properties for best effect of awesome_snackbar_content
                                                    elevation: 0,
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    content:
                                                        AwesomeSnackbarContent(
                                                      title: 'On Snap!',
                                                      message: '$e',

                                                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                      contentType:
                                                          ContentType.failure,
                                                    ),
                                                  );

                                                  // ignore: use_build_context_synchronously
                                                  ScaffoldMessenger.of(context)
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(snackBar);
                                                  setState(() {
                                                    _isVerifyLoading = false;
                                                  });
                                                }
                                              },
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    100 * fem,
                                                    12 * fem,
                                                    100 * fem,
                                                    12 * fem),
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff71ae00),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100 * fem),
                                                ),
                                                child: _isVerifyLoading
                                                    ? Center(
                                                        child: LoadingAnimationWidget
                                                            .progressiveDots(
                                                                color: const Color(
                                                                    0xffffffff),
                                                                size: 20),
                                                      )
                                                    : Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Center(
                                                            // viewdetailsDus (2990:8778)
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      10 * fem,
                                                                      0 * fem),
                                                              child: Text(
                                                                'Verify',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Inter',
                                                                  fontSize:
                                                                      16 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  height: 1.5 *
                                                                      ffem /
                                                                      fem,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            // vector12Kxu (2990:8779)
                                                            width: 14 * fem,
                                                            height: 14 * fem,
                                                            child: Image.asset(
                                                              'assets/new-mobile-2/images/vector-12.png',
                                                              width: 14 * fem,
                                                              height: 14 * fem,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
