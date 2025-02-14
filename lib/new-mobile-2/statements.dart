// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/logic/statements/statements.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/widgets/bottomNavbar.dart';
import 'package:changa_changa/widgets/dropDownClose.dart';
import 'package:changa_changa/widgets/dropDownLeave.dart';
import 'package:changa_changa/widgets/statementsList.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Statements extends StatefulWidget {
  ChannelRead? channelData;
  String? accessToken;
  Statements({super.key,  this.channelData,  this.accessToken});

  @override
  State<Statements> createState() => _ParticipantsState();
}

class _ParticipantsState extends State<Statements> {
  List<Payment> channelStatements = [];
  String? _username;
  bool _isLoading = false;
  Participant? _admin;
  String? paymentlink;
  bool isGenerationLinkLoading = false;

  int pageNumber = 1;
  final int limitNumber = 15;
  // ignore: prefer_final_fields
  bool _isFistLoadRuning = false;
  bool hasNewNextPage = true;
  bool _isLoadMoreRunning = false;
  late ScrollController _controller;

  void _loadMore(
    String? channelNumber,
    String? accessToken,
  ) async {
    if (hasNewNextPage &&
        !_isFistLoadRuning &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      pageNumber += 1;
      try {
        List<Payment> statements = await fetchStatementsPaginated(
          accessToken: accessToken!,
          channelNumber: widget.channelData!.channel_id!,
          limit: limitNumber,
          page: pageNumber,
        );
        if (statements.isNotEmpty) {
          setState(() {
            channelStatements.addAll(statements);
          });
        } else {
          setState(() {
            hasNewNextPage = false;
          });
        }
      } catch (e) {
        // Handle error scenario
        throw Exception(e);
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // Function to generate dummy data
  List<Payment> generateDummyPayments(int numberOfPayments) {
    List<Payment> payments = [];
    var random = Random();

    for (int i = 0; i < numberOfPayments; i++) {
      var userId = 'user${random.nextInt(1000)}';
      var username = 'User_${random.nextInt(100)}';
      var user = User(userId: userId, firstName: "joe doe", username: username);

      payments.add(Payment(
        transactionType: random.nextBool() ? 'Credit' : 'Debit',
        amount: (random.nextDouble() * 1000).toDouble(),
        reason: 'Payment for service ${random.nextInt(5) + 1}',
        paymentReferenceId: 'ref${random.nextInt(10000)}',
        transactionId: 'txn${random.nextInt(100000)}',
        user: user,
        channelId: 'channel${random.nextInt(10)}',
        timestampUtc: DateTime.utc(
          2025, random.nextInt(12) + 1, random.nextInt(28) + 1, random.nextInt(24),
          random.nextInt(60), random.nextInt(60),
        ),
      ));
    }

    return payments;
  }

  void _firstLoad(
    String? channelNumber,
    String? accessToken,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      // List<Payment> statements = await fetchStatementsPaginated(
      //   accessToken: accessToken!,
      //   channelNumber: widget.channelData!.channel_id!,
      //   limit: limitNumber,
      //   page: pageNumber,
      // );

      List<Payment> statements = generateDummyPayments(15); // Generate 10 dummy payments

      setState(() {
        channelStatements = statements;
      });
    } catch (e) {
      // Handle error scenario
      throw Exception(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<String?> getSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('full_name');
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

  Future<void> _loaduserData() async {
    final savedUsername = await getSavedUsername();
    if (savedUsername != null) {
      setState(() {
        _username = savedUsername;
      });
    }
  }

  Future<void> _copyToClipboard(String link) async {
    await Clipboard.setData(ClipboardData(text: link));

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  Future<void> generatePaymentLink(String channelId, String accessToken) async {
    const String baseUrl = "https://api.changachanga.co.ke/api/v1/channels";
    final String apiUrl = "$baseUrl/$channelId/payment-link/generate";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        // Add any necessary headers here, e.g., authentication token
        "Authorization": "Bearer $accessToken",
      },
    );

    if (response.statusCode == 200) {
      // Successful API call, return the payment link
      ChannelRead data = ChannelRead.fromJson(jsonDecode(response.body));
      setState(() {
        paymentlink =
            "https://changachanga.co.ke/changa/$channelId/${data.payment_link_code}";
      });
    } else {
      // Handle API error
      throw Exception("Failed to generate payment link");
    }
  }

  @override
  void initState() {
    super.initState();
    _loaduserData();
    _loadChannelData(
        accessToken: widget.accessToken, chanId: widget.channelData!.channel_id);
    _firstLoad(widget.channelData!.channel_id, widget.accessToken);
    _controller = ScrollController()
      ..addListener(
        () {
          _loadMore(widget.channelData!.channel_id, widget.accessToken);
        },
      );
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
                  child: paymentlink == null
                      ? isGenerationLinkLoading
                          ? LoadingAnimationWidget.inkDrop(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              size: 20)
                          : const Icon(Icons.add)
                      : Center(
                          child: TextField(
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
                              hintText: "$paymentlink",
                              hintStyle:
                                  const TextStyle(color: Color(0xff444444)),
                              icon: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: () {
                                  _copyToClipboard(paymentlink!);
                                },
                              ),
                            ),
                          ),
                        ),
                  label: paymentlink == null
                      ? 'Generate Contribution link'
                      : 'Copy generated link',
                  onTap: paymentlink != null
                      ? null
                      : () {
                          try {
                            setState(() {
                              isGenerationLinkLoading = true;
                            });
                            generatePaymentLink(widget.channelData!.channel_id!,
                                widget.accessToken!);
                            setState(() {
                              isGenerationLinkLoading = false;
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
                              isGenerationLinkLoading = false;
                            });
                          }
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
                      // Positioned(
                      //   // group1171274977dTw (2955:14032)
                      //   left: 0 * fem,
                      //   top: 0 * fem,
                      //   child: SizedBox(
                      //     width: 414 * fem,
                      //     height: 323 * fem,
                      //     child: Stack(
                      //       children: [
                      //         Positioned(
                      //           // frame3Lt9 (2955:14033)
                      //           left: 0 * fem,
                      //           top: 0 * fem,
                      //           child: Container(
                      //             padding: EdgeInsets.fromLTRB(
                      //                 0 * fem, 0 * fem, 0 * fem, 15 * fem),
                      //             width: 414 * fem,
                      //             height: 102.27 * fem,
                      //             decoration: const BoxDecoration(
                      //               color: Color(0xff00313d),
                      //             ),
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.center,
                      //               children: [
                      //                 Container(
                      //                   // frame1573YjK (2955:14034)
                      //                   margin: EdgeInsets.fromLTRB(20 * fem,
                      //                       65 * fem, 20 * fem, 0 * fem),
                      //                   width: double.infinity,
                      //                   height: 20 * fem,
                      //                   child: Row(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.center,
                      //                     children: [
                      //                       InkWell(
                      //                         onTap: () {
                      //                           Navigator.pop(context);
                      //                         },
                      //                         child: SizedBox(
                      //                           // navbarGfK (2955:14035)
                      //                           width: 20.08 * fem,
                      //                           height: 20 * fem,
                      //                           child: Image.asset(
                      //                             'assets/new-mobile-2/images/nav-bar-6G1.png',
                      //                             width: 20.08 * fem,
                      //                             height: 20 * fem,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       Container(
                      //                         // autogroup4qghzbK (WNzjpcS2DLcCToR4kW4QGh)
                      //                         padding: EdgeInsets.fromLTRB(
                      //                             113.93 * fem,
                      //                             2 * fem,
                      //                             0 * fem,
                      //                             2 * fem),
                      //                         height: double.infinity,
                      //                         child: Row(
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment.center,
                      //                           children: [
                      //                             Container(
                      //                               // participantuiH (2955:14040)
                      //                               margin: EdgeInsets.fromLTRB(
                      //                                   0 * fem,
                      //                                   0 * fem,
                      //                                   113.93 * fem,
                      //                                   0 * fem),
                      //                               child: Text(
                      //                                 'Statements',
                      //                                 textAlign:
                      //                                     TextAlign.center,
                      //                                 style: SafeGoogleFont(
                      //                                   'Inter',
                      //                                   fontSize: 18 * ffem,
                      //                                   fontWeight:
                      //                                       FontWeight.w400,
                      //                                   height: 0.8888888889 *
                      //                                       ffem /
                      //                                       fem,
                      //                                   letterSpacing:
                      //                                       0.09 * fem,
                      //                                   color: const Color(
                      //                                       0xffffffff),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                             _admin?.user?.first_name ==
                      //                                     _username
                      //                                 ? DropDown(
                      //                                     accessToken: widget
                      //                                         .accessToken!,
                      //                                     channelData: widget
                      //                                         .channelData!,
                      //                                   )
                      //                                 : DropDownLeave(
                      //                                     accessToken: widget
                      //                                         .accessToken!,
                      //                                     channelData: widget
                      //                                         .channelData!,
                      //                                   )
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
                                    image: widget.channelData!.imageUrl != null
                                        ? NetworkImage(
                                            widget.channelData!.imageUrl!)
                                        : widget.channelData!.imageFile != null
                                            ? FileImage(
                                                widget.channelData!.imageFile!)
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
                                      '${widget.channelData!.title}',
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
                          height: 0.64 * height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // participantsJvm (2967:8403)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                child: Text(
                                  'Statements',
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
                                  : channelStatements.isEmpty
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
                                                    height: 1.2999999183 *
                                                        ffem /
                                                        fem,
                                                    color:
                                                        const Color(0xe5606060),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )

                                      : StatementsList(
                                          channelStatements: channelStatements,
                                        )
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
        channelReadData: widget.channelData!,
      ),
    );
  }
}
