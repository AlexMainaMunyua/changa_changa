// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/logic/requests/paymentnitification.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/ChannelDashboard.dart';
import 'package:changa_changa/widgets/bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ConfirmationPayment extends StatefulWidget {
  String dataFrom;
  String amount;
  ChannelRead channelData;
  String accessToken;
  String? requestId;

  ConfirmationPayment({
    super.key,
    required this.amount,
    required this.channelData,
    required this.accessToken,
    required this.requestId,
    required this.dataFrom,
  });

  @override
  State<ConfirmationPayment> createState() => _ConfirmationPaymentState();
}

class _ConfirmationPaymentState extends State<ConfirmationPayment> {
  bool _isLoading = false;
  void showAlert(bool success, ChannelRead chandata) {
    if (success) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Transaction Completed Successfully!',
          confirmBtnText: 'Dashboard',
          onConfirmBtnTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChannelDashboard(
                      channelData: chandata, accessToken: widget.accessToken)),
            );
          },
          confirmBtnColor: const Color(0xff71ae00));
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        cancelBtnText: 'Back',
        text: 'Treansaction failed!',
        onCancelBtnTap: () {
          Navigator.pop(context);
        },
      );
    }
  }

  double percetage({required String target, required double moneyin}) {
    return (moneyin / double.parse(target)) * 100;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            // iphone11promax438Ch (3038:8813)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group1171274828jCV (3038:8839)
                  width: double.infinity,
                  height: 896 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // group1171274977s3o (3038:8840)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: SizedBox(
                          width: 414 * fem,
                          height: 323 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // frame3Lt9 (2955:14033)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 15 * fem),
                                  width: 420 * fem,
                                  height: 102.27 * fem,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff00313d),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // frame1573YjK (2955:14034)
                                        margin: EdgeInsets.fromLTRB(26.5 * fem,
                                            65 * fem, 26.5 * fem, 0 * fem),
                                        width: double.infinity,
                                        height: 20 * fem,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: SizedBox(
                                                // navbarGfK (2955:14035)
                                                width: 20.08 * fem,
                                                height: 20 * fem,
                                                child: Image.asset(
                                                  'assets/new-mobile-2/images/nav-bar-6G1.png',
                                                  width: 20.08 * fem,
                                                  height: 20 * fem,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // autogroup4qghzbK (WNzjpcS2DLcCToR4kW4QGh)
                                              padding: EdgeInsets.fromLTRB(
                                                  113.93 * fem,
                                                  2 * fem,
                                                  0 * fem,
                                                  2 * fem),
                                              height: double.infinity,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // participantuiH (2955:14040)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        113.93 * fem,
                                                        0 * fem),
                                                    child: Text(
                                                      'ConfirmPayment',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: SafeGoogleFont(
                                                        'Inter',
                                                        fontSize: 18 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0.8888888889 *
                                                            ffem /
                                                            fem,
                                                        letterSpacing:
                                                            0.09 * fem,
                                                        color: const Color(
                                                            0xffffffff),
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
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle5fQu (3038:8854)
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
                        // group1171274970Sxh (2967:8570)
                        left: 20 * fem,
                        top: 134 * fem,
                        child: SizedBox(
                          width: 390 * fem,
                          height: 62 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // ellipse53Mpm (2967:8571)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 26.52 * fem, 0 * fem),
                                width: 63 * fem,
                                height: 63 * fem,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(31.5 * fem),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: widget.channelData.imageUrl != null
                                        ? NetworkImage(
                                            widget.channelData.imageUrl!)
                                        : widget.channelData.imageFile != null
                                            ? FileImage(
                                                widget.channelData.imageFile!)
                                            : const AssetImage(
                                                    'assets/user-516-a/images/illustration.png')
                                                as ImageProvider,
                                  ),
                                ),
                              ),
                              Container(
                                // janeandjohngoateatingweedingfu (2952:13980)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                constraints: BoxConstraints(
                                  maxWidth: 300 * fem,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${widget.channelData.title}',
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 17 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3533593346 * ffem / fem,
                                        letterSpacing: 0.17 * fem,
                                        color: const Color(0xff00313d),
                                      ),
                                    ),
                                    Text(
                                      'Active',
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5789192518 * ffem / fem,
                                        letterSpacing: 0.14 * fem,
                                        color: const Color(0xff71ae00),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // frame1171274987pZX (2967:8493)
                        left: 0 * fem,
                        top: 218 * fem,
                        child: Container(
                          width: 414 * fem,
                          height: 155 * fem,
                          decoration: const BoxDecoration(
                            color: Color(0x0c043e4d),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // frame1560jRb (2967:8495)
                                left: 15 * fem,
                                top: 17 * fem,
                                child: SizedBox(
                                  width: 255 * fem,
                                  height: 66 * fem,
                                  child: Align(
                                    // moneyin16000000000000kseqzR (2967:8496)
                                    alignment: Alignment.topLeft,
                                    child: SizedBox(
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 255 * fem,
                                        ),
                                        child: RichText(
                                          text: TextSpan(
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 25 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.3 * ffem / fem,
                                              color: const Color(0xe5000000),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Balannce\n',
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 14 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height:
                                                      1.2999999183 * ffem / fem,
                                                  color:
                                                      const Color(0xe5606060),
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${widget.channelData.runningBalance}',
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 22 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height:
                                                      1.2999999306 * ffem / fem,
                                                  color:
                                                      const Color(0xff00313d),
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 24 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height:
                                                      1.2999999523 * ffem / fem,
                                                  color:
                                                      const Color(0xe5000000),
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'KSE',
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 14 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height:
                                                      1.2999999183 * ffem / fem,
                                                  color:
                                                      const Color(0xcc606060),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // frame1560RUm (2967:8499)
                                left: 15 * fem,
                                top: 79 * fem,
                                child: SizedBox(
                                  width: 199 * fem,
                                  height: 61 * fem,
                                  child: RichText(
                                    text: TextSpan(
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 25 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3 * ffem / fem,
                                        color: const Color(0xe5000000),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Target\n',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2999999183 * ffem / fem,
                                            color: const Color(0xe5606060),
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${widget.channelData.target}',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 2.03125 * ffem / fem,
                                            color: const Color(0xff00313d),
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 2.03125 * ffem / fem,
                                            color: const Color(0xe5000000),
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'KES',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 9 * ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 3.6111111111 * ffem / fem,
                                            color: const Color(0xcc606060),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // group1171274974Z77 (2967:8502)
                                left: 15 * fem,
                                top: 117 * fem,
                                child: Container(
                                  width: 384 * fem,
                                  height: 23 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(100 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // 4Jm (2967:8506)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 3.42 * fem, 4 * fem),
                                        child: Text(
                                          '${percetage(target: widget.channelData.target!, moneyin: widget.channelData.total_collected!)}',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 10 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2 * ffem / fem,
                                            color: const Color(0x7f000000),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 7 * fem,
                                        child: LinearPercentIndicator(
                                          lineHeight: double.infinity,
                                          percent: percetage(
                                                          target: widget
                                                              .channelData
                                                              .target!,
                                                          moneyin: widget
                                                              .channelData
                                                              .total_collected!) /
                                                      100 >
                                                  1.0
                                              ? 1
                                              : percetage(
                                                      target: widget
                                                          .channelData.target!,
                                                      moneyin: widget
                                                          .channelData
                                                          .total_collected!) /
                                                  100,
                                          animation: true,
                                          barRadius: const Radius.circular(16),
                                          progressColor:
                                              const Color(0xffadd354),
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 255, 255),
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
                      Positioned(
                        // buttoneNd (3038:8933)
                        left: 15 * fem,
                        top: 714 * fem,
                        child: TextButton(
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              String? status = await paymentNotofication(
                                  access_token: widget.accessToken,
                                  req_id: widget.requestId!);

                              if (status == "SUCCESS") {
                                Fluttertoast.showToast(msg: 'payment success');
                                ChannelRead channelData = await readChannel(
                                    widget.channelData.channel_id!,
                                    widget.accessToken);
                                setState(() {
                                  widget.channelData = channelData;
                                });
                                showAlert(true, channelData);
                                setState(() {
                                  _isLoading = false;
                                });
                                return;
                              }
                              showAlert(false, widget.channelData);
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
                            padding: EdgeInsets.fromLTRB(
                                125.5 * fem, 12 * fem, 125.5 * fem, 12 * fem),
                            width: 384 * fem,
                            height: 48 * fem,
                            decoration: BoxDecoration(
                              color: const Color(0xff71ae00),
                              borderRadius: BorderRadius.circular(50 * fem),
                            ),
                            child: _isLoading
                                ? Center(
                                    child:
                                        LoadingAnimationWidget.progressiveDots(
                                            color: const Color(0xffffffff),
                                            size: 20),
                                  )
                                : SizedBox(
                                    // autogroupnckt7X7 (B8pT8rG1zmNQMbzkb4NCKT)
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Center(
                                      child: Center(
                                        child: Text(
                                          widget.dataFrom == 'withdraw'
                                              ? 'Confirm Withdrawal'
                                              : 'Confirm Payment',
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
                      ),
                      Positioned(
                        // frame1171275006cim (3038:8946)
                        left: 16 * fem,
                        top: 418 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              14.5 * fem, 21.5 * fem, 14.5 * fem, 21.5 * fem),
                          width: 383 * fem,
                          height: 119 * fem,
                          decoration: BoxDecoration(
                            color: const Color(0xfff2f5f6),
                            borderRadius: BorderRadius.circular(10 * fem),
                          ),
                          child: Center(
                            // confirmpaymentonceyouvereceive (3038:8947)
                            child: Center(
                              child: SizedBox(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 354 * fem,
                                  ),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3550000872 * ffem / fem,
                                        color: const Color(0xff000000),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: widget.dataFrom == 'withdraw'
                                              ? 'Confirm Withdrawal'
                                              : 'Confirm Payment\n',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.1856250763 * ffem / fem,
                                            color: const Color(0xff000000),
                                          ),
                                        ),
                                        const TextSpan(
                                          text:
                                              '\nOnce you’ve received an SMS on your phone, click on confirmation button to complete your transaction',
                                        ),
                                      ],
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        channelReadData: widget.channelData,
      ),
    );
  }
}
