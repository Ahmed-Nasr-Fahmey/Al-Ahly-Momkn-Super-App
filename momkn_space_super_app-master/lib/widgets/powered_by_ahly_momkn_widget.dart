import 'package:flutter/cupertino.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';

class PoweredByAhlyMomknWidget extends StatelessWidget {
  const PoweredByAhlyMomknWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Powered by",
          style: TextStyle(fontSize: AppTheme.fontSize16(context), color: AppTheme.greyHintColor),
        ),
        Image.asset('assets/ahly_momkn_logo.png'),
      ],
    );
  }
}
