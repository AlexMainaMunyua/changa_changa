// ignore_for_file: must_be_immutable, file_names

import 'package:changa_changa/logic/statements/statements.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';
import 'package:intl/intl.dart';

class StatementsList extends StatefulWidget {
  List<Payment> channelStatements;
  StatementsList({super.key, required this.channelStatements});

  @override
  State<StatementsList> createState() => _StatementsListState();
}

class _StatementsListState extends State<StatementsList> {
  String formatDate(DateTime date, String format) {
    return DateFormat(format).format(date);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: widget.channelStatements.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // frame1171274971fC5 (2967:8508)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 22 * fem),
            width: double.infinity,
            height: 38 * fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      // group1171274975bLd (2967:8509)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 2.5 * fem, 16 * fem, 5.5 * fem),
                      width: 30 * fem,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffffd0bd),
                        borderRadius: BorderRadius.circular(15 * fem),
                      ),
                      child: Center(
                        child: Text(
                          widget.channelStatements[index].user == null
                              ? 'PVL'
                              : widget
                                  .channelStatements[index].user!.firstName![0]
                                  .toUpperCase(),
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 11.3513507843 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2857143817 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // michaeldoe96573092zNm (2967:8513)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 120 * fem, 0 * fem),
                      constraints: BoxConstraints(
                        maxWidth: 100 * fem,
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
                              text: widget.channelStatements[index].user == null
                                  ? 'Paid Via Link\n'
                                  : '${widget.channelStatements[index].user!.firstName![0].toUpperCase() + widget.channelStatements[index].user!.firstName!.substring(1).toLowerCase()}\n',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.3533593587 * ffem / fem,
                                letterSpacing: 0.14 * fem,
                                color: const Color(0xff000000),
                              ),
                            ),
                            TextSpan(
                              text: widget.channelStatements[index].user == null
                                  ? widget.channelStatements[index]
                                      .paymentReferenceId
                                  : widget
                                      .channelStatements[index].user!.username,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 9 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 2.105225669 * ffem / fem,
                                letterSpacing: 0.14 * fem,
                                color: const Color(0xb2000000),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // kes10000000000060923FCD (2967:8514)
                        constraints: BoxConstraints(
                          maxWidth: 133 * fem,
                        ),
                        child: RichText(
                          textAlign: TextAlign.right,
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
                                text: widget.channelStatements[index].user ==
                                        null
                                    ? '+ KES. ${widget.channelStatements[index].amount}\n'
                                    : widget.channelStatements[index]
                                                .transactionType ==
                                            'credit'
                                        ? '+ KES. ${widget.channelStatements[index].amount}\n'
                                        : '- KES. ${widget.channelStatements[index].amount}\n',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5789192518 * ffem / fem,
                                  letterSpacing: 0.14 * fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                              TextSpan(
                                text: formatDate(
                                    widget
                                        .channelStatements[index].timestampUtc,
                                    "dd / MM / yyyy"),
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.8947031021 * ffem / fem,
                                  letterSpacing: 0.14 * fem,
                                  color: const Color(0xb2000000),
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
    );
  }
}
