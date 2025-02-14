// ignore_for_file: use_build_context_synchronously, must_be_immutable, duplicate_ignore, file_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:changa_changa/logic/channels/channels.dart';
import 'package:changa_changa/models/channels.dart';
import 'package:changa_changa/new-mobile-2/channel_list.dart';
import 'package:changa_changa/new-mobile-2/startPage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownLeave extends StatefulWidget {
  String accessToken;
  ChannelRead channelData;
  DropDownLeave(
      {super.key, required this.accessToken, required this.channelData});

  @override
  State<DropDownLeave> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DropDownLeave> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isDense: true,
        customButton: const Icon(
          Icons.more_horiz,
          size: 20,
          color: Color(0xffffffff),
        ),
        items: [
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value! as MenuItem, widget.accessToken,
              widget.channelData.channel_id!);
        },
        dropdownStyleData: DropdownStyleData(
          width: 160,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xffffffff),
          ),
          offset: const Offset(0, 8),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            8,
            ...List<double>.filled(MenuItems.secondItems.length, 48),
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> secondItems = [leave];

  static const leave = MenuItem(text: 'Leave', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Color(0xff00313d),
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item, String accessToken,
      String channelId) async {
    switch (item) {
      case MenuItems.leave:
        try {
          await leaveChannel(
            accessToken,
            channelId,
          );
          List<dynamic>? userChannelListData =
              await userChannelList(accessToken);
          if (userChannelListData.isNotEmpty) {
            List<Channels>? userChannels = userChannelListData
                .map((item) => Channels.fromJson(item))
                .toList();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChanelList(userChannelList: userChannels)));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StartPage()));
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
        break;
    }
  }
}
