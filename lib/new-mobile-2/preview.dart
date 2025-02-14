// ignore_for_file: must_be_immutable, use_build_context_synchronously, duplicate_ignore

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/ChannelDashboard.dart';
import 'package:changa_changa/new-mobile-2/channel_list.dart';
import 'package:changa_changa/new-mobile-2/startPage.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class PreviewChannel extends StatefulWidget {
  ChannelRead chanelData;
  String loadFrom;
  String? inviteCode;
  PreviewChannel(
      {super.key,
      required this.chanelData,
      required this.loadFrom,
      this.inviteCode});

  @override
  State<PreviewChannel> createState() => _PreviewChannelState();
}

class _PreviewChannelState extends State<PreviewChannel> {
  String? _username;
  bool _isLoading = false;
  String? _accessToken;
  String? _title;
  String channelStatus = 'Pending submition';

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<String?> getSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('full_name');
  }

  Future<String?> getTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('title');
  }

  Future<void> _loaduserData() async {
    final savedUsername = await getSavedUsername();
    final accessToken = await getAccessToken();
    final title = await getTitle();
    if (savedUsername != null) {
      setState(() {
        _username = savedUsername;
        _accessToken = accessToken;
        _title = title;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loaduserData();
    if (widget.loadFrom == 'preview') {
      setState(() {
        channelStatus = "In Review";
      });
    }
    if (widget.loadFrom == 'join') {
      channelStatus = 'Pending join';
    }
  }

  String formatDate(DateTime date, String format) {
    return DateFormat(format).format(date);
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
            // iphone11promax19LUR (2937:12615)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group1171274828BV3 (2937:12641)
                  width: double.infinity,
                  height: 813,
                  child: Stack(
                    children: [
                      Positioned(
                        // group11712749777tV (2943:13600)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: SizedBox(
                          width: 414 * fem,
                          height: 323 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // frame33XF (2937:12643)
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
                                        // frame1572qT7 (2937:12644)
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
                                                // navbarMgM (2937:12645)
                                                width: 20.08 * fem,
                                                height: 20 * fem,
                                                child: Image.asset(
                                                  'assets/new-mobile-2/images/nav-bar-NTB.png',
                                                  width: 20.08 * fem,
                                                  height: 20 * fem,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // autogroupww4hHa1 (WNzeo6971FLwppw9e6wW4H)
                                              padding: EdgeInsets.fromLTRB(
                                                  85.43 * fem,
                                                  2 * fem,
                                                  0 * fem,
                                                  2 * fem),
                                              height: double.infinity,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // campaigndetailsDiZ (2937:12650)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        85.43 * fem,
                                                        0 * fem),
                                                    child: Text(
                                                      'Campaign Details',
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
                        // rectangle5x3s (2937:12655)
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
                        // group1171274970U2D (2952:13978)
                        left: 20 * fem,
                        top: 134 * fem,
                        child: SizedBox(
                          width: 390 * fem,
                          height: 62 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // ellipse53b6q (2952:13979)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 26.52 * fem, 0 * fem),
                                width: 63 * fem,
                                height: 63 * fem,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(31.5 * fem),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: widget.chanelData.imageUrl != null
                                        ? NetworkImage(
                                            widget.chanelData.imageUrl!)
                                        : widget.chanelData.imageFile != null
                                            ? FileImage(
                                                widget.chanelData.imageFile!)
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
                                      '${widget.chanelData.title}',
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
                                      channelStatus,
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3533593587 * ffem / fem,
                                        letterSpacing: 0.14 * fem,
                                        color: const Color(0xb2000000),
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
                        // group1171274969B53 (2937:12856)
                        left: 0 * fem,
                        top: 340 * fem,
                        child: SizedBox(
                          width: 414 * fem,
                          height: 474 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // frame15725w7 (2937:12694)
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 17 * fem, 20 * fem),
                                width: double.infinity,
                                height: 149 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0x4c000000)),
                                ),
                                child: Center(
                                  // descriptionloremipsumdolorsita (2937:12695)
                                  child: SizedBox(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      constraints: BoxConstraints(
                                        maxWidth: 382 * fem,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3533593587 * ffem / fem,
                                            letterSpacing: 0.14 * fem,
                                            color: const Color(0xff000000),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Description\n',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height:
                                                    1.3533593587 * ffem / fem,
                                                letterSpacing: 0.14 * fem,
                                                color: const Color(0xff00313d),
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  widget.chanelData.description,
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    1.3533593587 * ffem / fem,
                                                letterSpacing: 0.14 * fem,
                                                color: const Color(0xb2000000),
                                              ),
                                            ),
                                            TextSpan(
                                              text: '.',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    1.3533593587 * ffem / fem,
                                                letterSpacing: 0.14 * fem,
                                                color: const Color(0xb2000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // frame1574eAu (2937:12683)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 15 * fem, 20 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xccb9b9b9)),
                                ),
                                child: Align(
                                  // goaleducationBRj (2937:12684)
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 230 * fem,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3533593587 * ffem / fem,
                                            letterSpacing: 0.14 * fem,
                                            color: const Color(0xff000000),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Goal\n',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height:
                                                    1.3533593587 * ffem / fem,
                                                letterSpacing: 0.14 * fem,
                                                color: const Color(0xff00313d),
                                              ),
                                            ),
                                            TextSpan(
                                              text: widget.loadFrom != 'create'
                                                  ? widget.chanelData.category!
                                                      .displayName
                                                  : '${widget.chanelData.categ}',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    1.3533593587 * ffem / fem,
                                                letterSpacing: 0.14 * fem,
                                                color: const Color(0xb2000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // frame1576Fa1 (2937:12685)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 15 * fem, 20 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xccb9b9b9)),
                                ),
                                child: Align(
                                  // createdbyjanedoebNy (2937:12686)
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 200 * fem,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3533593587 * ffem / fem,
                                            letterSpacing: 0.14 * fem,
                                            color: const Color(0xff000000),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Created by:\n',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height:
                                                    1.3533593587 * ffem / fem,
                                                letterSpacing: 0.14 * fem,
                                                color: const Color(0xff00313d),
                                              ),
                                            ),
                                            TextSpan(
                                              text: widget.loadFrom ==
                                                          'create' ||
                                                      widget.loadFrom ==
                                                          'preview'
                                                  ? _username == null
                                                      ? "Usernamei"
                                                      : '$_title ${_username![0].toUpperCase() + _username!.substring(1).toLowerCase()}'
                                                  : widget.chanelData.creator
                                                      ?.first_name,
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    1.3533593587 * ffem / fem,
                                                letterSpacing: 0.14 * fem,
                                                color: const Color(0xb2000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // frame15775hT (2937:12687)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 9 * fem),
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 15 * fem, 20 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xccb9b9b9)),
                                ),
                                child: Align(
                                  // datecreated06092023z3j (2937:12688)
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 98 * fem,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3533593587 * ffem / fem,
                                            letterSpacing: 0.14 * fem,
                                            color: const Color(0xff000000),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Date Created:\n',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height:
                                                    1.3533593587 * ffem / fem,
                                                letterSpacing: 0.14 * fem,
                                                color: const Color(0xff00313d),
                                              ),
                                            ),
                                            TextSpan(
                                              text: widget.loadFrom == ''
                                                  ? formatDate(
                                                      widget.chanelData
                                                              .created_date_utc
                                                          as DateTime,
                                                      "dd / MM / yyyy")
                                                  : formatDate(DateTime.now(),
                                                      "dd / MM / yyyy"),
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    1.3533593587 * ffem / fem,
                                                letterSpacing: 0.14 * fem,
                                                color: const Color(0xb2000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // byjoiningthecampaigniagreetote (2990:9330)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 59 * fem, 27 * fem),
                                child: Text(
                                  'By joining the campaign I agree to terms and conditions ',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.8333333333 * ffem / fem,
                                    letterSpacing: 0.06 * fem,
                                    color: const Color(0xff666666),
                                  ),
                                ),
                              ),
                              Container(
                                // group11712749677AH (2937:12696)
                                margin: EdgeInsets.fromLTRB(
                                    15 * fem, 0 * fem, 15 * fem, 0 * fem),
                                width: double.infinity,
                                height: 48 * fem,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(100 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    widget.loadFrom == 'preview'
                                        ? const SizedBox()
                                        : Container(
                                            // frame1171274967Qv5 (2937:12697)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 8 * fem, 0 * fem),
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
                                                  'assets/new-mobile-2/images/frame-1171274967-Shf.png',
                                                  width: 48 * fem,
                                                  height: 48 * fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                    widget.loadFrom == 'preview'
                                        ? TextButton(
                                            // frame1171274968hPP (2937:12699)
                                            onPressed: () async {
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
                                                  List<Channels>? userChannels =
                                                      userChannelListData
                                                          .map((item) =>
                                                              Channels.fromJson(
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
                                                  84 * fem,
                                                  12 * fem,
                                                  84 * fem,
                                                  12 * fem),
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff71ae00),
                                                borderRadius:
                                                    BorderRadius.circular(
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
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          // joincampaignQYh (2937:12700)
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0 * fem,
                                                                    0 * fem,
                                                                    10 * fem,
                                                                    0 * fem),
                                                            child: Text(
                                                              'Back To Home',
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
                                                          // vector12iJV (2937:12701)
                                                          width: 14 * fem,
                                                          height: 14 * fem,
                                                          child: Image.asset(
                                                            'assets/new-mobile-2/images/vector-12-YZw.png',
                                                            width: 14 * fem,
                                                            height: 14 * fem,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            ),
                                          )
                                        : widget.loadFrom == 'create'
                                            ? TextButton(
                                                // frame1171274968hPP (2937:12699)
                                                onPressed: () async {
                                                  setState(() {
                                                    _isLoading = true;
                                                  });
                                                  try {
                                                    if (_accessToken!
                                                        .isNotEmpty) {
                                                      final chan =
                                                          await createChannel(
                                                              widget.chanelData,
                                                              _accessToken!);
                                                      setState(() {
                                                        widget.chanelData =
                                                            chan;
                                                        widget.loadFrom =
                                                            'preview';
                                                        channelStatus =
                                                            'In Review';
                                                        _isLoading = false;
                                                      });
                                                    } else {
                                                      final snackBar = SnackBar(
                                                        /// need to set following properties for best effect of awesome_snackbar_content
                                                        elevation: 0,
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        content:
                                                            AwesomeSnackbarContent(
                                                          title: 'On Snap!',
                                                          message:
                                                              'Something went wrong',

                                                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                          contentType:
                                                              ContentType
                                                                  .failure,
                                                        ),
                                                      );

                                                      // ignore: use_build_context_synchronously
                                                      ScaffoldMessenger.of(
                                                          context)
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(
                                                            snackBar);
                                                      setState(() {
                                                        _isLoading = false;
                                                      });
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
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      76 * fem,
                                                      12 * fem,
                                                      76 * fem,
                                                      12 * fem),
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff71ae00),
                                                    borderRadius:
                                                        BorderRadius.circular(
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
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              // joincampaignQYh (2937:12700)
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .fromLTRB(
                                                                        0 * fem,
                                                                        0 * fem,
                                                                        0 *
                                                                            fem,
                                                                        0 * fem),
                                                                child: Text(
                                                                  'Create Campaign',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      SafeGoogleFont(
                                                                    'Inter',
                                                                    fontSize:
                                                                        16 *
                                                                            ffem,
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
                                                              // vector12iJV (2937:12701)
                                                              width: 14 * fem,
                                                              height: 14 * fem,
                                                              child:
                                                                  Image.asset(
                                                                'assets/new-mobile-2/images/vector-12-YZw.png',
                                                                width: 14 * fem,
                                                                height:
                                                                    14 * fem,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                ),
                                              )
                                            : TextButton(
                                                // frame1171274968hPP (2937:12699)
                                                onPressed: () async {
                                                  try {
                                                    setState(() {
                                                      _isLoading = true;
                                                    });
                                                    await joinChannel(
                                                        accessToken:
                                                            _accessToken!,
                                                        channel_id: widget
                                                            .chanelData
                                                            .channel_id!,
                                                        code:
                                                            widget.inviteCode!);
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChannelDashboard(
                                                          channelData:
                                                              widget.chanelData,
                                                          accessToken:
                                                              _accessToken!,
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
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      86 * fem,
                                                      12 * fem,
                                                      86 * fem,
                                                      12 * fem),
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff71ae00),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100 * fem),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                        // joincampaignQYh (2937:12700)
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0 * fem,
                                                                  0 * fem,
                                                                  10 * fem,
                                                                  0 * fem),
                                                          child: Text(
                                                            'Join Campaign',
                                                            textAlign: TextAlign
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
                                                        // vector12iJV (2937:12701)
                                                        width: 14 * fem,
                                                        height: 14 * fem,
                                                        child: Image.asset(
                                                          'assets/new-mobile-2/images/vector-12-YZw.png',
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
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // card2a5 (2937:12702)
                        left: 0 * fem,
                        top: 218 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              15 * fem, 17 * fem, 15 * fem, 17 * fem),
                          width: 414 * fem,
                          height: 124 * fem,
                          decoration: const BoxDecoration(
                            color: Color(0x0c043e4d),
                          ),
                          child: Container(
                            // frame1560jUV (I2937:12702;1:871)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 129 * fem, 24 * fem),
                            width: 255 * fem,
                            height: 66 * fem,
                            child: Align(
                              // GDX (I2937:12702;1:872)
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
                                          text: 'Campaign Target\n',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2999999183 * ffem / fem,
                                            color: const Color(0xcc606060),
                                          ),
                                        ),
                                        TextSpan(
                                          text: widget.chanelData.target,
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 22 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2999999306 * ffem / fem,
                                            color: const Color(0xff00313d),
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 24 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2999999523 * ffem / fem,
                                            color: const Color(0xe5000000),
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'KSE',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2999999183 * ffem / fem,
                                            color: const Color(0xcc606060),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
