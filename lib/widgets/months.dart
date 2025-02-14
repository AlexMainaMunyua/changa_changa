import 'package:flutter/material.dart';

Container buildMonthContainer(String monthName, double fem, double ffem) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    width: 57 * fem,
    height: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xff00313d),
      borderRadius: BorderRadius.circular(100 * fem),
    ),
    child: Center(
      child: Text(
        monthName,
        style: TextStyle(
          fontFamily: 'SF Compact',
          fontSize: 9 * ffem,
          height: 1.3533593284 * ffem / fem,
          letterSpacing: -0.1800000215 * fem,
          color: const Color(0xffffffff),
        ),
      ),
    ),
  );
}