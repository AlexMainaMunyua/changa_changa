// ignore_for_file: must_be_immutable, use_build_context_synchronously, duplicate_ignore, file_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/confirmpayment.dart';
import 'package:changa_changa/widgets/dropDownClose.dart';
import 'package:changa_changa/widgets/dropDownLeave.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../logic/channels/payment.dart' as contrib;
import '../widgets/bottomNavbar.dart';

class MpesaPayment extends StatefulWidget {
  String amount;
  ChannelRead channelData;
  String accessToken;
  MpesaPayment(
      {super.key,
      required this.amount,
      required this.channelData,
      required this.accessToken});

  @override
  State<MpesaPayment> createState() => _MpesaPaymentState();
}

class _MpesaPaymentState extends State<MpesaPayment> {
  Participant? _admin;
  bool _isLoading = false;
  String? _username;
  String _errorTextValue = '';
  String _textInput = '';
  final _textControllerId = TextEditingController();
  String? _requestId;

  @override
  void dispose() {
    _textControllerId.dispose();
    super.dispose();
  }

  void _validateInput() {
    final input = _textControllerId.text;
    setState(() {
      if (input.isEmpty) {
        _errorTextValue = 'The phonenumber field is required';
        return;
      } else {
        _textInput = input;
        _errorTextValue = '';
      }
    });
  }

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
    setState(() {
      _isLoading = true;
    });
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
      _isLoading = false;
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
            // iphone11promax40JUZ (3031:8872)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group11712748288Tb (3031:8898)
                  width: double.infinity,
                  height: 896 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // group1171274977GZo (3031:8899)
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
                        // rectangle5tWd (3031:8913)
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
                        // frame1171275006YTK (3031:9033)
                        left: 15 * fem,
                        top: 387 * fem,
                        child: SizedBox(
                          width: 385 * fem,
                          height: 307 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroup5qhk4Am (B8pPBdWd3vHmXSat1f5qHK)
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 20 * fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // frame4626BFP (3031:8975)
                                      padding: EdgeInsets.fromLTRB(0 * fem,
                                          9.5 * fem, 0 * fem, 9.5 * fem),
                                      width: 355 * fem,
                                      height: 59 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7 * fem),
                                      ),
                                      child: Container(
                                        // frame48HZK (3031:8976)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 197 * fem, 0 * fem),
                                        width: 158 * fem,
                                        height: double.infinity,
                                        child: SizedBox(
                                          // group1171274815EDf (3038:8797)
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // group1171275003aHX (3038:8798)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    12 * fem,
                                                    0 * fem),
                                                width: 40 * fem,
                                                height: 40 * fem,
                                                child: Image.asset(
                                                  'assets/new-mobile-2/images/group-1171275003-MP7.png',
                                                  width: 40 * fem,
                                                  height: 40 * fem,
                                                ),
                                              ),
                                              Container(
                                                // paywithmpesaHSq (3038:8812)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    0 * fem,
                                                    2 * fem),
                                                child: Text(
                                                  'Pay with Mpesa',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.4642857143 *
                                                        ffem /
                                                        fem,
                                                    color:
                                                        const Color(0xff1f1f1f),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20 * fem,
                                    ),
                                    Container(
                                      // frame1171275005NUH (3031:9006)
                                      padding: EdgeInsets.fromLTRB(7 * fem,
                                          10 * fem, 10 * fem, 10 * fem),
                                      width: 383 * fem,
                                      height: 58 * fem,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff2f5f6),
                                        borderRadius:
                                            BorderRadius.circular(10 * fem),
                                      ),
                                      child: Center(
                                        // followthestepsbelowonceyourece (3031:9005)
                                        child: SizedBox(
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 366 * fem,
                                            ),
                                            child: Text(
                                              'Follow the Steps Below. Once you receive a successful reply from Mpesa. Click the complete button below.',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    1.3550000872 * ffem / fem,
                                                color: const Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20 * fem,
                                    ),
                                    Container(
                                      // enteryoursafaricommobilephonen (3031:9008)
                                      constraints: BoxConstraints(
                                        maxWidth: 367 * fem,
                                      ),
                                      child: Text(
                                        'Enter your Safaricom Mobile Phone Number to pay with below and click Pay\nWhen prompted, enter MPESA PIN',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4642857143 * ffem / fem,
                                          color: const Color(0xff666666),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // frame1QJV (3031:9030)
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10 * fem),
                                  border: Border.all(
                                      color: const Color(0xffc4c4c4)),
                                  color: const Color(0xfffcfcfc),
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
                                        15 * fem, 14 * fem, 15 * fem, 14 * fem),
                                    hintText: '07 | Enter your phone number',
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
                      ),
                      Positioned(
                        // button3cM (3034:8349)
                        left: 100 * fem,
                        top: 714 * fem,
                        child: TextButton(
                          onPressed: () async {
                            _validateInput();
                            if (_textInput.isEmpty) {
                              return;
                            }
                            try {
                              setState(() {
                                _isLoading = true;
                              });
                              String phone = '254${_textInput.substring(1)}';
                              contrib.MyModel result =
                                  await contrib.contributeToChannel(
                                      access_token:
                                          widget.accessToken.toString(),
                                      accountNumber: phone,
                                      amount: double.parse(widget.amount),
                                      channel_id: widget.channelData.channel_id
                                          .toString(),
                                      currency: 'KES',
                                      paymentMethod: 'MPESA');
                              setState(() {
                                _requestId = result.statusUrl;
                                _isLoading = false;
                              });
                              if (result.data?.requestStatus != 'FAILED') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ConfirmationPayment(
                                      accessToken: widget.accessToken,
                                      amount: widget.amount,
                                      channelData: widget.channelData,
                                      requestId: _requestId,
                                      dataFrom: 'payment',
                                    ),
                                  ),
                                );
                                Fluttertoast.showToast(msg: 'Request success');
                                return;
                              }
                              final snackBar = SnackBar(
                                /// need to set following properties for best effect of awesome_snackbar_content
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'On Snap!',
                                  message: 'Something went wrong',

                                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                  contentType: ContentType.failure,
                                ),
                              );

                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
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
                            width: 213 * fem,
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
                                : Center(
                                    child: Center(
                                      child: Text(
                                        'Pay',
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
