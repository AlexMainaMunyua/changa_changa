// ignore_for_file: must_be_immutable, use_build_context_synchronously, duplicate_ignore, file_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/channel_list.dart';
import 'package:changa_changa/new-mobile-2/paymentselector.dart';
import 'package:changa_changa/new-mobile-2/startPage.dart';
import 'package:changa_changa/widgets/bottomnavbardash.dart';
import 'package:changa_changa/widgets/dropDownClose.dart';
import 'package:changa_changa/widgets/dropDownLeave.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logic/statements/statements.dart';

class ChannelDashboard extends StatefulWidget {
  ChannelRead channelData;
  String accessToken;
  ChannelDashboard(
      {super.key, required this.channelData, required this.accessToken});

  @override
  State<ChannelDashboard> createState() => _ChannelDashboardState();
}

class _ChannelDashboardState extends State<ChannelDashboard> {
  bool _isLoading = false;
  String? _accessToken;
  String _errorTextValue = '';
  String _textInput = '';
  Participant? _admin;
  final _textControllerId = TextEditingController();
  List<Payment> channelStatements = [];
  String? _phone;

  Future<String?> getSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('full_name');
  }

  Future<String?> getUserPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone_number');
  }

  Future<void> _loaduserData() async {
    final savedUsername = await getSavedUsername();
    final phoneNumber = await getUserPhoneNumber();
    if (savedUsername != null) {
      setState(() {
        _phone = phoneNumber;
      });
    }
  }

  Future<void> _loadCurrentStatemets(
      String accessToken, String channelNumber) async {
    // List<Payment> statements =
    //     await fetchStatements(accessToken, channelNumber);
    List<Payment> statements = [
      Payment(
        transactionType: 'Credit',
        amount: 100.50,
        reason: 'Payment for service',
        paymentReferenceId: 'REF123456',
        transactionId: 'TX123456789',
        user : User(
          firstName: "Alex",
          username: "alex123",
          emailAddress: "alex@example.com",
          phoneNumber: "123-456-7890",
          isActive: true,
          userId: "U12345",
          title: "Mr.",
          dateJoinedUtc: DateTime.utc(2023, 5, 1),
        ),
        channelId: 'MobileApp',
        timestampUtc: DateTime.utc(2025, 2, 14, 10, 30),
      ),
      Payment(
        transactionType: 'Credit',
        amount: 100.50,
        reason: 'Payment for service',
        paymentReferenceId: 'REF123456',
        transactionId: 'TX123456789',
        user : User(
          firstName: "Alex",
          username: "alex123",
          emailAddress: "alex@example.com",
          phoneNumber: "123-456-7890",
          isActive: true,
          userId: "U12345",
          title: "Mr.",
          dateJoinedUtc: DateTime.utc(2023, 5, 1),
        ),
        channelId: 'MobileApp',
        timestampUtc: DateTime.utc(2025, 2, 14, 10, 30),
      ),
      Payment(
        transactionType: 'Credit',
        amount: 100.50,
        reason: 'Payment for service',
        paymentReferenceId: 'REF123456',
        transactionId: 'TX123456789',
        user : User(
          firstName: "Alex",
          username: "alex123",
          emailAddress: "alex@example.com",
          phoneNumber: "123-456-7890",
          isActive: true,
          userId: "U12345",
          title: "Mr.",
          dateJoinedUtc: DateTime.utc(2023, 5, 1),
        ),
        channelId: 'MobileApp',
        timestampUtc: DateTime.utc(2025, 2, 14, 10, 30),
      ),
      Payment(
        transactionType: 'Credit',
        amount: 1200000.50,
        reason: 'Payment for service',
        paymentReferenceId: 'REF123456',
        transactionId: 'TX123456789',
        user : User(
          firstName: "Alex",
          username: "alex123",
          emailAddress: "alex@example.com",
          phoneNumber: "123-456-7890",
          isActive: true,
          userId: "U12345",
          title: "Mr.",
          dateJoinedUtc: DateTime.utc(2023, 5, 1),
        ),
        channelId: 'MobileApp',
        timestampUtc: DateTime.utc(2025, 2, 14, 10, 30),
      ),
      Payment(
        transactionType: 'Credit',
        amount: 100.50,
        reason: 'Payment for service',
        paymentReferenceId: 'REF123456',
        transactionId: 'TX123456789',
        user : User(
          firstName: "Alex",
          username: "alex123",
          emailAddress: "alex@example.com",
          phoneNumber: "123-456-7890",
          isActive: true,
          userId: "U12345",
          title: "Mr.",
          dateJoinedUtc: DateTime.utc(2023, 5, 1),
        ),
        channelId: 'MobileApp',
        timestampUtc: DateTime.utc(2025, 2, 14, 10, 30),
      ),
      Payment(
        transactionType: 'Credit',
        amount: 100.50,
        reason: 'Payment for service',
        paymentReferenceId: 'REF123456',
        transactionId: 'TX123456789',
        user : User(
          firstName: "Alex",
          username: "alex123",
          emailAddress: "alex@example.com",
          phoneNumber: "123-456-7890",
          isActive: true,
          userId: "U12345",
          title: "Mr.",
          dateJoinedUtc: DateTime.utc(2023, 5, 1),
        ),
        channelId: 'MobileApp',
        timestampUtc: DateTime.utc(2025, 2, 14, 10, 30),
      ),
      Payment(
        transactionType: 'Credit',
        amount: 100.50,
        reason: 'Payment for service',
        paymentReferenceId: 'REF123456',
        transactionId: 'TX123456789',
        user : User(
          firstName: "Alex",
          username: "alex123",
          emailAddress: "alex@example.com",
          phoneNumber: "123-456-7890",
          isActive: true,
          userId: "U12345",
          title: "Mr.",
          dateJoinedUtc: DateTime.utc(2023, 5, 1),
        ),
        channelId: 'MobileApp',
        timestampUtc: DateTime.utc(2025, 2, 14, 10, 30),
      ),
      Payment(
        transactionType: 'Debit',
        amount: 200.75,
        reason: 'Refund for order #456',
        paymentReferenceId: 'REF789012',
        transactionId: 'TX987654321',
     user : User(
    firstName: "Alex",
    username: "alex123",
    emailAddress: "alex@example.com",
    phoneNumber: "123-456-7890",
    isActive: true,
    userId: "U12345",
    title: "Mr.",
    dateJoinedUtc: DateTime.utc(2023, 5, 1),
    ),
        channelId: 'WebApp',
        timestampUtc: DateTime.utc(2025, 2, 13, 15, 45),
      ),
      Payment(
        transactionType: 'Credit',
        amount: 50.25,
        reason: 'Bonus payment',
        paymentReferenceId: 'REF345678',
        transactionId: 'TX192837465',
        user : User(
          firstName: "Alex",
          username: "alex123",
          emailAddress: "alex@example.com",
          phoneNumber: "123-456-7890",
          isActive: true,
          userId: "U12345",
          title: "Mr.",
          dateJoinedUtc: DateTime.utc(2023, 5, 1),
        ),
        channelId: 'MobileApp',
        timestampUtc: DateTime.utc(2025, 2, 12, 9, 15),
      ),
      Payment(
        transactionType: 'Debit',
        amount: 75.00,
        reason: 'Payment for subscription',
        paymentReferenceId: 'REF234567',
        transactionId: 'TX564738291',
        user : User(
          firstName: "Alex",
          username: "alex123",
          emailAddress: "alex@example.com",
          phoneNumber: "123-456-7890",
          isActive: true,
          userId: "U12345",
          title: "Mr.",
          dateJoinedUtc: DateTime.utc(2023, 5, 1),
        ),
        channelId: 'WebApp',
        timestampUtc: DateTime.utc(2025, 2, 11, 18, 00),
      ),
    ];
    if (statements.isNotEmpty) {

      setState(() {
        channelStatements = statements;
      });
    }
  }

  Future<void> _loadChannelData({String? accessToken, String? chanId}) async {
    setState(() {
      _isLoading = true;
    });
  //  ChannelRead? data = await readChannel(chanId!, accessToken!);
    ChannelRead data = ChannelRead();
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
   //   widget.channelData = data;
      _isLoading = false;
    });
  }

  double percetage({required String target, required double moneyin}) {
    return (moneyin / double.parse(target)) * 100;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _accessToken = widget.accessToken;
    });
    _loaduserData();
    _loadCurrentStatemets(widget.accessToken, widget.channelData.channel_id!);
    _loadChannelData(
        accessToken: _accessToken, chanId: widget.channelData.channel_id!);
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

  String formatDate(DateTime date, String format) {
    return DateFormat(format).format(date);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    final height = MediaQuery.of(context).size.height;
    // return Scaffold();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _loadCurrentStatemets(
              widget.accessToken, widget.channelData.channel_id!);
          _loadChannelData(
              accessToken: _accessToken,
              chanId: widget.channelData.channel_id!);
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            child: Container(
              // iphone11promax28QYR (2967:8427)
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    // group1171274828ceV (2967:8453)
                    width: double.infinity,
                    height: height,
                    child: Stack(
                      children: [
                        Positioned(
                          // group1171274977wgm (2967:8454)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: SizedBox(
                            width: 414 * fem,
                            height: 323 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // frame3s4d (2967:8455)
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
                                          // frame1573dxu (2967:8456)
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  setState(
                                                    () {
                                                      _isLoading = true;
                                                    },
                                                  );
                                                  try {
                                                    List<dynamic>?
                                                        userChannelListData =
                                                        await userChannelList(
                                                            _accessToken!);

                                                    if (userChannelListData
                                                        .isNotEmpty) {
                                                      List<Channels>?
                                                          userChannels =
                                                          userChannelListData
                                                              .map((item) =>
                                                                  Channels
                                                                      .fromJson(
                                                                          item))
                                                              .toList();

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ChanelList(
                                                                      userChannelList:
                                                                          userChannels)));
                                                    } else {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const StartPage(),
                                                        ),
                                                      );
                                                    }
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
                                                    ScaffoldMessenger.of(
                                                        context)
                                                      ..hideCurrentSnackBar()
                                                      ..showSnackBar(snackBar);
                                                    setState(() {
                                                      _isLoading = false;
                                                    });
                                                  }
                                                },
                                                child: _isLoading
                                                    ? LoadingAnimationWidget
                                                        .inkDrop(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                255,
                                                                255,
                                                                255),
                                                            size: 20)
                                                    : SizedBox(
                                                        // navbarYpy (2967:8457)
                                                        width: 20.08 * fem,
                                                        height: 20 * fem,
                                                        child: Image.asset(
                                                          'assets/new-mobile-2/images/nav-bar-nX3.png',
                                                          width: 20.08 * fem,
                                                          height: 20 * fem,
                                                        ),
                                                      ),
                                              ),
                                              Container(
                                                // autogroupwug5Gky (WNziMzCMu7YdeM1aogWuG5)
                                                padding: EdgeInsets.fromLTRB(
                                                    67.93 * fem,
                                                    2 * fem,
                                                    0 * fem,
                                                    2 * fem),
                                                height: double.infinity,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      // campaigndashboardCed (2967:8462)
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0 * fem,
                                                              0 * fem,
                                                              67.93 * fem,
                                                              0 * fem),
                                                      child: Text(
                                                        'Campaign Dashboard',
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
                                                    _admin?.user?.phone_number ==
                                                            _phone
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
                          // rectangle5Ksf (2967:8468)
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
                        // TODO: Added part
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
                                                    height: 1.2999999183 *
                                                        ffem /
                                                        fem,
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
                                                    height: 1.2999999306 *
                                                        ffem /
                                                        fem,
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
                                                    height: 1.2999999523 *
                                                        ffem /
                                                        fem,
                                                    color:
                                                        const Color(0xe5000000),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'KES',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.2999999183 *
                                                        ffem /
                                                        fem,
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
                                            text:
                                                '${widget.channelData.target}',
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
                                        // Container(
                                        //   // 4Jm (2967:8506)
                                        //   margin: EdgeInsets.fromLTRB(0 * fem,
                                        //       0 * fem, 3.42 * fem, 4 * fem),
                                        //   child: Text(
                                        //     '${percetage(target: widget.channelData.target!, moneyin: widget.channelData.total_collected!)}',
                                        //     style: SafeGoogleFont(
                                        //       'Inter',
                                        //       fontSize: 10 * ffem,
                                        //       fontWeight: FontWeight.w500,
                                        //       height: 1.2 * ffem / fem,
                                        //       color: const Color(0x7f000000),
                                        //     ),
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   width: double.infinity,
                                        //   height: 7 * fem,
                                        //   child: LinearPercentIndicator(
                                        //     lineHeight: double.infinity,
                                        //     percent: percetage(
                                        //                     target: widget
                                        //                         .channelData
                                        //                         .target!,
                                        //                     moneyin: widget
                                        //                         .channelData
                                        //                         .total_collected!) /
                                        //                 100 >
                                        //             1.0
                                        //         ? 1
                                        //         : percetage(
                                        //                 target: widget
                                        //                     .channelData
                                        //                     .target!,
                                        //                 moneyin: widget
                                        //                     .channelData
                                        //                     .total_collected!) /
                                        //             100,
                                        //     animation: true,
                                        //     barRadius:
                                        //         const Radius.circular(16),
                                        //     progressColor:
                                        //         const Color(0xffadd354),
                                        //     backgroundColor:
                                        //         const Color.fromARGB(
                                        //             255, 255, 255, 255),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // group1171274976qiq (2967:8507)
                          left: 15 * fem,
                          top: 400 * fem,
                          child: SizedBox(
                            width: 384 * fem,
                            height: 0.45 * height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // recentpaymentsLvV (2967:8543)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                  child: Text(
                                    'Recent Statements',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 0.9121621847 * ffem / fem,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ),
                                channelStatements.isEmpty
                                    ? Expanded(
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.search_sharp,
                                                size: 40,
                                                color: Color(0xe5606060),
                                              ),
                                              Text(
                                                'No Transactions',
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 14 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height:
                                                      1.2999999183 * ffem / fem,
                                                  color:
                                                      const Color(0xe5606060),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: channelStatements.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              // frame1171274971fC5 (2967:8508)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  0 * fem,
                                                  22 * fem),
                                              width: double.infinity,
                                              height: 38 * fem,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        // group1171274975bLd (2967:8509)
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                2.5 * fem,
                                                                16 * fem,
                                                                5.5 * fem),
                                                        width: 30 * fem,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffffd0bd),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15 * fem),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            channelStatements[
                                                                            index]
                                                                        .user ==
                                                                    null
                                                                ? 'PVL'
                                                                : channelStatements[
                                                                        index]
                                                                    .user!
                                                                    .firstName![
                                                                        0]
                                                                    .toUpperCase(),
                                                            style:
                                                                SafeGoogleFont(
                                                              'Inter',
                                                              fontSize:
                                                                  11.3513507843 *
                                                                      ffem,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height:
                                                                  1.2857143817 *
                                                                      ffem /
                                                                      fem,
                                                              color: const Color(
                                                                  0xff000000),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        // michaeldoe96573092zNm (2967:8513)
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                120 * fem,
                                                                0 * fem),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 200 * fem,
                                                        ),
                                                        child: RichText(
                                                          text: TextSpan(
                                                            style:
                                                                SafeGoogleFont(
                                                              'Inter',
                                                              fontSize:
                                                                  14 * ffem,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height:
                                                                  1.3533593587 *
                                                                      ffem /
                                                                      fem,
                                                              letterSpacing:
                                                                  0.14 * fem,
                                                              color: const Color(
                                                                  0xff000000),
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: channelStatements[index]
                                                                            .user ==
                                                                        null
                                                                    ? 'Paid Via Link\n'
                                                                    : '${channelStatements[index].user!.firstName![0].toUpperCase() + channelStatements[index].user!.firstName!.substring(1).toLowerCase()}\n',
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Inter',
                                                                  fontSize:
                                                                      14 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  height:
                                                                      1.3533593587 *
                                                                          ffem /
                                                                          fem,
                                                                  letterSpacing:
                                                                      0.14 *
                                                                          fem,
                                                                  color: const Color(
                                                                      0xff000000),
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: channelStatements[index]
                                                                            .user ==
                                                                        null
                                                                    ? channelStatements[
                                                                            index]
                                                                        .paymentReferenceId
                                                                    : channelStatements[
                                                                            index]
                                                                        .user!
                                                                        .username,
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Inter',
                                                                  fontSize:
                                                                      9 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height:
                                                                      2.105225669 *
                                                                          ffem /
                                                                          fem,
                                                                  letterSpacing:
                                                                      0.14 *
                                                                          fem,
                                                                  color: const Color(
                                                                      0xb2000000),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    // frame15753TX (2967:8512)
                                                    height: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          // kes10000000000060923FCD (2967:8514)
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 133 * fem,
                                                          ),
                                                          child: RichText(
                                                            textAlign:
                                                                TextAlign.right,
                                                            text: TextSpan(
                                                              style:
                                                                  SafeGoogleFont(
                                                                'Inter',
                                                                fontSize:
                                                                    14 * ffem,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height:
                                                                    1.3533593587 *
                                                                        ffem /
                                                                        fem,
                                                                letterSpacing:
                                                                    0.14 * fem,
                                                                color: const Color(
                                                                    0xff000000),
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                  text: channelStatements[index]
                                                                              .user ==
                                                                          null
                                                                      ? '+ KES. ${channelStatements[index].amount}\n'
                                                                      : channelStatements[index].transactionType ==
                                                                              'credit'
                                                                          ? '+ KES. ${channelStatements[index].amount}\n'
                                                                          : '- KES. ${channelStatements[index].amount}\n',
                                                                  style:
                                                                      SafeGoogleFont(
                                                                    'Inter',
                                                                    fontSize:
                                                                        12 *
                                                                            ffem,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height:
                                                                        1.5789192518 *
                                                                            ffem /
                                                                            fem,
                                                                    letterSpacing:
                                                                        0.14 *
                                                                            fem,
                                                                    color: const Color(
                                                                        0xff000000),
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: formatDate(
                                                                      channelStatements[
                                                                              index]
                                                                          .timestampUtc,
                                                                      "dd / MM / yyyy"),
                                                                  style:
                                                                      SafeGoogleFont(
                                                                    'Inter',
                                                                    fontSize:
                                                                        10 *
                                                                            ffem,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height:
                                                                        1.8947031021 *
                                                                            ffem /
                                                                            fem,
                                                                    letterSpacing:
                                                                        0.14 *
                                                                            fem,
                                                                    color: const Color(
                                                                        0xb2000000),
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
                                            );
                                          },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 130 * fem,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    12 * fem, 10.5 * fem, 12 * fem, 10.5 * fem),
                width: 445 * fem,
                height: 61 * fem,
                decoration: const BoxDecoration(
                  color: Color(0xffeaeaea),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      // kes1mb (2967:8545)
                      'KES.',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.1428571429 * ffem / fem,
                        color: const Color(0xff3d4043),
                      ),
                    ),
                    SizedBox(
                      width: 5 * fem,
                    ),
                    Container(
                      // rectangle4023Vwf (2967:8546)
                      width: 302 * fem,
                      height: 38 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100 * fem),
                        color: const Color(0xffffffff),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(
                            () {
                              if (value.contains(' ')) {
                                _errorTextValue = 'Don\'t use blank spaces';
                              } else {
                                _errorTextValue = '';
                              }
                            },
                          );
                        },
                        controller: _textControllerId,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorText:
                              _errorTextValue.isEmpty ? null : _errorTextValue,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              15 * fem, 15 * fem, 15 * fem, 15 * fem),
                          hintText: 'Amount',
                          hintStyle: const TextStyle(color: Color(0xff78828a)),
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
                    SizedBox(
                      width: 10 * fem,
                    ),
                    InkWell(
                      // group1171274931xKT (2967:8547)
                      onTap: () async {
                        _validateInput();
                        if (_textInput.isEmpty) {
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentSelector(
                              amount: _textInput,
                              accessToken: _accessToken!,
                              channelData: widget.channelData,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 40 * fem,
                        height: 40 * fem,
                        child: Image.asset(
                          'assets/new-mobile-2/images/group-1171274931-mbf.png',
                          width: 40 * fem,
                          height: 40 * fem,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomNavBarDash(
                channelReadData: widget.channelData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
