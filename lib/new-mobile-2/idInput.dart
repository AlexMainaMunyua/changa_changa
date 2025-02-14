// ignore_for_file: file_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/auth/reg.dart';
import 'package:changa_changa/models/idotp.dart';
import 'package:changa_changa/new-mobile-2/kycver.dart';
import 'package:changa_changa/new-mobile-2/loginCode.dart';
import 'package:changa_changa/widgets/topbarner.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class IdInputLogin extends StatefulWidget {
  const IdInputLogin({super.key});

  @override
  State<IdInputLogin> createState() => _IdInputLoginState();
}

class _IdInputLoginState extends State<IdInputLogin> {
  String _errorTextValue = '';
  String _textInput = '';
  bool _isLoading = false;
  bool _isCodeSent = false;
  final _textControllerId = TextEditingController();

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
            // iphone11promax104zD (2929:9397)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // autogroup5bm3Pmb (WNzEdx4RMv9WusRn125bm3)
                  width: double.infinity,
                  height: 896 * fem,
                  child: Stack(
                    children: [
                      const TopBarner(),
                      Positioned(
                        // frame296PER (2929:9424)
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
                                // frame296rvd (2929:9428)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      20 * fem, 50 * fem, 20 * fem, 50 * fem),
                                  width: 414 * fem,
                                  height: 607 * fem,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  child: SizedBox(
                                    // frame309AgR (2929:9453)
                                    width: double.infinity,
                                    height: 286 * fem,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // frame313hwF (2929:9645)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 24 * fem),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // accountloginFC5 (2929:9647)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    0 * fem,
                                                    8 * fem),
                                                child: Text(
                                                  'Account Login',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 24 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1 * ffem / fem,
                                                    color:
                                                        const Color(0xff00313d),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // enteryournationalidentitynumbe (2929:9648)
                                                constraints: BoxConstraints(
                                                  maxWidth: 240 * fem,
                                                ),
                                                child: Text(
                                                  'Enter your National Identity number \nand click continue to receive OTP',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5714285714 *
                                                        ffem /
                                                        fem,
                                                    color:
                                                        const Color(0xff4f4f4f),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // frame312T3F (2929:9633)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 24 * fem),
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // mediumlabelsemibold14pxBE9 (2929:9634)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    0 * fem,
                                                    5 * fem),
                                                child: Text(
                                                  'National Identity Number',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5714285714 *
                                                        ffem /
                                                        fem,
                                                    letterSpacing: 0.07 * fem,
                                                    color:
                                                        const Color(0xff00313d),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // frame1UDF (2929:9635)
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
                                                          _errorTextValue = '';
                                                        }
                                                      },
                                                    );
                                                  },
                                                  controller: _textControllerId,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    errorText:
                                                        _errorTextValue.isEmpty
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
                                                            15 * fem,
                                                            14 * fem,
                                                            15 * fem,
                                                            14 * fem),
                                                    hintText: 'Your ID Number',
                                                    hintStyle: const TextStyle(
                                                        color:
                                                            Color(0xff78828a)),
                                                  ),
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.6666666667 *
                                                        ffem /
                                                        fem,
                                                    letterSpacing: 0.06 * fem,
                                                    color:
                                                        const Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // buttonhbo (2929:9638)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 17 * fem),
                                          child: TextButton(
                                            onPressed: () async {
                                              _validateInput();
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              String id = _textInput;
                                              try {

                                               UserOtp returnData =
                                               UserOtp();

                                               //  if (returnData.message ==
                                               //      'SUCCESS') {
                                               //    _isCodeSent = true;
                                               //  }
                                                // ignore: use_build_context_synchronously
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginCode(
                                                      userData: returnData,
                                                      id: id,
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
                                                  behavior:
                                                      SnackBarBehavior.floating,
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
                                                  _isLoading = false;
                                                });
                                              }
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  134 * fem,
                                                  12 * fem,
                                                  141.25 * fem,
                                                  12 * fem),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff71ae00),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50 * fem),
                                              ),
                                              child: _isLoading
                                                  ? Center(
                                                      child: LoadingAnimationWidget
                                                          .progressiveDots(
                                                              color: const Color(
                                                                  0xffffffff),
                                                              size: 20),
                                                    )
                                                  : _isCodeSent
                                                      ? Center(
                                                          // labelNxq (I2929:9638;567:5918)
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0 * fem,
                                                                    0 * fem,
                                                                    16.25 * fem,
                                                                    0 * fem),
                                                            child: Text(
                                                              'Code Sent',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style:
                                                                  SafeGoogleFont(
                                                                'Inter',
                                                                fontSize:
                                                                    17 * ffem,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height:
                                                                    1.4117647059 *
                                                                        ffem /
                                                                        fem,
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              // labelNxq (I2929:9638;567:5918)
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .fromLTRB(
                                                                        0 * fem,
                                                                        0 * fem,
                                                                        16.25 *
                                                                            fem,
                                                                        0 * fem),
                                                                child: Text(
                                                                  'Continue',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      SafeGoogleFont(
                                                                    'Inter',
                                                                    fontSize:
                                                                        17 *
                                                                            ffem,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    height:
                                                                        1.4117647059 *
                                                                            ffem /
                                                                            fem,
                                                                    color: const Color(
                                                                        0xffffffff),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              // anglerightH4D (I2929:9638;567:5919)
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      0 * fem,
                                                                      0 * fem),
                                                              width: 8.5 * fem,
                                                              height:
                                                                  15.5 * fem,
                                                              child:
                                                                  Image.asset(
                                                                'assets/new-mobile-2/images/angle-right.png',
                                                                width:
                                                                    8.5 * fem,
                                                                height:
                                                                    15.5 * fem,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            RichText(
                                              // donthaveanaccountregisterzUR (2929:9649)
                                              text: TextSpan(
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 14 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height:
                                                      1.5714285714 * ffem / fem,
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'Don’t have an account? ',
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
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const KycVerification(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Register',
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 14 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height:
                                                      1.5714285714 * ffem / fem,
                                                  color:
                                                      const Color(0xff71ae00),
                                                ),
                                              ),
                                            ),
                                          ],
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
