// ignore_for_file: use_build_context_synchronously, duplicate_ignore, must_be_immutable

import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/bank/bank.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/logic/statements/statements.dart';
import 'package:changa_changa/logic/withdrowal/withdrawal.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/channel_list.dart';
import 'package:changa_changa/new-mobile-2/startPage.dart';
import 'package:changa_changa/widgets/dropDownClose.dart';
import 'package:changa_changa/widgets/dropDownLeave.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'confirmpayment.dart';

class Withdrawals extends StatefulWidget {
  ChannelRead channelData;
  String accessToken;

  Withdrawals(
      {super.key, required this.channelData, required this.accessToken});
  @override
  State<Withdrawals> createState() => _WithdrawalsState();
}

class _WithdrawalsState extends State<Withdrawals> {
  bool _isLoading = false;
  String? _accessToken;
  Participant? _admin;
  final _textControllerId = TextEditingController();
  List<Payment> channelStatements = [];
  String? _phone;
  String? amount;
  String? account;

  List<Bank> _banks = [];
  final _formKey = GlobalKey<FormState>();

  // final List<String> genderItems = [
  //   '',
  //   'Female',
  // ];

  Bank? selectedValue;
  int? selectedId;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    _textControllerId.dispose();
    super.dispose();
  }

  Future<void> fetchData(String accessToken) async {
    const url = 'https://api.changachanga.co.ke/api/v1/payments/banks/';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          _banks = List<Bank>.from(jsonData.map((bank) => Bank.fromJson(bank)));
        });
      } else {
        final jsonData = jsonDecode(response.body);
        throw Exception(jsonData['detail']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getBanks(accesstoken) async {}

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
    List<Payment> statements =
        await fetchStatements(accessToken, channelNumber);
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
    setState(() {
      _accessToken = widget.accessToken;
    });
    _loaduserData();
    _loadCurrentStatemets(widget.accessToken, widget.channelData.channel_id!);
    _loadChannelData(
        accessToken: _accessToken, chanId: widget.channelData.channel_id!);
    fetchData(widget.accessToken);
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
            // iphone11promax25pdP (2961:8487)
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // group1171274828d53 (2961:8513)
                  width: double.infinity,
                  height: 813,
                  child: Stack(
                    children: [
                      Positioned(
                        // group1171274977kfT (2961:8514)
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
                                        margin: EdgeInsets.fromLTRB(26.5 * fem,
                                            65 * fem, 26.5 * fem, 0 * fem),
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
                                                  ScaffoldMessenger.of(context)
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
                                                                  .fromARGB(255,
                                                              255, 255, 255),
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
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        67.93 * fem,
                                                        0 * fem),
                                                    child: Text(
                                                      'Campaign Withdrawal',
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
                        // rectangle5N6V (2961:8528)
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
                        // group1171274998457 (2990:9501)
                        left: 15 * fem,
                        top: 395 * fem,
                        child: SizedBox(
                          width: 384 * fem,
                          height: 340 * fem,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // frame307A89 (2961:8691)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 11 * fem),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // mediumlabelsemibold14px61o (2961:8692)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                        child: Text(
                                          'Amount',
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
                                        // frame1BJ9 (2961:8693)
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10 * fem),
                                          border: Border.all(
                                              color: const Color(0xffc4c4c4)),
                                          color: const Color(0xfffcfcfc),
                                        ),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Fill In';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            amount = value;
                                          },
                                          keyboardType: TextInputType.number,
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
                                                'Enter amount to widthdraw',
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
                                  // frame1171274971RiH (2961:8843)
                                  width: 383 * fem,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // mediumlabelsemibold14pxyUu (2961:8844)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                        child: Text(
                                          'Withdraw to',
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
                                          // frame163j (2961:8845)

                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10 * fem),
                                            border: Border.all(
                                                color: const Color(0xffc4c4c4)),
                                            color: const Color(0xfffcfcfc),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2<Bank>(
                                              isExpanded: true,
                                              hint: Text(
                                                'Select Bank',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ),
                                              items: _banks
                                                  .map((item) =>
                                                      DropdownMenuItem(
                                                        value: item,
                                                        child: Text(
                                                          item.name!,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              value: selectedValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedValue = value;
                                                  selectedId = value!.id;
                                                });
                                              },
                                              buttonStyleData:
                                                  const ButtonStyleData(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16),
                                                height: 40,
                                                width: 200,
                                              ),
                                              dropdownStyleData:
                                                  const DropdownStyleData(
                                                maxHeight: 200,
                                              ),
                                              menuItemStyleData:
                                                  const MenuItemStyleData(
                                                height: 40,
                                              ),
                                              dropdownSearchData:
                                                  DropdownSearchData(
                                                searchController:
                                                    textEditingController,
                                                searchInnerWidgetHeight: 50,
                                                searchInnerWidget: Container(
                                                  height: 50,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8,
                                                    bottom: 4,
                                                    right: 8,
                                                    left: 8,
                                                  ),
                                                  child: TextFormField(
                                                    expands: true,
                                                    maxLines: null,
                                                    controller:
                                                        textEditingController,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                        horizontal: 10,
                                                        vertical: 8,
                                                      ),
                                                      hintText:
                                                          'Search for an item...',
                                                      hintStyle:
                                                          const TextStyle(
                                                              fontSize: 12),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                searchMatchFn:
                                                    (item, searchValue) {
                                                  return item.value
                                                      .toString()
                                                      .contains(searchValue);
                                                },
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  // frame307A89 (2961:8691)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 10 * fem, 0 * fem, 11 * fem),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // mediumlabelsemibold14px61o (2961:8692)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                        child: Text(
                                          'Account Number',
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
                                        // frame1BJ9 (2961:8693)
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10 * fem),
                                          border: Border.all(
                                              color: const Color(0xffc4c4c4)),
                                          color: const Color(0xfffcfcfc),
                                        ),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Fill In';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            account = value;
                                          },
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
                                            hintText: 'Enter account number',
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
                                  height: 18 * fem,
                                ),
                                TextButton(
                                  // buttonRVT (2935:10624)
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      _formKey.currentState?.save();
                                      if (widget.channelData.runningBalance! <
                                          int.parse(amount!)) {
                                        final snackBar = SnackBar(
                                          /// need to set following properties for best effect of awesome_snackbar_content
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: 'On Snap!',
                                            message: 'Insufficient balance',

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
                                      PaymentResponse resp =
                                          await withdrawFromChannel(
                                        accessToken: widget.accessToken,
                                        accountNumber: account!,
                                        amount: int.parse(amount!),
                                        channelId:
                                            widget.channelData.channel_id!,
                                        destinationId: selectedId!,
                                      );
                                      if (resp.data.requestStatus ==
                                          'INITIATED') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ConfirmationPayment(
                                              accessToken: widget.accessToken,
                                              amount: amount!,
                                              channelData: widget.channelData,
                                              requestId: resp.statusUrl,
                                              dataFrom: 'withdraw',
                                            ),
                                          ),
                                        );
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      } else {
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
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    width: double.infinity,
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
                                        : Center(
                                            child: Center(
                                              child: Text(
                                                'Withdraw',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 17 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height:
                                                      1.4117647059 * ffem / fem,
                                                  color:
                                                      const Color(0xffffffff),
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
                                                text: 'Balance\n',
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
                                                    '${widget.channelData.runningBalance}',
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
