// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/kyc/user_validation.dart';
import 'package:changa_changa/new-mobile-2/register.dart';
import 'package:changa_changa/widgets/topbarner.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class KycVerification extends StatefulWidget {
  const KycVerification({super.key});

  @override
  State<KycVerification> createState() => _KycVerificationState();
}

class _KycVerificationState extends State<KycVerification> {
  String _errorTextValue = '';
  String _errorTextValueFirstName = '';
  String? firstame;
  String? id;
  bool _isLoading = false;
  final _userKyc = KYCRequest();

  String? dob;
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        dob = '${value?.year.toString()}';
        _userKyc.yearOfBirth = int.parse(dob!);
      });
    });
  }

  final _formKey = GlobalKey<FormState>();
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
            // iphone11promax30Nx1 (2976:8701)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // autogrouprsyfhjP (WNzJmuzuuxbDHHnEfcRSyF)
                  width: double.infinity,
                  height: 896 * fem,
                  child: Stack(
                    children: [
                      const TopBarner(),
                      Positioned(
                        // frame296w6Z (2976:8728)
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
                                // frame296XcV (2976:8732)
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
                                  child: Container(
                                    // frame3092JM (2976:8757)
                                    padding: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9 * fem),
                                    width: double.infinity,
                                    height: 287 * fem,
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // accountregistrationLK3 (2976:8760)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 24 * fem),
                                            child: Text(
                                              'Account Registration',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 24 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1 * ffem / fem,
                                                color: const Color(0xff00313d),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // frame315pzu (2977:8823)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 8 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // mediumlabelsemibold14pxktZ (2977:8824)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      5 * fem),
                                                  child: Text(
                                                    'First name',
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
                                                          0xff00313d),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // frame1SmP (2977:8825)
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
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Can\'t be empty';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      firstame = value;
                                                    },
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          if (value
                                                              .contains(' ')) {
                                                            _errorTextValueFirstName =
                                                                'Don\'t use blank spaces';
                                                          } else {
                                                            _errorTextValueFirstName =
                                                                '';
                                                          }
                                                        },
                                                      );
                                                    },
                                                    decoration: InputDecoration(
                                                      errorText:
                                                          _errorTextValueFirstName
                                                                  .isEmpty
                                                              ? null
                                                              : _errorTextValueFirstName,
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
                                                      hintText: 'First name',
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
                                            // frame314sbo (2977:8818)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 24 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // mediumlabelsemibold14pxQ5w (2977:8819)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      5 * fem),
                                                  child: Text(
                                                    'Identity number',
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
                                                          0xff00313d),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // frame1HQd (2977:8820)
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
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Can\'t be empty';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      id = value;
                                                    },
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
                                                    keyboardType:
                                                        TextInputType.number,
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
                                                              15 * fem,
                                                              14 * fem,
                                                              15 * fem,
                                                              14 * fem),
                                                      hintText: 'ID Number',
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
                                            // frame314sbo (2977:8818)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 24 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // mediumlabelsemibold14pxQ5w (2977:8819)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      5 * fem),
                                                  child: Text(
                                                    'Year of birth',
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
                                                          0xff00313d),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // frame1HQd (2977:8820)
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
                                                  child: TextButton(
                                                    onPressed: () {
                                                      _showDatePicker();
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      // frame24MUJ (368:23315)
                                                      width: double.infinity,
                                                      height: 41 * fem,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    4 * fem),
                                                      ),
                                                      child: Text(
                                                        dob != null
                                                            ? dob.toString()
                                                            : "Date Of Birth",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: SafeGoogleFont(
                                                          'Roboto',
                                                          fontSize: 13 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.3533593691 *
                                                              ffem /
                                                              fem,
                                                          letterSpacing:
                                                              -0.260000031 *
                                                                  fem,
                                                          color: const Color(
                                                              0xff00313d),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            // buttonwEH (2976:8769)
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  _isLoading = true;
                                                });
                                                _formKey.currentState?.save();
                                                try {
                                                  _userKyc.firstName = firstame;
                                                  _userKyc.idNumber = id;
                                                  final resp =
                                                      await validateKYC(
                                                          request: _userKyc);

                                                  setState(() {
                                                    _isLoading = false;
                                                  });
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Register(
                                                        kycdata: resp,
                                                      ),
                                                    ),
                                                  );
                                                  // ignore: duplicate_ignore
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
                                                    _isLoading = false;
                                                  });
                                                }
                                              }
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  138 * fem,
                                                  12 * fem,
                                                  145.25 * fem,
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
                                                  : Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          // labelcrD (I2976:8769;567:5918)
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0 * fem,
                                                                    0 * fem,
                                                                    16.25 * fem,
                                                                    0 * fem),
                                                            child: Text(
                                                              'Validate',
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
                                                        ),
                                                        Container(
                                                          // angleright8Jm (I2976:8769;567:5919)
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  0 * fem),
                                                          width: 8.5 * fem,
                                                          height: 15.5 * fem,
                                                          child: Image.asset(
                                                            'assets/new-mobile-2/images/angle-right-PbX.png',
                                                            width: 8.5 * fem,
                                                            height: 15.5 * fem,
                                                          ),
                                                        ),
                                                      ],
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
