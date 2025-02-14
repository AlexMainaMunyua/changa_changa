// ignore_for_file: file_names

import 'package:changa_changa/new-mobile-2/idInput.dart';
import 'package:changa_changa/new-mobile-2/kycver.dart';
import 'package:changa_changa/widgets/topbarner.dart';
import 'package:flutter/material.dart';
import 'package:changa_changa/utils.dart';

class AuthSelector extends StatelessWidget {
  const AuthSelector({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          // iphone11promax8VQu (2929:9032)
          width: double.infinity,
          height: 896 * fem,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              const TopBarner(),
              Positioned(
                // frame296de9 (2929:9061)
                left: 0 * fem,
                top: 289 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 50 * fem, 20 * fem, 300 * fem),
                  width: 414 * fem,
                  height: 607 * fem,
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        // buttonWC9 (2929:9062)
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KycVerification(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 48 * fem,
                          decoration: BoxDecoration(
                            color: const Color(0xff71ae00),
                            borderRadius: BorderRadius.circular(50 * fem),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Sign up',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 17 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4117647059 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18 * fem,
                      ),
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
                                            borderRadius: BorderRadius.circular(
                                                10.5 * fem),
                                            border: Border.all(
                                                color: const Color(0xffc4c4c4)),
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
                                          width: 14 * fem,
                                          height: 28 * fem,
                                          child: Text(
                                            'or',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 12 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.8 * ffem / fem,
                                              color: const Color(0xffc4c4c4),
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
                      SizedBox(
                        height: 18 * fem,
                      ),
                      TextButton(
                        // buttonRVT (2935:10624)
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IdInputLogin(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 48 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffc4c4c4)),
                            color: const Color(0xe5ffffff),
                            borderRadius: BorderRadius.circular(50 * fem),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 17 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4117647059 * ffem / fem,
                                  color: const Color(0xff151940),
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
            ],
          ),
        ),
      ),
    );
  }
}
