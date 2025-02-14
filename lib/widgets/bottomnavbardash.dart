// ignore_for_file: must_be_immutable, use_build_context_synchronously, duplicate_ignore

import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/ChannelDashboard.dart';
import 'package:changa_changa/new-mobile-2/Participants.dart';
import 'package:changa_changa/new-mobile-2/statements.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';


class BottomNavBarDash extends StatefulWidget {
  ChannelRead channelReadData;
  BottomNavBarDash({super.key, required this.channelReadData});

  @override
  State<BottomNavBarDash> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarDash> {
  String? _accessToken;
  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
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
    return Container(
      padding: EdgeInsets.fromLTRB(30 * fem, 15 * fem, 30 * fem, 15 * fem),
      width: 414 * fem,
      height: 66.61 * fem,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              print(widget.channelReadData);
              try {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChannelDashboard(
                      channelData:  ChannelRead(
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
                   //   accessToken: "",
                    ),
                  ),
                );
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
            child: Container(
              // group43ihw (2967:8551)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0.85 * fem, 0 * fem, 0 * fem),
              height: 35.76 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group1171274970LDX (2967:8552)
                    margin: EdgeInsets.fromLTRB(
                        0.4 * fem, 0 * fem, 0 * fem, 6.36 * fem),
                    width: 18.4 * fem,
                    height: 18.4 * fem,
                    child: Image.asset(
                      'assets/new-mobile-2/images/group-1171274970.png',
                      width: 18.4 * fem,
                      height: 18.4 * fem,
                    ),
                  ),
                  Center(
                    // dashboard2MF (2967:8557)
                    child: Text(
                      'Dashboard',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 0.9283592918 * ffem / fem,
                        letterSpacing: -0.2200000262 * fem,
                        color: const Color(0xff494949),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 90 * fem,
          ),
          InkWell(
            onTap: () async {
              try {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Statements(
                       channelData: widget.channelReadData,
                      // accessToken: _accessToken!,
                    ),
                  ),
                );
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
            child: Container(
              // group3789P (2967:8558)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0.85 * fem, 0 * fem, 0 * fem),
              height: 35.76 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // vectorSvm (2967:8559)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 4.76 * fem),
                    width: 17 * fem,
                    height: 20 * fem,
                    child: Image.asset(
                      'assets/new-mobile-2/images/vector-qs7.png',
                      width: 17 * fem,
                      height: 20 * fem,
                    ),
                  ),
                  Center(
                    // statementsxPK (2967:8560)
                    child: Text(
                      'Statements',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 0.9283592918 * ffem / fem,
                        letterSpacing: -0.2200000262 * fem,
                        color: const Color(0xff494949),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 90 * fem,
          ),
          InkWell(
            onTap: () async {
              // Function to generate dummy participants
              // Function to generate dummy participants
              // Sample participant list generator
              // Random User Generator
              User generateRandomUser() {
                final random = Random();

                return User(
                  id_number: 'ID${random.nextInt(10000)}',
                  nationality: ['USA', 'Canada', 'UK', 'Australia'][random.nextInt(4)],
                  id_document_type: ['Passport', 'Driver\'s License', 'National ID'][random.nextInt(3)],
                  date_of_birth: '198${random.nextInt(10)}-0${random.nextInt(9)}-${random.nextInt(28) + 1}',
                  address_line: '${random.nextInt(100)} Main St, City${random.nextInt(10)}',
                  postal_code: '${random.nextInt(10000)}',
                  country_code: ['US', 'CA', 'GB', 'AU'][random.nextInt(4)],
                  first_name: ['Alice', 'Bob', 'Charlie', 'David', 'Eva'][random.nextInt(5)],
                  phone_number: '+${random.nextInt(1000)}${random.nextInt(10000)}',
                  email_address: 'user${random.nextInt(100)}@example.com',
                  password: 'password123',
                  id: 'user${random.nextInt(10000)}',
                  verification_code: 'VC${random.nextInt(1000)}',
                  new_password: 'newpassword456',
                  otp: 'OTP${random.nextInt(1000)}',
                  username: 'user${random.nextInt(100)}',
                  user_no: 'U${random.nextInt(10000)}',
                  user_account_status: random.nextInt(2), // 0 or 1
                  user_id: 'userId${random.nextInt(10000)}',
                  date_joined_utc: DateTime.utc(2023, random.nextInt(12) + 1, random.nextInt(28) + 1).toIso8601String(),
                  verification_request_id: 'VR${random.nextInt(1000)}',
                  profile_photo: 'https://randomuser.me/api/portraits/lego/${random.nextInt(10)}.jpg',
                  title: ['Mr', 'Ms', 'Dr'][random.nextInt(3)],
                  request_id: 'REQ${random.nextInt(10000)}',
                );
              }

              List<Participant> generateParticipants(int count) {
                final participants = <Participant>[];
                final random = Random();

                for (int i = 0; i < count; i++) {
                  participants.add(Participant(
                    user: generateRandomUser(),
                    is_admin: random.nextBool(),
                  ));
                }

                return participants;
              }


              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Participants(
                   //   channelData: widget.channelReadData,
                      channelData:  ChannelRead(
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
                        participants: generateParticipants(5),
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
                      accessToken: _accessToken!,
                    ),
                  ),
                );
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
            child: SizedBox(
              // group41foX (2967:8561)
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // capa1ELq (2967:8562)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 5.61 * fem),
                    width: 20 * fem,
                    height: 20 * fem,
                    child: Image.asset(
                      'assets/new-mobile-2/images/capa1-7Bf.png',
                      width: 20 * fem,
                      height: 20 * fem,
                    ),
                  ),
                  Center(
                    // participantsLem (2967:8569)
                    child: Text(
                      'Participants',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 0.9283592918 * ffem / fem,
                        letterSpacing: -0.2200000262 * fem,
                        color: const Color(0xff494949),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
