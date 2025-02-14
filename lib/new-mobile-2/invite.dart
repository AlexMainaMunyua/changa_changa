// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'dart:convert';

import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/logic/links/invitelink.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/models/userInvite.dart';
import 'package:changa_changa/new-mobile-2/ChannelDashboard.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InviteParticipant extends StatefulWidget {
  String channel_id;
  String accessToken;
  InviteParticipant(
      {super.key, required this.accessToken, required this.channel_id});

  @override
  State<InviteParticipant> createState() => _InviteParticipantState();
}

class _InviteParticipantState extends State<InviteParticipant> {
  bool isLoading = false;
  String? imageUrl;
  String? copyLink;
  String? _accessToken;
  bool dataLoading = false;
  Future<void> _copyToClipboard(String link) async {
    await Clipboard.setData(ClipboardData(text: link));

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  Future<void> _getChannelData(
      {String? accessToken, String? channelNumber}) async {
    setState(() {
      dataLoading = true;
    });
    ChannelRead channelData = await readChannel(channelNumber!, accessToken!);
    if (channelData.join_link_code != null) {
      setState(() {
        copyLink =
            'https://changachanga.co.ke/join/${channelData.join_link_code}';
      });
    }
    if (channelData.participants != null) {
      for (Participant participant in channelData.participants!) {
        if (participant.is_admin!) {
          setState(() {});
          break;
        }
      }
      setState(() {
        dataLoading = false;
      });
    }
    setState(() {
      dataLoading = false;
    });
  }

  Future<String?> getSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('full_name');
  }

