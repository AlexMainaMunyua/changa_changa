// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/auth/reg.dart';
import 'package:changa_changa/models/idotp.dart';
import 'package:changa_changa/new-mobile-2/channel_list.dart';
import 'package:changa_changa/new-mobile-2/startPage.dart';
import 'package:changa_changa/widgets/topbarner.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';

import 'package:changa_changa/logic/channels/channels.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../logic/auth/login.dart';

// ignore: must_be_immutable
class LoginCode extends StatefulWidget {
  UserOtp userData;
  String id;
  LoginCode({super.key, required this.userData, required this.id});

  @override
  State<LoginCode> createState() => _LoginCodeState();
}

class _LoginCodeState extends State<LoginCode> {
  String? pin1;
  String? pin2;
  String? pin3;
  String? pin4;
  String? pin5;
  String? pin6;

  bool _isLoading = false;
  bool _isCodeReSentLoading = false;

  String otpCode = '';

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
            // iphone11promax12TaR (2929:9655)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // autogroupmam7mLD (WNzYBwpBePLnXieM3BMaM7)
                  width: 646 * fem,
                  height: 896 * fem,
                  child: Stack(
                    children: [
                      const TopBarner(),
                      Positioned(
                        // frame296DYD (2929:9682)
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
                                // frame296WZF (2929:9686)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Container(
                                  width: 414 * fem,
                                  height: 607 * fem,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // frame309eQZ (2929:9711)
                        left: 15 * fem,
                        top: 339 * fem,
                        child: SizedBox(
                          width: 631 * fem,
                          height: 300 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                // autogroupywdpZnR (WNzatT9jrdLUPTptgZyWdP)
                                width: double.infinity,
                                height: 100 * fem,
                                child: SizedBox(
                                  // frame313vN5 (2929:9712)
                                  width: 222 * fem,
                                  height: 76 * fem,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // loginverificationfaZ (2929:9714)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                        child: Text(
                                          'Login Verification',
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
                                        // wevesentloginverificationcodet (2929:9715)
                                        constraints: BoxConstraints(
                                          maxWidth: 222 * fem,
                                        ),
                                        child: Text(
                                          'We’ve sent login verification code\nto your phone ',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5714285714 * ffem / fem,
                                            color: const Color(0xff4f4f4f),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                // frame312fU5 (2929:9717)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // mediumlabelsemibold14pxoKP (2929:9718)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                      child: Text(
                                        'Verification code',
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
                                    SizedBox(
                                        // group1171274935hQm (2929:9797)
                                        width: 260 * fem,
                                        height: 60 * fem,
                                        child: PinCodeTextField(
                                          appContext: context,
                                          length: 6,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              setState(() {
                                                otpCode = value;
                                              });
                                            }
                                          },
                                          pinTheme: PinTheme(
                                            fieldHeight:
                                                40, // Adjust this to reduce the height of the fields
                                            fieldWidth: 30,
                                            borderWidth: 2,
                                            shape: PinCodeFieldShape.underline,
                                            activeFillColor:
                                                const Color.fromARGB(
                                                    255, 255, 255, 255),
                                            inactiveFillColor:
                                                const Color.fromARGB(
                                                    255, 255, 255, 255),
                                            selectedFillColor:
                                                const Color.fromARGB(
                                                    255, 255, 255, 255),
                                            activeColor:
                                                const Color(0xff71ae00),
                                            inactiveColor:
                                                const Color(0xff00313d),
                                            selectedColor:
                                                const Color(0xff71ae00),
                                          ),
                                          keyboardType: TextInputType.number,
                                          autoFocus: true,
                                          cursorColor: const Color(0xff00313d),
                                          animationType: AnimationType.fade,
                                          animationDuration:
                                              const Duration(milliseconds: 300),
                                          enableActiveFill: true,
                                        )
                                        //   Form(
                                        //     key: _formKey,
                                        //     child: Row(
                                        //       children: [
                                        //         SizedBox(
                                        //           height: 38 * fem,
                                        //           width: 38 * fem,
                                        //           child: TextFormField(
                                        //             validator: (value) {
                                        //               if (value!.isEmpty) {
                                        //                 return 'Fill In';
                                        //               }
                                        //               return null;
                                        //             },
                                        //             onChanged: (value) {
                                        //               if (value.length == 1) {
                                        //                 FocusScope.of(context)
                                        //                     .nextFocus();
                                        //               }
                                        //             },
                                        //             onSaved: (value) {
                                        //               pin1 = value;
                                        //             },
                                        //             style: Theme.of(context)
                                        //                 .textTheme
                                        //                 .titleLarge,
                                        //             keyboardType:
                                        //                 TextInputType.number,
                                        //             textAlign: TextAlign.center,
                                        //             inputFormatters: [
                                        //               LengthLimitingTextInputFormatter(
                                        //                   1),
                                        //               FilteringTextInputFormatter
                                        //                   .digitsOnly
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         const SizedBox(
                                        //           width: 10,
                                        //         ),
                                        //         SizedBox(
                                        //           height: 38 * fem,
                                        //           width: 38 * fem,
                                        //           child: TextFormField(
                                        //             validator: (value) {
                                        //               if (value!.isEmpty) {
                                        //                 return 'Fill In';
                                        //               }
                                        //               return null;
                                        //             },
                                        //             onChanged: (value) {
                                        //               if (value.length == 1) {
                                        //                 FocusScope.of(context)
                                        //                     .nextFocus();
                                        //               }
                                        //               if (value.isEmpty) {
                                        //                 FocusScope.of(context)
                                        //                     .previousFocus();
                                        //               }
                                        //             },
                                        //             onSaved: (value) {
                                        //               pin2 = value;
                                        //             },
                                        //             style: Theme.of(context)
                                        //                 .textTheme
                                        //                 .titleLarge,
                                        //             keyboardType:
                                        //                 TextInputType.number,
                                        //             textAlign: TextAlign.center,
                                        //             inputFormatters: [
                                        //               LengthLimitingTextInputFormatter(
                                        //                   1),
                                        //               FilteringTextInputFormatter
                                        //                   .digitsOnly
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         const SizedBox(
                                        //           width: 10,
                                        //         ),
                                        //         SizedBox(
                                        //           height: 38 * fem,
                                        //           width: 38 * fem,
                                        //           child: TextFormField(
                                        //             validator: (value) {
                                        //               if (value!.isEmpty) {
                                        //                 return 'Fill In';
                                        //               }
                                        //               return null;
                                        //             },
                                        //             onChanged: (value) {
                                        //               if (value.length == 1) {
                                        //                 FocusScope.of(context)
                                        //                     .nextFocus();
                                        //               }
                                        //               if (value.isEmpty) {
                                        //                 FocusScope.of(context)
                                        //                     .previousFocus();
                                        //               }
                                        //             },
                                        //             onSaved: (value) {
                                        //               pin3 = value;
                                        //             },
                                        //             style: Theme.of(context)
                                        //                 .textTheme
                                        //                 .titleLarge,
                                        //             keyboardType:
                                        //                 TextInputType.number,
                                        //             textAlign: TextAlign.center,
                                        //             inputFormatters: [
                                        //               LengthLimitingTextInputFormatter(
                                        //                   1),
                                        //               FilteringTextInputFormatter
                                        //                   .digitsOnly
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         const SizedBox(
                                        //           width: 10,
                                        //         ),
                                        //         SizedBox(
                                        //           height: 38 * fem,
                                        //           width: 38 * fem,
                                        //           child: TextFormField(
                                        //             validator: (value) {
                                        //               if (value!.isEmpty) {
                                        //                 return 'Fill In';
                                        //               }
                                        //               return null;
                                        //             },
                                        //             onChanged: (value) {
                                        //               if (value.length == 1) {
                                        //                 FocusScope.of(context)
                                        //                     .nextFocus();
                                        //               }
                                        //               if (value.isEmpty) {
                                        //                 FocusScope.of(context)
                                        //                     .previousFocus();
                                        //               }
                                        //             },
                                        //             onSaved: (value) {
                                        //               pin4 = value;
                                        //             },
                                        //             style: Theme.of(context)
                                        //                 .textTheme
                                        //                 .titleLarge,
                                        //             keyboardType:
                                        //                 TextInputType.number,
                                        //             textAlign: TextAlign.center,
                                        //             inputFormatters: [
                                        //               LengthLimitingTextInputFormatter(
                                        //                   1),
                                        //               FilteringTextInputFormatter
                                        //                   .digitsOnly
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         const SizedBox(
                                        //           width: 10,
                                        //         ),
                                        //         SizedBox(
                                        //           height: 38 * fem,
                                        //           width: 38 * fem,
                                        //           child: TextFormField(
                                        //             validator: (value) {
                                        //               if (value!.isEmpty) {
                                        //                 return 'Fill In';
                                        //               }
                                        //               return null;
                                        //             },
                                        //             onChanged: (value) {
                                        //               if (value.length == 1) {
                                        //                 FocusScope.of(context)
                                        //                     .nextFocus();
                                        //               }
                                        //               if (value.isEmpty) {
                                        //                 FocusScope.of(context)
                                        //                     .previousFocus();
                                        //               }
                                        //             },
                                        //             onSaved: (value) {
                                        //               pin5 = value;
                                        //             },
                                        //             style: Theme.of(context)
                                        //                 .textTheme
                                        //                 .titleLarge,
                                        //             keyboardType:
                                        //                 TextInputType.number,
                                        //             textAlign: TextAlign.center,
                                        //             inputFormatters: [
                                        //               LengthLimitingTextInputFormatter(
                                        //                   1),
                                        //               FilteringTextInputFormatter
                                        //                   .digitsOnly
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         const SizedBox(
                                        //           width: 10,
                                        //         ),
                                        //         SizedBox(
                                        //           height: 38 * fem,
                                        //           width: 38 * fem,
                                        //           child: TextFormField(
                                        //             validator: (value) {
                                        //               if (value!.isEmpty) {
                                        //                 return 'Fill In';
                                        //               }
                                        //               return null;
                                        //             },
                                        //             onChanged: (value) {
                                        //               if (value.isEmpty) {
                                        //                 FocusScope.of(context)
                                        //                     .previousFocus();
                                        //               }
                                        //             },
                                        //             onSaved: (value) {
                                        //               pin6 = value;
                                        //             },
                                        //             style: Theme.of(context)
                                        //                 .textTheme
                                        //                 .titleLarge,
                                        //             keyboardType:
                                        //                 TextInputType.number,
                                        //             textAlign: TextAlign.center,
                                        //             inputFormatters: [
                                        //               LengthLimitingTextInputFormatter(
                                        //                   1),
                                        //               FilteringTextInputFormatter
                                        //                   .digitsOnly
                                        //             ],
                                        //           ),
                                        //         )
                                        //       ],
                                        //     ),
                                        //   ),
                                        ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  RichText(
                                    // didntreceiveacoderesendxX3 (2929:9725)
                                    text: TextSpan(
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5714285714 * ffem / fem,
                                        color: const Color(0xffffffff),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Didn’t receive a code? ',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5714285714 * ffem / fem,
                                            color: const Color(0xff4f4f4f),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _isCodeReSentLoading
                                      ? Center(
                                          child: LoadingAnimationWidget
                                              .progressiveDots(
                                                  color:
                                                      const Color(0xff71ae00),
                                                  size: 20),
                                        )
                                      : InkWell(
                                          onTap: () async {
                                            setState(() {
                                              _isCodeReSentLoading = true;
                                            });
                                            try {
                                              //print(_savedPhone);
                                              // UserOtp returnData =
                                              //     await loginOtp(widget.id);
                                              // if (returnData.message ==
                                              //     'SUCCESS') {
                                              //   setState(() {
                                              //     _isCodeReSentLoading = false;
                                              //   });
                                              // }
                                            } catch (e) {
                                              Fluttertoast.showToast(
                                                  msg: e.toString());
                                              setState(() {
                                                _isCodeReSentLoading = false;
                                              });
                                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoUpload()));
                                            }
                                          },
                                          child: Text(
                                            'Resend',
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5714285714 * ffem / fem,
                                              color: const Color(0xff71ae00),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              Container(
                                // autogroupf1a9YtZ (WNzb3wsvCwUJ2Xb5vbf1a9)
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 24 * fem, 0 * fem, 9 * fem),
                                width: double.infinity,
                                height: 81 * fem,
                                child: Container(
                                  // group1171274967V37 (2955:13999)
                                  width: 384 * fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(100 * fem),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // frame11712749671GM (2955:14000)
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
                                              'assets/new-mobile-2/images/frame-1171274967-SWM.png',
                                              width: 48 * fem,
                                              height: 48 * fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        // frame1171274968HzZ (2955:14002)
                                        onPressed: () async {
                                          if (otpCode.isNotEmpty) {
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            _formKey.currentState?.save();
                                            final String otp = otpCode;
                                            try {
                                              // List<Channels>? userChannelList =
                                              //     await ApiService
                                              //         .authenticateUser(
                                              //             otp: otp,
                                              //             user_id: widget
                                              //                 .userData
                                              //                 .user
                                              //                 ?.userId!,
                                              //             req_id: widget
                                              //                 .userData
                                              //                 .request_id!);

                                              // setState(() {
                                              //   _isLoading = false;
                                              // });
                                              // ignore: use_build_context_synchronously





                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //
                                              //               StartPage()
                                              //              )
                                              // );
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                  ChanelList(userChannelList: [
                                                    Channels(
                                                      channel_id: 'ch001',
                                                      runningBalance: 1200.50,
                                                      link: 'https://www.example.com/channel1',
                                                      code: 'C1A2345',
                                                      imageUrl: 'https://plus.unsplash.com/premium_vector-1719374656644-b00f8808ef26?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                                      description: 'This is the first channel.',
                                                      title: 'Channel 1',
                                                      is_active: true,
                                                      category: Category(id: 01, name: 'Technology', displayName: ''),
                                                      account_id: 'acc001',
                                                      channel_status: 1, // Active
                                                      status_reason: 'Fully operational',
                                                    ),
                                                    Channels(
                                                      channel_id: 'ch002',
                                                      runningBalance: 800.75,
                                                      link: 'https://www.example.com/channel2',
                                                      code: 'C2B2345',
                                                      imageUrl: 'https://plus.unsplash.com/premium_vector-1719374656666-258cbe7ccab5?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                                      description: 'This is the second channel.',
                                                      title: 'Channel 2',
                                                      is_active: false,
                                                      category: Category(id: 02, name: 'Education', displayName: ''),
                                                      account_id: 'acc002',
                                                      channel_status: 0, // Inactive
                                                      status_reason: 'Under maintenance',
                                                    ),
                                                    Channels(
                                                      channel_id: 'ch003',
                                                      runningBalance: 1500.30,
                                                      link: 'https://www.example.com/channel3',
                                                      code: 'C3C2345',
                                                      imageUrl: 'https://plus.unsplash.com/premium_vector-1719374656674-12ec0f9f2385?q=80&w=1377&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                                      description: 'This is the third channel.',
                                                      title: 'Channel 3',
                                                      is_active: true,
                                                      category: Category(id: 03, name: 'Health', displayName: ''),
                                                      account_id: 'acc003',
                                                      channel_status: 1, // Active
                                                      status_reason: 'Active and running smoothly',
                                                    ),
                                                    Channels(
                                                      channel_id: 'ch004',
                                                      runningBalance: 2500.00,
                                                      link: 'https://www.example.com/channel4',
                                                      code: 'C4D2345',
                                                      imageUrl: 'https://plus.unsplash.com/premium_vector-1719412280978-538d9bd56a8e?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                                      description: 'This is the fourth channel.',
                                                      title: 'Channel 4',
                                                      is_active: true,
                                                      category: Category(id: 04, name: 'Entertainment', displayName: ''),
                                                      account_id: 'acc004',
                                                      channel_status: 1, // Active
                                                      status_reason: 'Fully operational',
                                                    ),
                                                    Channels(
                                                      channel_id: 'ch005',
                                                      runningBalance: 550.20,
                                                      link: 'https://www.example.com/channel5',
                                                      code: 'C5E2345',
                                                      imageUrl: 'https://plus.unsplash.com/premium_vector-1719345029160-aaa310f4a220?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                                      description: 'This is the fifth channel.',
                                                      title: 'Channel 5',
                                                      is_active: false,
                                                      category: Category(id: 05, name: 'Sports', displayName: ''),
                                                      account_id: 'acc005',
                                                      channel_status: 0, // Inactive
                                                      status_reason: 'Inactive due to policy changes',
                                                    ),
                                                  ],))
                                              );
                                            } catch (e) {
                                              final snackBar = SnackBar(
                                                /// need to set following properties for best effect of awesome_snackbar_content
                                                elevation: 0,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor:
                                                    Colors.transparent,
                                                content: AwesomeSnackbarContent(
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
                                              // if (e.toString() ==
                                              //     "Exception: Exception: Inactive user") {
                                              //   Navigator.push(
                                              //       context,
                                              //       MaterialPageRoute(
                                              //           builder: (context) =>
                                              //               const PhoneVerification2()));
                                              // }
                                              // Fluttertoast.showToast(
                                              //     msg: e.toString());
                                              // setState(() {
                                              //   isLoading = false;
                                              // });
                                            }
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              104.5 * fem,
                                              12 * fem,
                                              104.5 * fem,
                                              12 * fem),
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff71ae00),
                                            borderRadius: BorderRadius.circular(
                                                100 * fem),
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
                                                      // viewdetails1Qm (2955:14003)
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                10 * fem,
                                                                0 * fem),
                                                        child: Text(
                                                          'Log In',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize: 16 * ffem,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                      // vector12KgM (2955:14004)
                                                      width: 14 * fem,
                                                      height: 14 * fem,
                                                      child: Image.asset(
                                                        'assets/new-mobile-2/images/vector-12-FZs.png',
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
