// ignore_for_file: must_be_immutable, use_build_context_synchronously, duplicate_ignore

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/main.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/ChannelDashboard.dart';
import 'package:changa_changa/new-mobile-2/create-campaign.dart';
import 'package:changa_changa/new-mobile-2/joinchannel.dart';
import 'package:changa_changa/new-mobile-2/preview.dart';
import 'package:changa_changa/new-mobile-2/startPage.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChanelList extends StatefulWidget {
  List<Channels> userChannelList;
  ChanelList({Key? key, required this.userChannelList}) : super(key: key);


  @override
  State<ChanelList> createState() => _ChanelListState();
}

class _ChanelListState extends State<ChanelList> {
  String? _accessToken;
  int? _isLoadingChannel;
  List<Channels>? channelList;
  bool channelStatusLoading = false;

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<String?> getSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('full_name');
  }

  Future<void> _loaduserData() async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      setState(() {
        _accessToken = accessToken;
      });
    }else{
      _accessToken = "";
    }
  }

  @override
  void initState() {
    super.initState();
    _loaduserData();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.view_list,
        backgroundColor: Colors.green,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.add),
              label: 'Create Campaign',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateCampaign(),
                  ),
                );
              }),
          SpeedDialChild(
              child: const Icon(Icons.join_full),
              label: 'Join Campaign',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JoinChannel(),
                  ),
                );
              })
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            // iphone11promax279Pw (2965:9078)
            width: double.infinity,

            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group1171274828ZiZ (2965:9104)
                  width: double.infinity,
                  height: height,
                  child: Stack(
                    children: [
                      Positioned(
                        // group11712749777EH (2965:9105)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: SizedBox(
                          width: 414 * fem,
                          height: 323 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // frame3Rkm (2965:9106)
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
                                        // frame1573EiD (2965:9107)
                                        margin: EdgeInsets.fromLTRB(22 * fem,
                                            65 * fem, 22 * fem, 0 * fem),
                                        width: double.infinity,
                                        height: 20 * fem,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const MyApp()),
                                                  (Route<dynamic> route) =>
                                                      false,
                                                );
                                              },
                                              child: SizedBox(
                                                // navbarkgZ (2965:9108)
                                                width: 20.08 * fem,
                                                height: 20 * fem,
                                                child: Image.asset(
                                                  'assets/new-mobile-2/images/nav-bar-cP3.png',
                                                  width: 20.08 * fem,
                                                  height: 20 * fem,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // autogroupsechHAh (WNzm3QjPRPYSniuPSzsecH)
                                              padding: EdgeInsets.fromLTRB(
                                                  117.43 * fem,
                                                  2 * fem,
                                                  0 * fem,
                                                  2 * fem),
                                              height: double.infinity,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // campaign1Mb (2965:9113)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        117.43 * fem,
                                                        0 * fem),
                                                    child: Text(
                                                      'Campaigns',
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
                        // rectangle58Kj (2965:9119)
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
                        // group1171274989i33 (2965:9152)
                        left: 16 * fem,
                        top: 120 * fem,
                        child: SizedBox(
                          width: 390 * fem,
                          height: 0.87 * height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // campaignsDkV (2965:9261)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 10 * fem),
                                child: Text(
                                  'Campaigns',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 0.9121621847 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RefreshIndicator(
                                   // onRefresh: ()async{
                                   //
                                   //       },
    

                                  onRefresh: () async {
                                    try {
                                      List<dynamic>? userChannelListData =
                                          await userChannelList(_accessToken!);
                                      if (userChannelListData.isNotEmpty) {
                                        List<Channels>? userChannels =
                                            userChannelListData
                                                .map((item) =>
                                                    Channels.fromJson(item))
                                                .toList();
                                        setState(() {
                                          widget.userChannelList = userChannels;
                                        });
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const StartPage()));
                                      }
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
                                    }
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: widget.userChannelList != null ? widget.userChannelList!.length : 0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        // group1171274988LKK (2965:9153)
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // autogrouptp9p5Xo (WNzmRZm8uTC2cYMB1jTp9P)
                                              padding: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  0 * fem,
                                                  0 * fem),
                                              width: double.infinity,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    // group1171274979oTo (2965:9186)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        1 * fem,
                                                        0 * fem),
                                                    child: TextButton(
                                                      onPressed: !widget
                                                              .userChannelList![
                                                                  index]
                                                              .is_active!
                                                          ? null
                                                          : widget
                                                                      .userChannelList![
                                                                          index]
                                                                      .channel_status ==
                                                                  3
                                                              ? null
                                                              : widget.userChannelList![index]
                                                                          .channel_status ==
                                                                      0
                                                                  ? () async {
                                                                      setState(
                                                                          () {
                                                                        _isLoadingChannel =
                                                                            index;
                                                                      });
                                                                      ChannelRead channelData = await readChannel(
                                                                          widget
                                                                              .userChannelList![index]
                                                                              .channel_id
                                                                              .toString(),
                                                                          _accessToken!);
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              PreviewChannel(
                                                                            chanelData:
                                                                                channelData,
                                                                            loadFrom:
                                                                                'preview',
                                                                          ),
                                                                        ),
                                                                      );
                                                                      setState(
                                                                          () {
                                                                        _isLoadingChannel =
                                                                            null;
                                                                      });
                                                                    }
                                                                  : () async {
                                                                      setState(
                                                                          () {
                                                                        _isLoadingChannel =
                                                                            index;
                                                                      });



                                                                      // Assigning data to ChannelRead instance
                                                                      ChannelRead chanelData = ChannelRead(
                                                                        channel_id: 'ch001',
                                                                        account_id: 'acc001',
                                                                        runningBalance: 1200.50,
                                                                        link: 'https://www.example.com/channel1',
                                                                        goal: 'Reach 10,000 subscribers',
                                                                        channelCode: 'C1A2345',
                                                                        videoUrl: 'https://www.example.com/video/channel1',
                                                                        imageUrl: 'https://images.unsplash.com/photo-1601510731643-c0b09e2f5055',
                                                                        description: 'This is the first channel.',
                                                                        target: '10000',
                                                                        title: 'Channel 1',
                                                                        join_link_code: 'join123',
                                                                        payment_link_code: 'pay123',
                                                                        channel_privacy: 'Public',
                                                                        imageFile: null, // Example for file, can be assigned later
                                                                        close_condition: 'Minimum 5000 subscribers',
                                                                        category_id: 1,
                                                                        creator_id: 'user01',
                                                                      //  creator: creator, // Assigning the creator data
                                                                       // category: category, // Assigning the category
                                                                        categ: 'Tech', // Short category name
                                                                        channel_status: 1, // Active
                                                                        is_active: true,
                                                                        created_date_utc: '2025-02-13T00:00:00Z',
                                                                        total_collected: 5000.75,
                                                                       // participants: participants, // Assigning the list of participants
                                                                      );
                                                                      // ChannelRead channelData = await readChannel(
                                                                      //     widget
                                                                      //         .userChannelList![index]
                                                                      //         .channel_id
                                                                      //         .toString(),
                                                                      //     _accessToken!);

                                                                     // ChannelRead chanelData = ChannelRead();

                                                                      // if (channelData
                                                                      //         .channel_status !=
                                                                      //     1) {
                                                                      //   try {
                                                                      //     List<dynamic>?
                                                                      //         userChannelListData =
                                                                      //         await userChannelList(_accessToken!);
                                                                      //     if (userChannelListData
                                                                      //         .isNotEmpty) {
                                                                      //       List<Channels>?
                                                                      //           userChannels =
                                                                      //           userChannelListData.map((item) => Channels.fromJson(item)).toList();
                                                                      //       Navigator.push(context,
                                                                      //           MaterialPageRoute(builder: (context) => ChanelList(userChannelList: userChannels)));
                                                                      //     } else {
                                                                      //       Navigator.push(context,
                                                                      //           MaterialPageRoute(builder: (context) => const StartPage()));
                                                                      //     }
                                                                      //   } catch (e) {
                                                                      //     final snackBar =
                                                                      //         SnackBar(
                                                                      //       /// need to set following properties for best effect of awesome_snackbar_content
                                                                      //       elevation:
                                                                      //           0,
                                                                      //       behavior:
                                                                      //           SnackBarBehavior.floating,
                                                                      //       backgroundColor:
                                                                      //           Colors.transparent,
                                                                      //       content:
                                                                      //           AwesomeSnackbarContent(
                                                                      //         title: 'On Snap!',
                                                                      //         message: '$e',
                                                                      //
                                                                      //         /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                      //         contentType: ContentType.failure,
                                                                      //       ),
                                                                      //     );
                                                                      //
                                                                      //     // ignore: use_build_context_synchronously
                                                                      //     ScaffoldMessenger.of(
                                                                      //         context)
                                                                      //       ..hideCurrentSnackBar()
                                                                      //       ..showSnackBar(snackBar);
                                                                      //   }
                                                                      //   return;
                                                                      // }
                                                                      // ignore: use_build_context_synchronously
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              ChannelDashboard(
                                                                            channelData:
                                                                                ChannelRead(
                                                                                  channel_id: 'ch001',
                                                                                  account_id: 'acc001',
                                                                                  runningBalance: 1200.50,
                                                                                  link: 'https://www.example.com/channel1',
                                                                                  goal: 'Reach 10,000 subscribers',
                                                                                  channelCode: 'C1A2345',
                                                                                  videoUrl: 'https://www.example.com/video/channel1',
                                                                                  imageUrl: 'https://plus.unsplash.com/premium_vector-1719374656644-b00f8808ef26?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                                                                  description: 'This is the first channel.',
                                                                                  target: '10000',
                                                                                  title: 'Channel 1',
                                                                                  join_link_code: 'join123',
                                                                                  payment_link_code: 'pay123',
                                                                                  channel_privacy: 'Public',
                                                                                  imageFile: null, // Example for file, can be assigned later
                                                                                  close_condition: 'Minimum 5000 subscribers',
                                                                                  category_id: 1,
                                                                                  creator_id: 'user01',
                                                                                  //  creator: creator, // Assigning the creator data
                                                                                  // category: category, // Assigning the category
                                                                                  categ: 'Tech', // Short category name
                                                                                  channel_status: 1, // Active
                                                                                  is_active: true,
                                                                                  created_date_utc: '2025-02-13T00:00:00Z',
                                                                                  total_collected: 5000.75,
                                                                                ),
                                                                            accessToken:
                                                                                _accessToken!,
                                                                          ),
                                                                        ),
                                                                      );
                                                                      setState(
                                                                          () {
                                                                        _isLoadingChannel =
                                                                            null;
                                                                      });
                                                                    },
                                                      style:
                                                          TextButton.styleFrom(
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: 38 * fem,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  // ellipse54JvM (2965:9188)
                                                                  margin: EdgeInsets
                                                                      .fromLTRB(
                                                                          0 *
                                                                              fem,
                                                                          0 *
                                                                              fem,
                                                                          16 *
                                                                              fem,
                                                                          3 * fem),
                                                                  width:
                                                                      30 * fem,
                                                                  height:
                                                                      30 * fem,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(15 *
                                                                            fem),
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image:
                                                                          NetworkImage(
                                                                        widget
                                                                            .userChannelList![index]
                                                                            .imageUrl
                                                                            .toString(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text:
                                                                      TextSpan(
                                                                    style:
                                                                        SafeGoogleFont(
                                                                      'Inter',
                                                                      fontSize:
                                                                          14 *
                                                                              ffem,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height: 1.3533593587 *
                                                                          ffem /
                                                                          fem,
                                                                      letterSpacing:
                                                                          0.14 *
                                                                              fem,
                                                                      color: const Color(
                                                                          0xff000000),
                                                                    ),
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            '${widget.userChannelList![index].title}\n',
                                                                        style:
                                                                            SafeGoogleFont(
                                                                          'Inter',
                                                                          fontSize:
                                                                              14 * ffem,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          height: 1.3533593587 *
                                                                              ffem /
                                                                              fem,
                                                                          letterSpacing:
                                                                              0.14 * fem,
                                                                          color:
                                                                              const Color(0xff00313d),
                                                                        ),
                                                                      ),
                                                                      !widget.userChannelList![index]
                                                                              .is_active!
                                                                          ? TextSpan(
                                                                              text: 'Closed',
                                                                              style: SafeGoogleFont(
                                                                                'Inter',
                                                                                fontSize: 9 * ffem,
                                                                                fontWeight: FontWeight.w500,
                                                                                height: 2.105225669 * ffem / fem,
                                                                                letterSpacing: 0.14 * fem,
                                                                                color: const Color(0xffec6b5e),
                                                                              ),
                                                                            )
                                                                          : widget.userChannelList![index].channel_status == 0
                                                                              ? TextSpan(
                                                                                  text: 'In Review',
                                                                                  style: SafeGoogleFont(
                                                                                    'Inter',
                                                                                    fontSize: 9 * ffem,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    height: 2.105225669 * ffem / fem,
                                                                                    letterSpacing: 0.14 * fem,
                                                                                    color: const Color(0xffecb112),
                                                                                  ),
                                                                                )
                                                                              : widget.userChannelList![index].channel_status == 3
                                                                                  ? TextSpan(
                                                                                      text: 'Suspended',
                                                                                      style: SafeGoogleFont(
                                                                                        'Inter',
                                                                                        fontSize: 9 * ffem,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        height: 2.105225669 * ffem / fem,
                                                                                        letterSpacing: 0.14 * fem,
                                                                                        color: const Color(0xffec6b5e),
                                                                                      ),
                                                                                    )
                                                                                  : TextSpan(
                                                                                      text: 'Active',
                                                                                      style: SafeGoogleFont(
                                                                                        'Inter',
                                                                                        fontSize: 9 * ffem,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        height: 2.105225669 * ffem / fem,
                                                                                        letterSpacing: 0.14 * fem,
                                                                                        color: const Color(0xff71ae00),
                                                                                      ),
                                                                                    )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              // frame1575p81 (2965:9189)
                                                              height: double
                                                                  .infinity,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    // navbaryYd (2965:9191)
                                                                    margin: EdgeInsets.fromLTRB(
                                                                        0 * fem,
                                                                        0 * fem,
                                                                        0 * fem,
                                                                        3 * fem),
                                                                    width: 15 *
                                                                        fem,
                                                                    height:
                                                                        14.94 *
                                                                            fem,
                                                                    child: _isLoadingChannel ==
                                                                            index
                                                                        ? LoadingAnimationWidget.inkDrop(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            size:
                                                                                20)
                                                                        : Image
                                                                            .asset(
                                                                            'assets/new-mobile-2/images/nav-bar-byj.png',
                                                                            width:
                                                                                15 * fem,
                                                                            height:
                                                                                14.94 * fem,
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
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
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
