// ignore_for_file: must_be_immutable, use_build_context_synchronously, duplicate_ignore

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/logic/channels/payment.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/confirmpayment.dart';
import 'package:changa_changa/widgets/dropDownClose.dart';
import 'package:changa_changa/widgets/dropDownLeave.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../logic/channels/payment.dart' as contrib;

class CardPayment extends StatefulWidget {
  ChannelRead channelData;
  String accessT;
  String amount;
  CardPayment(
      {super.key,
      required this.channelData,
      required this.accessT,
      required this.amount});

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  String? exp;
  String? card;
  String? cvv;
  final _formKey = GlobalKey<FormState>();

  Participant? _admin;
  bool _isLoading = false;
  String? _username;
  String? _requestId;

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
        accessToken: widget.accessT, chanId: widget.channelData.channel_id);
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
            // iphone11promax42mxm (3036:8594)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // autogrouprgg1BWh (L4AgoRxviMrMtvSkvkRgG1)
                  width: 527 * fem,
                  height: height,
                  child: Stack(
                    children: [
                      Positioned(
                        // group11712748287QM (3036:8620)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: SizedBox(
                          width: 414 * fem,
                          height: 896 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // group1171274977RR3 (3036:8621)
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
                                          padding: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 15 * fem),
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
                                                margin: EdgeInsets.fromLTRB(
                                                    26.5 * fem,
                                                    65 * fem,
                                                    26.5 * fem,
                                                    0 * fem),
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
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              113.93 * fem,
                                                              2 * fem,
                                                              0 * fem,
                                                              2 * fem),
                                                      height: double.infinity,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            // participantuiH (2955:14040)
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0 * fem,
                                                                    0 * fem,
                                                                    113.93 *
                                                                        fem,
                                                                    0 * fem),
                                                            child: Text(
                                                              'Payments',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style:
                                                                  SafeGoogleFont(
                                                                'Inter',
                                                                fontSize:
                                                                    18 * ffem,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height:
                                                                    0.8888888889 *
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
                                                                  accessToken:
                                                                      widget
                                                                          .accessT,
                                                                  channelData:
                                                                      widget
                                                                          .channelData,
                                                                )
                                                              : DropDownLeave(
                                                                  accessToken:
                                                                      widget
                                                                          .accessT,
                                                                  channelData:
                                                                      widget
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
                                // rectangle5cA5 (3036:8635)
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // ellipse53Mpm (2967:8571)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 26.52 * fem, 0 * fem),
                                        width: 63 * fem,
                                        height: 63 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(31.5 * fem),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: widget
                                                        .channelData.imageUrl !=
                                                    null
                                                ? NetworkImage(widget
                                                    .channelData.imageUrl!)
                                                : widget.channelData
                                                            .imageFile !=
                                                        null
                                                    ? FileImage(widget
                                                        .channelData.imageFile!)
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${widget.channelData.title}',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 17 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height:
                                                    1.3533593346 * ffem / fem,
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
                                                height:
                                                    1.5789192518 * ffem / fem,
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
                                // buttonF3w (3036:8720)
                                left: 15 * fem,
                                top: 714 * fem,
                                child: TextButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      List<String>? parts = exp?.split('/');
                                      int month = int.tryParse(parts![0]) ?? 0;
                                      int year = int.tryParse(parts[1]) ?? 0;
                                      if (year < 23) {
                                        // Last part is smaller than 23
                                        final snackBar = SnackBar(
                                          /// need to set following properties for best effect of awesome_snackbar_content
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: 'On Snap!',
                                            message:
                                                'plese ensure the card has not expired',

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
                                        return;
                                      }
                                      if (month > 12) {
                                        // Last part is smaller than 23
                                        final snackBar = SnackBar(
                                          /// need to set following properties for best effect of awesome_snackbar_content
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: 'On Snap!',
                                            message: 'Enter a valid month',

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
                                        return;
                                      }
                                      try {
                                        contrib.MyModel result =
                                            await contributeToChannelViaMasterCard(
                                                access_token:
                                                    widget.accessT.toString(),
                                                amount:
                                                    double.parse(widget.amount),
                                                channel_id: widget
                                                    .channelData.channel_id
                                                    .toString(),
                                                currency: 'KES',
                                                paymentMethod: 'CARD',
                                                card_number: card!,
                                                card_exp_month:
                                                    month.toString(),
                                                card_exp_year: year.toString(),
                                                card_cvv: cvv!);
                                        setState(() {
                                          _requestId = result.statusUrl;
                                          _isLoading = false;
                                        });
                                        if (result.data?.requestStatus !=
                                            'FAILED') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ConfirmationPayment(
                                                accessToken: widget.accessT,
                                                amount: widget.amount,
                                                channelData: widget.channelData,
                                                requestId: _requestId,
                                                dataFrom: 'payment',
                                              ),
                                            ),
                                          );
                                          Fluttertoast.showToast(
                                              msg: 'Request success');
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
                                        return;
                                      }
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(122 * fem,
                                        12 * fem, 122 * fem, 12 * fem),
                                    width: 384 * fem,
                                    height: 48 * fem,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff71ae00),
                                      borderRadius:
                                          BorderRadius.circular(50 * fem),
                                    ),
                                    child: _isLoading
                                        ? Center(
                                            child: LoadingAnimationWidget
                                                .progressiveDots(
                                                    color:
                                                        const Color(0xffffffff),
                                                    size: 20),
                                          )
                                        : SizedBox(
                                            // autogroupstjhueH (L4AhVF9vMhvfWGHiCqSTJh)
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: Center(
                                              child: Center(
                                                child: RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 16 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5 * ffem / fem,
                                                      color: const Color(
                                                          0xffffffff),
                                                    ),
                                                    children: [
                                                      const TextSpan(
                                                        text: 'Pay KES. ',
                                                      ),
                                                      TextSpan(
                                                        text: widget.amount,
                                                        style: SafeGoogleFont(
                                                          'Inter',
                                                          fontSize: 16 * ffem,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          height:
                                                              1.5 * ffem / fem,
                                                          color: const Color(
                                                              0xffffffff),
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
                        // frame1171275006S3B (3036:8697)
                        left: 15 * fem,
                        top: 387 * fem,
                        child: SizedBox(
                          width: 510 * fem,
                          height: 281 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupmrujMA9 (L4AhrKP99oaNciSkmVmRuj)
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 9.5 * fem, 0 * fem, 20 * fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // frame49gCR (3036:8724)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 29.5 * fem),
                                      width: 198 * fem,
                                      height: 40 * fem,
                                      child: SizedBox(
                                        // group11712748151Vb (3036:8725)
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // ellipse52xQq (3036:8726)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  12 * fem,
                                                  0 * fem),
                                              width: 40 * fem,
                                              height: 40 * fem,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20 * fem),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                    'assets/new-mobile-2/images/pesalink-1.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              // payfromkcbaccount3hB (3036:8727)
                                              'Pay from card',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w500,
                                                height:
                                                    0.9283593042 * ffem / fem,
                                                letterSpacing:
                                                    -0.2800000334 * fem,
                                                color: const Color(0xff1f1f1f),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // frame1171275005y53 (3036:8714)
                                      padding: EdgeInsets.fromLTRB(
                                          7 * fem, 10 * fem, 7 * fem, 10 * fem),
                                      width: 383 * fem,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff2f5f6),
                                        borderRadius:
                                            BorderRadius.circular(10 * fem),
                                      ),
                                      child: Text(
                                        'Enter your card details to pay',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3550000872 * ffem / fem,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Container(
                                  // group1171275002egy (3038:8745)
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // frame1171275006zVw (3038:8746)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 29 * fem),
                                        padding: EdgeInsets.fromLTRB(15 * fem,
                                            5 * fem, 6 * fem, 4 * fem),
                                        width: 385 * fem,
                                        height: 57 * fem,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffc4c4c4)),
                                          color: const Color(0xfffcfcfc),
                                          borderRadius:
                                              BorderRadius.circular(10 * fem),
                                        ),
                                        child: Center(
                                          // smalllabelregular12pxsJq (3038:8747)
                                          child: SizedBox(
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 364 * fem,
                                              ),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please enter a valid card number';
                                                  }
                                                  card = value;
                                                  return null;
                                                },
                                                onSaved: (value) {
                                                  card = value;
                                                },
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  hintText: 'Card number',
                                                  hintStyle: TextStyle(
                                                      color: Color(0xff78828a)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // autogroupqexbyMs (L4Ai9UZDcLJzqmAxwaqeXb)
                                        width: double.infinity,
                                        height: 57 * fem,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // frame11712750097ys (3038:8749)
                                              left: 0 * fem,
                                              top: 0 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 190 * fem,
                                                  height: 57 * fem,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10 * fem),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffc4c4c4)),
                                                      color: const Color(
                                                          0xfffcfcfc),
                                                    ),
                                                    child: TextFormField(
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter a valid expiry';
                                                        }
                                                        exp = value;
                                                        return null;
                                                      },
                                                      onSaved: (value) {
                                                        exp = value;
                                                      },
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
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
                                                                5 * fem,
                                                                15 * fem,
                                                                4 * fem),
                                                        hintText: 'MM/YY',
                                                        hintStyle:
                                                            const TextStyle(
                                                          color:
                                                              Color(0xff78828a),
                                                        ),
                                                      ),
                                                      style: SafeGoogleFont(
                                                        'Inter',
                                                        fontSize: 12 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height:
                                                            1.5 * ffem / fem,
                                                        letterSpacing:
                                                            0.06 * fem,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // frame1171275010wCD (3038:8752)
                                              left: 199 * fem,
                                              top: 0 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 190 * fem,
                                                  height: 57 * fem,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10 * fem),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffc4c4c4)),
                                                      color: const Color(
                                                          0xfffcfcfc),
                                                    ),
                                                    child: TextFormField(
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter a cvv';
                                                        }
                                                        cvv = value;
                                                        return null;
                                                      },
                                                      onSaved: (value) {
                                                        cvv = value;
                                                      },
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
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
                                                                5 * fem,
                                                                15 * fem,
                                                                4 * fem),
                                                        hintText: 'CVV',
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
                                                        height:
                                                            1.5 * ffem / fem,
                                                        letterSpacing:
                                                            0.06 * fem,
                                                        color: const Color(
                                                            0xff000000),
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
