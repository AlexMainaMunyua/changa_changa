// ignore_for_file: must_be_immutable, use_build_context_synchronously, duplicate_ignore, file_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/ChannelDashboard.dart';
import 'package:changa_changa/new-mobile-2/invite.dart';
import 'package:changa_changa/widgets/bottomNavbar.dart';
import 'package:changa_changa/widgets/dropDownClose.dart';
import 'package:changa_changa/widgets/dropDownLeave.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Participants extends StatefulWidget {
  ChannelRead channelData;
  String accessToken;
  Participants(
      {super.key, required this.channelData, required this.accessToken});

  @override
  State<Participants> createState() => _ParticipantsState();
}

class _ParticipantsState extends State<Participants> {
  Participant? _admin;
  bool _isLoading = false;
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
    setState(() {
      _isLoading = true;
    });
   // ChannelRead? data = await readChannel(chanId!, accessToken!);
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

  String formatDate(DateTime date, String format) {
    return DateFormat(format).format(date);
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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: _admin?.user?.first_name != _username
          ? null
          : SpeedDial(
              animatedIcon: AnimatedIcons.view_list,
              backgroundColor: Colors.green,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.add),
                  label: 'Invite paticipant',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InviteParticipant(
                          accessToken: widget.accessToken,
                          channel_id: widget.channelData.channel_id!,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            // iphone11promax24JY9 (2955:14005)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group1171274828haH (2955:14031)
                  width: double.infinity,
                  height: height,
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
                                        margin: EdgeInsets.fromLTRB(20 * fem,
                                            65 * fem, 20 * fem, 0 * fem),
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
                                                      'Participants',
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
                        // rectangle5e3b (2955:14046)
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
                        // group1171274970xpy (2955:14148)
                        left: 20 * fem,
                        top: 134 * fem,
                        child: SizedBox(
                          width: 313 * fem,
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
                        // rectangle3tMF (2961:8449)
                        left: 0 * fem,
                        top: 220 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 414 * fem,
                            height: 15 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0x0c043e4d),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // group1171274977QKb (2967:8367)
                        left: 15 * fem,
                        top: 270 * fem,
                        child: SizedBox(
                          width: 384 * fem,
                          height: 600 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // participantsJvm (2967:8403)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                child: Text(
                                  'Participants',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 0.9121621847 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              _isLoading
                                  ? Center(
                                      child: LoadingAnimationWidget
                                          .threeArchedCircle(
                                              color: const Color(0xff71ae00),
                                              size: 20),
                                    )
                                  : Expanded(
                                      child: RefreshIndicator(
                                        onRefresh: () async {
                                          _loadChannelData(
                                              accessToken: widget.accessToken,
                                              chanId: widget
                                                  .channelData.channel_id);
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: widget
                                              .channelData.participants?.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              // frame1171274971dTF (2967:8368)
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
                                                        // group1171274975M8M (2967:8369)
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                2.5 * fem,
                                                                5 * fem,
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
                                                            widget
                                                                .channelData
                                                                .participants![
                                                                    index]
                                                                .user!
                                                                .first_name![0]
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
                                                        // michaeldoe254722xxxxxxA5o (2967:8373)
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0 * fem,
                                                                0 * fem,
                                                                145 * fem,
                                                                0 * fem),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 160 * fem,
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
                                                                text:
                                                                    '${widget.channelData.participants![index].user!.first_name![0].toUpperCase() + widget.channelData.participants![index].user!.first_name!.substring(1).toLowerCase()}\n',
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
                                                                text: widget
                                                                        .channelData
                                                                        .participants![
                                                                            index]
                                                                        .is_admin!
                                                                    ? '${widget.channelData.participants![index].user!.username}'
                                                                    : '${widget.channelData.participants![index].user!.username}',
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
                                                    // frame1575c4H (2967:8372)
                                                    height: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          // gVP (2967:8374)
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 230 * fem,
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
                                                                  text: widget
                                                                          .channelData
                                                                          .participants![
                                                                              index]
                                                                          .is_admin!
                                                                      ? 'Admin\n'
                                                                      : 'Active\n',
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
                                                                      DateTime.parse(widget
                                                                          .channelData
                                                                          .participants![
                                                                              index]
                                                                          .user!
                                                                          .date_joined_utc!),
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
                                                        _admin?.user?.first_name ==
                                                                _username
                                                            ? widget
                                                                    .channelData
                                                                    .participants![
                                                                        index]
                                                                    .is_admin!
                                                                ? const SizedBox()
                                                                : IconButton(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    onPressed:
                                                                        () async {
                                                                      try {
                                                                        setState(
                                                                          () {},
                                                                        );
                                                                        await removeParticipant(
                                                                            widget.accessToken,
                                                                            widget.channelData.channel_id!,
                                                                            widget.channelData.participants![index].user!.user_id!);
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                ChannelDashboard(
                                                                              channelData: widget.channelData,
                                                                              accessToken: widget.accessToken,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      } catch (e) {
                                                                        final snackBar =
                                                                            SnackBar(
                                                                          /// need to set following properties for best effect of awesome_snackbar_content
                                                                          elevation:
                                                                              0,
                                                                          behavior:
                                                                              SnackBarBehavior.floating,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          content:
                                                                              AwesomeSnackbarContent(
                                                                            title:
                                                                                'On Snap!',
                                                                            message:
                                                                                '$e',

                                                                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                                            contentType:
                                                                                ContentType.failure,
                                                                          ),
                                                                        );

                                                                        // ignore: use_build_context_synchronously
                                                                        ScaffoldMessenger.of(
                                                                            context)
                                                                          ..hideCurrentSnackBar()
                                                                          ..showSnackBar(
                                                                              snackBar);
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .delete_forever_outlined,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  )
                                                            : const SizedBox()
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
      // bottomNavigationBar: BottomNavBar(
      //   channelReadData: widget.channelData,
      // ),
    );
  }
}
