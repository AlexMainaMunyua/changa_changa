// ignore_for_file: must_be_immutable, use_build_context_synchronously, duplicate_ignore

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/auth/reg.dart';
import 'package:changa_changa/logic/kyc/user_validation.dart';
import 'package:changa_changa/new-mobile-2/phoneverification.dart';
import 'package:changa_changa/widgets/topbarner.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/user.dart';

class Register extends StatefulWidget {
  KYCResponse kycdata;
  Register({super.key, required this.kycdata});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final List<String> titles = [
    'Mr',
    'Mrs',
    'Miss',
    'Hon',
    'Doc',
    'Prof',
    'Pst',
    'Bsp'
  ];
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  final _user = User();
  bool _isLoading = false;
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            // iphone11promax32bYu (2977:8959)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // autogroupqpmkWQy (WNzPR7bh54yWucviNBqPMK)
                  width: double.infinity,
                  height: height,
                  child: Stack(
                    children: [
                      const TopBarner(),
                      Positioned(
                        // frame296dsX (2977:8986)
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
                                // buttonYzV (2977:8987)
                                left: 53 * fem,
                                top: 50 * fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      124 * fem, 12 * fem, 124 * fem, 12 * fem),
                                  width: 308 * fem,
                                  height: 48 * fem,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff71ae00),
                                    borderRadius:
                                        BorderRadius.circular(50 * fem),
                                  ),
                                  child: SizedBox(
                                    // autogroup9wn9FP7 (WNzRmJBn3LrdzdTekp9wN9)
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Center(
                                      child: Center(
                                        child: Text(
                                          'Sign Up',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5 * ffem / fem,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // frame296KnH (2977:8990)
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
                                    // frame309EeM (2977:9015)
                                    padding: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9 * fem),
                                    width: double.infinity,
                                    height: 416 * fem,
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // johndoeidno1381xxxxxkch (2977:9089)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 24 * fem),
                                            child: Text(
                                              '${widget.kycdata.fullName}   ID No. ${widget.kycdata.idNumber}',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height:
                                                    1.3533593416 * ffem / fem,
                                                letterSpacing:
                                                    -0.3200000381 * fem,
                                                color: const Color(0xff00313d),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // accountregistrationqPF (2977:9018)
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
                                            // frame3158t9 (2977:9020)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 8 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // mediumlabelsemibold14pxUSD (2977:9021)
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
                                                          0xff00313d),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // frame1ak9 (2977:9022)
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
                                                        return 'Please enter a valid Phone Number';
                                                      }
                                                      if (value.length < 10) {
                                                        return 'phone number must be atleast 10 characters';
                                                      }
                                                      if (value[0] != '0') {
                                                        return 'phone number must start with 07 or 01';
                                                      }
                                                      String phone =
                                                          '+254${value.substring(1)}';
                                                      _user.phone_number =
                                                          phone;
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      String phone =
                                                          '+254${value?.substring(1)}';
                                                      _user.phone_number =
                                                          phone;
                                                    },
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          10),
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    keyboardType:
                                                        TextInputType.phone,
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
                                                      hintText: '07',
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
                                            // frame314qg5 (2977:9025)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 8 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // mediumlabelsemibold14pxa7s (2977:9026)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      5 * fem),
                                                  child: Text(
                                                    'Email address',
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
                                                  // frame15KX (2977:9027)
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
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Please enter your email address';
                                                      }
                                                      _user.email_address =
                                                          value;
                                                      return null;
                                                    },
                                                    onSaved: (value) => _user
                                                        .email_address = value!,
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
                                                          'Your email address',
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
                                            // frame3168Yh (2977:9030)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 8 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // mediumlabelsemibold14pxa7s (2977:9026)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      5 * fem),
                                                  child: Text(
                                                    'Title',
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
                                                  // frame2NC9 (2990:9516)
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
                                                  child:
                                                      DropdownButtonFormField2<
                                                          String>(
                                                    isDense: true,
                                                    isExpanded: true,
                                                    hint: const Text(
                                                      'Select your title',
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    items: titles
                                                        .map((item) =>
                                                            DropdownMenuItem<
                                                                String>(
                                                              value: item,
                                                              child: Text(
                                                                item,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ))
                                                        .toList(),
                                                    validator: (value) {
                                                      if (value == null) {
                                                        return 'Please select gender.';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: (value) {
                                                      //Do something when selected item is changed.
                                                    },
                                                    onSaved: (value) {
                                                      selectedValue =
                                                          value.toString();
                                                    },
                                                    buttonStyleData:
                                                        const ButtonStyleData(
                                                      padding: EdgeInsets.only(
                                                          right: 8),
                                                    ),
                                                    iconStyleData:
                                                        const IconStyleData(
                                                      icon: Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.black45,
                                                      ),
                                                      iconSize: 24,
                                                    ),
                                                    dropdownStyleData:
                                                        DropdownStyleData(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                    ),
                                                    menuItemStyleData:
                                                        const MenuItemStyleData(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            // buttonzjK (2977:9041)
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  _isLoading = true;
                                                });
                                                _formKey.currentState?.save();
                                                try {
                                                  _user.verification_request_id =
                                                      widget.kycdata.requestId;
                                                  _user.title = selectedValue;
                                                  // await _authService
                                                  //     .register(_user);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PhoneVerification(),
                                                    ),
                                                  );
                                                  setState(
                                                    () {
                                                      _isLoading = false;
                                                    },
                                                  );
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
                                                                  0xff71ae00),
                                                              size: 20),
                                                    )
                                                  : Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          // labeltZo (I2977:9041;567:5918)
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0 * fem,
                                                                    0 * fem,
                                                                    16.25 * fem,
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
                                                          // anglerightPmT (I2977:9041;567:5919)
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  0 * fem),
                                                          width: 8.5 * fem,
                                                          height: 15.5 * fem,
                                                          child: Image.asset(
                                                            'assets/new-mobile-2/images/angle-right-Kyb.png',
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
