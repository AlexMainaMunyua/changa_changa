import 'package:changa_changa/utils.dart';
import 'package:flutter/material.dart';

class TopBarner extends StatelessWidget {
  const TopBarner({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Positioned(
      // frame294ckR (2929:9033)
      left: 0 * fem,
      top: 0 * fem,
      child: Container(
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 224.8 * fem),
        width: 414 * fem,
        height: 462 * fem,
        decoration: BoxDecoration(
          color: const Color(0xff00313d),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30 * fem),
            bottomLeft: Radius.circular(30 * fem),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // topstatusbar5e1 (2929:9035)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 88.5 * fem),
              width: 414 * fem,
              height: 52 * fem,
            ),
            Container(
              // frame312yzH (2929:9065)
              margin: EdgeInsets.fromLTRB(26 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: 230 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // welcometoiBB (2929:9066)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 16.5 * fem),
                    child: Text(
                      'Welcome to',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1499999762 * ffem / fem,
                        letterSpacing: 0.5 * fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  SizedBox(
                    // group1171274803oyK (2929:9067)
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // autogroup9mrkk7s (WNzCRRvEVrsCQqrrYT9mRK)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0.01 * fem, 1.97 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // groupFqK (2929:9098)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 6.23 * fem, 2.8 * fem),
                                width: 32.67 * fem,
                                height: 49.75 * fem,
                                child: Image.asset(
                                  'assets/new-mobile-2/images/group-tPb.png',
                                  width: 32.67 * fem,
                                  height: 49.75 * fem,
                                ),
                              ),
                              Container(
                                // autogroup2qg5kXB (WNzCdLk45UqpFt31ZG2qg5)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 2.43 * fem, 4.06 * fem),
                                width: 19.07 * fem,
                                height: 45.25 * fem,
                                child: Image.asset(
                                  'assets/new-mobile-2/images/auto-group-2qg5.png',
                                  width: 19.07 * fem,
                                  height: 45.25 * fem,
                                ),
                              ),
                              Container(
                                // autogroupbygvfPF (WNzCjqZEDGq4Y5mTZhbyGV)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 2.1 * fem, 4.05 * fem),
                                width: 14.53 * fem,
                                height: 44.5 * fem,
                                child: Image.asset(
                                  'assets/new-mobile-2/images/auto-group-bygv.png',
                                  width: 14.53 * fem,
                                  height: 44.5 * fem,
                                ),
                              ),
                              Container(
                                // autogroupp77oxt9 (WNzCqvDRvmjtrDmmxRP77o)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 1.39 * fem, 2.72 * fem, 0 * fem),
                                width: 14.09 * fem,
                                height: 39.56 * fem,
                                child: Image.asset(
                                  'assets/new-mobile-2/images/auto-group-p77o.png',
                                  width: 14.09 * fem,
                                  height: 39.56 * fem,
                                ),
                              ),
                              Container(
                                // autogroupu4334wB (WNzCvv56xJerSzVMM4u433)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 1.18 * fem, 2.12 * fem, 0 * fem),
                                width: 14.4 * fem,
                                height: 39.27 * fem,
                                child: Image.asset(
                                  'assets/new-mobile-2/images/auto-group-u433.png',
                                  width: 14.4 * fem,
                                  height: 39.27 * fem,
                                ),
                              ),
                              Container(
                                // autogroup4c4zaPj (WNzD1QwcH5siVHXyCT4c4Z)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 7.3 * fem, 2.15 * fem, 0 * fem),
                                width: 15.4 * fem,
                                height: 45.25 * fem,
                                child: Image.asset(
                                  'assets/new-mobile-2/images/auto-group-4c4z.png',
                                  width: 15.4 * fem,
                                  height: 45.25 * fem,
                                ),
                              ),
                              Container(
                                // autogrouphlmf5rH (WNzD7Qmci8AsD1bTfdHLmF)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 1.39 * fem, 0 * fem, 0 * fem),
                                width: 14.09 * fem,
                                height: 39.56 * fem,
                                child: Image.asset(
                                  'assets/new-mobile-2/images/auto-group-hlmf.png',
                                  width: 14.09 * fem,
                                  height: 39.56 * fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogrouprb1bCR7 (WNzDPEeadK4ZwTCT51RB1B)
                          margin: EdgeInsets.fromLTRB(
                              38.89 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          height: 6.68 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // vectorieM (2929:9085)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0.58 * fem, 4.59 * fem, 0 * fem),
                                width: 31.41 * fem,
                                height: 0.77 * fem,
                                child: Image.asset(
                                  'assets/new-mobile-2/images/vector-c33.png',
                                  width: 31.41 * fem,
                                  height: 0.77 * fem,
                                ),
                              ),
                              SizedBox(
                                // groupqU5 (2929:9068)
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // vectorm6q (2929:9069)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          1.5 * fem, 0.44 * fem, 0 * fem),
                                      width: 3.38 * fem,
                                      height: 5.18 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-ygM.png',
                                        width: 3.38 * fem,
                                        height: 5.18 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorgUh (2929:9070)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.29 * fem, 0.31 * fem, 0 * fem),
                                      width: 3.42 * fem,
                                      height: 3.97 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-NQy.png',
                                        width: 3.42 * fem,
                                        height: 3.97 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectoroJR (2929:9071)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.28 * fem, 0.33 * fem, 0 * fem),
                                      width: 5.01 * fem,
                                      height: 3.81 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-3zZ.png',
                                        width: 5.01 * fem,
                                        height: 3.81 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorKXf (2929:9072)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.3 * fem, 0.61 * fem, 0 * fem),
                                      width: 3.29 * fem,
                                      height: 3.97 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-qCV.png',
                                        width: 3.29 * fem,
                                        height: 3.97 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorScH (2929:9073)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.22 * fem, 0.15 * fem, 0 * fem),
                                      width: 1.75 * fem,
                                      height: 3.9 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-2RF.png',
                                        width: 1.75 * fem,
                                        height: 3.9 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorMz9 (2929:9074)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.3 * fem, 0.44 * fem, 0 * fem),
                                      width: 3.29 * fem,
                                      height: 3.97 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-dxD.png',
                                        width: 3.29 * fem,
                                        height: 3.97 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorVKf (2929:9075)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 2.37 * fem, 1.14 * fem),
                                      width: 3.37 * fem,
                                      height: 5.37 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-voT.png',
                                        width: 3.37 * fem,
                                        height: 5.37 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorobF (2929:9076)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0.16 * fem, 1.11 * fem),
                                      width: 3.38 * fem,
                                      height: 5.38 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-mhK.png',
                                        width: 3.38 * fem,
                                        height: 5.38 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectoriy7 (2929:9077)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          1.57 * fem, 2.09 * fem, 0 * fem),
                                      width: 3.37 * fem,
                                      height: 5.1 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-gdX.png',
                                        width: 3.37 * fem,
                                        height: 5.1 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorqXw (2929:9078)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0.14 * fem, 1.2 * fem),
                                      width: 3.83 * fem,
                                      height: 5.29 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-YYy.png',
                                        width: 3.83 * fem,
                                        height: 5.29 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorUau (2929:9079)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0.74 * fem, 1.21 * fem),
                                      width: 4.45 * fem,
                                      height: 5.47 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-W7K.png',
                                        width: 4.45 * fem,
                                        height: 5.47 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectora89 (2929:9080)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 2.23 * fem, 1.21 * fem),
                                      width: 3.67 * fem,
                                      height: 5.31 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-Ktu.png',
                                        width: 3.67 * fem,
                                        height: 5.31 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorJ49 (2929:9081)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0.5 * fem, 1.21 * fem),
                                      width: 3.67 * fem,
                                      height: 5.31 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-BYM.png',
                                        width: 3.67 * fem,
                                        height: 5.31 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectorReZ (2929:9082)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.26 * fem, 0.76 * fem, 0 * fem),
                                      width: 3.03 * fem,
                                      height: 3.96 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-ZUV.png',
                                        width: 3.03 * fem,
                                        height: 3.96 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectoro9K (2929:9083)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.2 * fem, 0.85 * fem, 0 * fem),
                                      width: 3.05 * fem,
                                      height: 3.89 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-1rH.png',
                                        width: 3.05 * fem,
                                        height: 3.89 * fem,
                                      ),
                                    ),
                                    Container(
                                      // vectori1P (2929:9084)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 1.2 * fem),
                                      width: 3.05 * fem,
                                      height: 5.29 * fem,
                                      child: Image.asset(
                                        'assets/new-mobile-2/images/vector-ByT.png',
                                        width: 3.05 * fem,
                                        height: 5.29 * fem,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
