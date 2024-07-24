import 'package:flutter/material.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class AddCreditCardItem extends StatefulWidget {
  final String title;
  final String content;

  const AddCreditCardItem({super.key, required this.title, required this.content});

  @override
  _AddCreditCardItemState createState() => _AddCreditCardItemState();
}

class _AddCreditCardItemState extends State<AddCreditCardItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.content);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: AppTheme.fontSize18(context), color: AppTheme.greyHintColor, fontWeight: AppTheme.fontWeight700),
        ),
        SizedBox(
          width: context.screenWidth,
          child: TextField(
            controller: _controller,
            onChanged: (value) {},
            style: TextStyle(fontSize: AppTheme.fontSize18(context), color: AppTheme.blackColor, fontWeight: AppTheme.fontWeight700),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
            ),
          ),
        ),
        SizedBox(
          height: context.screenAspectRatio * 3,
        ),
        Container(
          width: double.infinity,
          height: 3,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primaryGreenColor, AppTheme.orangeColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