  Future<void> _loaduserData() async {
    final savedUsername = await getSavedUsername();
    if (savedUsername != null) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _accessToken = widget.accessToken;
    });
    _loaduserData();
    _getChannelData(
        channelNumber: widget.channel_id, accessToken: widget.accessToken);
  }

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textEditingControllername =
      TextEditingController();
  final TextEditingController _textEditingControllerphone =
      TextEditingController();
  final List<UserInvited> userinvites = [];
  UserInviteList? userInviteData = UserInviteList();

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
            // iphone11promax37Amo (2990:9109)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group1171274828PPf (2990:9135)
                  width: double.infinity,
                  height: 920,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle786M (2990:9136)
                        left: 0 * fem,
                        top: 94.4913330078 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 414 * fem,
                            height: 229 * fem,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff00313d),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // frame3eKb (2990:9137)
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // frame1572rAm (2990:9138)
                                margin: EdgeInsets.fromLTRB(
                                    26.5 * fem, 65 * fem, 26.5 * fem, 0 * fem),
                                width: double.infinity,
                                height: 20 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        // navbarymB (2990:9139)
                                        width: 20.08 * fem,
                                        height: 20 * fem,
                                        child: Image.asset(
                                          'assets/new-mobile-2/images/nav-bar-92h.png',
                                          width: 20.08 * fem,
                                          height: 20 * fem,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // autogroupcnmfWWD (WNze1rwTv5HGeeeVMecnMF)
                                      padding: EdgeInsets.fromLTRB(100.93 * fem,
                                          2 * fem, 0 * fem, 2 * fem),
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // addmembersSPs (2990:9144)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 100.93 * fem, 0 * fem),
                                            child: Text(
                                              'Add Members',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 18 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    0.8888888889 * ffem / fem,
                                                color: const Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            // group93jtm (2990:9145)
                                            width: 19.07 * fem,
                                            height: 3.77 * fem,
                                            child: Image.asset(
                                              'assets/new-mobile-2/images/group-93-KF7.png',
                                              width: 19.07 * fem,
                                              height: 3.77 * fem,
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
                      Positioned(
                        // rectangle5rTb (2990:9149)
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
                        // frame1568xWd (2990:9150)
                        left: 15 * fem,
                        top: 220 * fem,
                        child: SizedBox(
                          width: 384 * fem,
                          height: 125 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group11712749675LM (2990:9156)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 20 * fem),
                                width: double.infinity,
                                height: 48 * fem,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(100 * fem),
                                ),
                                child: TextButton(
                                  // frame1171274968Q7j (2990:9159)
                                  onPressed: copyLink != null
                                      ? () async {
                                          setState(() {
                                            dataLoading = true;
                                          });
                                          ChannelRead data =
                                              await generateJoinLink(
                                                  accessToken: _accessToken,
                                                  channelId: widget.channel_id);

                                          setState(() {
                                            copyLink =
                                                'https://changachanga.co.ke/join/${data.join_link_code}';

                                            dataLoading = false;
                                          });
                                        }
                                      : () async {
                                          setState(() {
                                            dataLoading = true;
                                          });
                                          ChannelRead data =
                                              await generateJoinLink(
                                                  accessToken: _accessToken,
                                                  channelId: widget.channel_id);
                                          setState(() {
                                            copyLink =
                                                'https://changachanga.co.ke/join/${data.join_link_code}';
                                            dataLoading = false;
                                          });
                                        },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(100 * fem,
                                        12 * fem, 100 * fem, 12 * fem),
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff71ae00),
                                      borderRadius:
                                          BorderRadius.circular(100 * fem),
                                    ),
                                    child: dataLoading
                                        ? Center(
                                            child: LoadingAnimationWidget
                                                .progressiveDots(
                                                    color:
                                                        const Color(0xffffffff),
                                                    size: 20),
                                          )
                                        : Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                // generatecodeHxD (2990:9160)
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      10 * fem,
                                                      0 * fem),
                                                  child: Text(
                                                    copyLink != null
                                                        ? 'New Invite code'
                                                        : 'Generate Code',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 16 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5 * ffem / fem,
                                                      color: const Color(
                                                          0xffffffff),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                // vector12yq3 (2990:9161)
                                                width: 14 * fem,
                                                height: 14 * fem,
                                                child: Image.asset(
                                                  'assets/new-mobile-2/images/vector-12-uKf.png',
                                                  width: 14 * fem,
                                                  height: 14 * fem,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                              copyLink != null
                                  ? Container(
                                      width: double.infinity,
                                      height: 45 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4 * fem),
                                        border: Border.all(
                                            color: const Color(0xffdbdbdb)),
                                      ),
                                      child: TextField(
                                        controller: _textController,
                                        style: SafeGoogleFont(
                                          'Roboto',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.3533593587 * ffem / fem,
                                          letterSpacing: -0.2800000334 * fem,
                                          color: const Color(0xff000000),
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: "$copyLink",
                                          hintStyle: const TextStyle(
                                              color: Color(0xff444444)),
                                          icon: IconButton(
                                            icon: const Icon(Icons.copy),
                                            onPressed: () {
                                              _copyToClipboard(copyLink!);
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      // rectangle4027KP7 (2990:9475)
                                      width: double.infinity,
                                      height: 45 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7 * fem),
                                        color: const Color(0xffd9d9d9),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // frame296de9 (2929:9061)
                        left: 0 * fem,
                        top: 340 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              20 * fem, 10 * fem, 20 * fem, 300 * fem),
                          width: 414 * fem,
                          height: 607 * fem,
                          decoration: const BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group1171274938x49 (2935:10628)
                                margin: EdgeInsets.fromLTRB(
                                    5 * fem, 0 * fem, 5 * fem, 0 * fem),
                                width: double.infinity,
                                height: 24 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // line258m (2935:10632)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 1 * fem, 8 * fem, 0 * fem),
                                      width: 163 * fem,
                                      height: 1 * fem,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffc4c4c4),
                                      ),
                                    ),
                                    Container(
                                      // group1171274937bcu (2935:10629)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 9 * fem, 0 * fem),
                                      width: 21 * fem,
                                      height: double.infinity,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // ellipse53Wzm (2935:10630)
                                            left: 0 * fem,
                                            top: 2 * fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 21 * fem,
                                                height: 21 * fem,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.5 * fem),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffc4c4c4)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // or2CR (2935:10631)
                                            left: 4 * fem,
                                            top: 0 * fem,
                                            child: Center(
                                              child: Align(
                                                child: SizedBox(
                                                  width: 12 * fem,
                                                  height: 24 * fem,
                                                  child: Text(
                                                    'or',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 2 * ffem / fem,
                                                      color: const Color(
                                                          0xffc4c4c4),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // line36xy (2935:10633)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                      width: 163 * fem,
                                      height: 1 * fem,
                                      decoration: const BoxDecoration(
                                        color: Color(0xffc4c4c4),
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
                        // group11712748054bb (2990:9162)
                        left: 46.5 * fem,
                        top: 127 * fem,
                        child: SizedBox(
                          width: 322 * fem,
                          height: 79 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // invitemembersBw7 (2990:9163)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 1 * fem, 11 * fem),
                                child: Text(
                                  'Invite Members',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 22 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3533593091 * ffem / fem,
                                    color: const Color(0xff00313d),
                                  ),
                                ),
                              ),
                              Container(
                                // invitememberstoparticipateinyo (2990:9164)
                                constraints: BoxConstraints(
                                  maxWidth: 322 * fem,
                                ),
                                child: Text(
                                  'Invite members to participate in your campaign \nvia sharing an invite code',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3533593587 * ffem / fem,
                                    letterSpacing: 0.14 * fem,
                                    color: const Color(0x99000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // group1171274997meR (2990:9500)
                        left: 16 * fem,
                        top: 380 * fem,
                        child: SizedBox(
                          width: 384 * fem,
                          height: 475 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group1171274996hHB (2990:9484)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 15 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // mediumlabelsemibold14pxDmK (2990:9485)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                      child: Text(
                                        'Name',
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
                                    Container(
                                      // frame1ixy (2990:9486)
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7 * fem),
                                        border: Border.all(
                                            color: const Color(0xffc4c4c4)),
                                      ),
                                      child: TextField(
                                        controller: _textEditingControllername,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              15 * fem,
                                              14 * fem,
                                              15 * fem,
                                              14 * fem),
                                          hintText: 'Member’s name',
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
                              SizedBox(
                                // frame314LzM (2990:9489)
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // mediumlabelsemibold14pxTp5 (2990:9490)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                      child: Text(
                                        'Phone number',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5714285714 * ffem / fem,
                                          letterSpacing: 0.07 * fem,
                                          color: const Color(0xff151940),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // frame1KLV (2990:9491)
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10 * fem),
                                        border: Border.all(
                                            color: const Color(0xffc4c4c4)),
                                        color: const Color(0xfffcfcfc),
                                      ),
                                      child: TextField(
                                        controller: _textEditingControllerphone,
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              15 * fem,
                                              14 * fem,
                                              15 * fem,
                                              14 * fem),
                                          hintText:
                                              '07 | Enter your phone number',
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
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      final name =
                                          _textEditingControllername.text;
                                      final phone =
                                          _textEditingControllerphone.text;
                                      if (name.isEmpty ||
                                          phone.isEmpty ||
                                          phone.length < 10) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Validation Error'),
                                              content: const Text(
                                                  "Please enter  the Participants name or number correctly"),
                                              actions: [
                                                TextButton(
                                                  child: const Text('OK'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        String number =
                                            '+254${phone.substring(1)}';
                                        UserInvited userList = UserInvited(
                                            phone_number: number,
                                            first_name: name);
                                        setState(() {
                                          userinvites.add(userList);
                                        });
                                        _textEditingControllerphone.clear();
                                        _textEditingControllername.clear();
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Color(0xff71ae00),
                                    )),
                              ),
                              userinvites.isEmpty
                                  ? Expanded(
                                      child: Center(
                                        child: Text(
                                          'No Invited Members',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2999999183 * ffem / fem,
                                            color: const Color(0xe5606060),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: userinvites.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            // frame1171274971fC5 (2967:8508)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 22 * fem),
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      // group1171274975bLd (2967:8509)
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0 * fem,
                                                              2.5 * fem,
                                                              16 * fem,
                                                              0 * fem),
                                                      width: 30 * fem,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffffd0bd),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20 * fem),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          userinvites[index]
                                                              .first_name![0]
                                                              .toUpperCase(),
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize:
                                                                11.3513507843 *
                                                                    ffem,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize: 14 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                                              text: userinvites[
                                                                      index]
                                                                  .first_name
                                                                  .toString(),
                                                              style:
                                                                  SafeGoogleFont(
                                                                'Inter',
                                                                fontSize:
                                                                    14 * ffem,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                letterSpacing:
                                                                    0.14 * fem,
                                                                color: const Color(
                                                                    0xff000000),
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
                                                                text: userinvites[
                                                                        index]
                                                                    .phone_number
                                                                    .toString(),
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
                                                      IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            userinvites
                                                                .removeAt(
                                                                    index);
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color:
                                                              Colors.redAccent,
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
                        // frame1171274968ZVj (3001:8405)
                        left: 43 * fem,
                        top: 870 * fem,
                        child: TextButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              final userDataArry = userinvites;
                              final channelno = widget.channel_id;
                              final accessToken = _accessToken;
                              await invaitechannnelPartisipants(
                                  channelno, accessToken!, userDataArry);
                              ChannelRead channelData = await readChannel(
                                  widget.channel_id, _accessToken!);
                              final prefs =
                                  await SharedPreferences.getInstance();
                              final jsonData = channelData.toJson();
                              final jsonString = json.encode(jsonData);
                              await prefs.setString(
                                  channelData.channel_id.toString(),
                                  jsonString);
                              await channelParticipant(
                                  widget.channel_id, _accessToken!);
                              Fluttertoast.showToast(
                                  msg: "Invitations sent successfully");
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChannelDashboard(
                                          channelData: channelData,
                                          accessToken: _accessToken!)));
                              setState(() {
                                isLoading = false;
                              });
                            } catch (e) {
                              Fluttertoast.showToast(msg: e.toString());
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                131 * fem, 12 * fem, 131 * fem, 12 * fem),
                            width: 328 * fem,
                            height: 48 * fem,
                            decoration: BoxDecoration(
                              color: const Color(0xff71ae00),
                              borderRadius: BorderRadius.circular(100 * fem),
                            ),
                            child: isLoading
                                ? Center(
                                    child:
                                        LoadingAnimationWidget.progressiveDots(
                                            color: const Color(0xffffffff),
                                            size: 20),
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        // invite2u7 (3001:8406)
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 10 * fem, 0 * fem),
                                          child: Text(
                                            'Invite',
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
                                      SizedBox(
                                        // vector12wmB (3001:8407)
                                        width: 14 * fem,
                                        height: 14 * fem,
                                        child: Image.asset(
                                          'assets/new-mobile-2/images/vector-12-WC9.png',
                                          width: 14 * fem,
                                          height: 14 * fem,
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
          ),
        ),
      ),
    );
  }
}
