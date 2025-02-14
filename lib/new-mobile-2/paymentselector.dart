// ignore_for_file: must_be_immutable

import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/MpesaPayment.dart';
import 'package:changa_changa/new-mobile-2/cardpayment.dart';
import 'package:changa_changa/widgets/bottomNavbar.dart';
import 'package:changa_changa/widgets/dropDownClose.dart';
import 'package:changa_changa/widgets/dropDownLeave.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentSelector extends StatefulWidget {
  String amount;
  ChannelRead channelData;
  String accessToken;
  PaymentSelector(
      {super.key,
      required this.amount,
      required this.channelData,
      required this.accessToken});

  @override
  State<PaymentSelector> createState() => _PaymentSelectorState();
}

class _PaymentSelectorState extends State<PaymentSelector> {
  Participant? _admin;
  String? _username;

  Future<String?> getSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('full_name');
  }

  Future<void> _loaduserData() async {
    final savedUsername = await getSavedUsername();
    if (savedUsername != null) {
      setState(() {
        _username = savedUsername;
      });
    }
  }

  Future<void> _loadChannelData({String? accessToken, String? chanId}) async {
    setState(() {});
    ChannelRead? data = await readChannel(chanId!, accessToken!);
    if (data.participants != null) {
      for (Participant participant in data.participants!) {
        if (participant.is_admin!) {
          setState(() {
            _admin = participant;
          });

          break;
        }
      }
    }
    setState(() {
      widget.channelData = data;
    });
  }

  double percetage({required String target, required double moneyin}) {
    return (moneyin / double.parse(target)) * 100;
  }

  @override
  void initState() {
    super.initState();
    _loaduserData();
    _loadChannelData(
        accessToken: widget.accessToken, chanId: widget.channelData.channel_id);
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
            // iphone11promax39T13 (3031:8357)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group1171274828r3B (3031:8383)
                  width: double.infinity,
                  height: 896 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // group1171274977dTw (2955:14032)
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
                                  width: 414 * fem,
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
                                                      'Payments',
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
                                                  _admin?.user?.first_name ==
                                                          _username
                                                      ? DropDown(
                                                          accessToken: widget
                                                              .accessToken,
                                                          channelData: widget
                                                              .channelData,
                                                        )
                                                      : DropDownLeave(
                                                          accessToken: widget
                                                              .accessToken,
                                                          channelData: widget
                                                              .channelData,
                                                        )
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
                        // rectangle5Xiy (3031:8398)
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
                                                text: 'Money in\n',
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
                                                    '${widget.channelData.total_collected}',
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
                        // frame4626ov1 (3031:8503)
                        left: 15 * fem,
                        top: 387 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 9.5 * fem, 0 * fem, 9.5 * fem),
                          width: 355 * fem,
                          height: 225 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7 * fem),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                // frame48uCM (3031:8504)
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MpesaPayment(
                                          amount: widget.amount,
                                          channelData: widget.channelData,
                                          accessToken: widget.accessToken),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: SizedBox(
                                  width: 158 * fem,
                                  height: 40 * fem,
                                  child: SizedBox(
                                    // group1171274814qrh (3031:8506)
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // group1171275003nmw (3038:8783)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 12 * fem, 0 * fem),
                                          width: 40 * fem,
                                          height: 40 * fem,
                                          child: Image.asset(
                                            'assets/new-mobile-2/images/group-1171275003-MP7.png',
                                            width: 40 * fem,
                                            height: 40 * fem,
                                          ),
                                        ),
                                        Container(
                                          // paywithmpesa73X (3031:8519)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 2 * fem),
                                          child: Text(
                                            'Pay with Mpesa',
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.4642857143 * ffem / fem,
                                              color: const Color(0xff1f1f1f),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 19 * fem,
                              ),
                              TextButton(
                                // frame49bjP (3031:8520)
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: SizedBox(
                                  width: 198 * fem,
                                  height: 40 * fem,
                                  child: SizedBox(
                                    // group1171274815YPj (3031:8522)
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // ellipse52tyP (3031:8523)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 12 * fem, 0 * fem),
                                          width: 40 * fem,
                                          height: 40 * fem,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20 * fem),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                'assets/new-mobile-2/images/ellipse-52-bg.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // payfromkcbaccountQgq (3031:8524)
                                          'Pay from KCB Account',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 0.9283593042 * ffem / fem,
                                            letterSpacing: -0.2800000334 * fem,
                                            color: const Color(0xff1f1f1f),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 19 * fem,
                              ),
                              TextButton(
                                // frame51XWZ (3031:8532)
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CardPayment(
                                          channelData: widget.channelData,
                                          accessT: widget.accessToken,
                                          amount: widget.amount),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: SizedBox(
                                  width: 165 * fem,
                                  height: 40 * fem,
                                  child: SizedBox(
                                    // group1171274815GU9 (3031:8534)
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // autogroup9mhbD8V (B8pN1VoUvZ3NBjLzra9Mhb)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 12 * fem, 0 * fem),
                                          width: 40 * fem,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // group1171274818xVP (3031:8538)
                                                left: 0 * fem,
                                                top: 0 * fem,
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      2.29 * fem,
                                                      10.29 * fem,
                                                      3.34 * fem,
                                                      10.29 * fem),
                                                  width: 40 * fem,
                                                  height: 40 * fem,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfff3f3f3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20 * fem),
                                                  ),
                                                  child: Center(
                                                    // pesalink1TS9 (3031:8540)
                                                    child: SizedBox(
                                                      width: 34.37 * fem,
                                                      height: 19.43 * fem,
                                                      child: Image.asset(
                                                        'assets/new-mobile-2/images/pesalink-1.png',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          // visamastercardzgy (3031:8541)
                                          'Visa / Mastercard',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 0.9283593042 * ffem / fem,
                                            letterSpacing: -0.2800000334 * fem,
                                            color: const Color(0xff1f1f1f),
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
