import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/core/extentions/screen_size.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/app_theme.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/snackbar_message.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_app_bar.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_circular_progress_indicator.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/main_layout.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/CachedNotifications.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/presentation/bloc/bloc/notification_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/features/notificartions/presentation/widgets/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // List<NotificationEntity> notifications = [];
  @override
  void initState()  {
    super.initState();
    context.read<NotificationBloc>().add(const GetNotificationsEvent(
        mobileNumber: "mobileNumber", ip: "ip", password: "password"));

  }

  @override
  Widget build(BuildContext context) {

    return MainLayout(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          showBackCursor: true,
          title: Text(
            "Notifications",
            style: TextStyle(
                fontSize: AppTheme.fontSize24(context),
                fontWeight: AppTheme.fontWeight500,
                color: AppTheme.blackColor),
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.025,
        ),
        CachedNotifications.data.length>0? ListView.builder(
          itemCount: CachedNotifications.data.length,
          itemBuilder: (context, index) {
            return NotificationWidget(notificationEntity: CachedNotifications.data[index]);
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ):SizedBox(),
        BlocConsumer<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is GetNotificationsSuccessState) {
              if (state.notifications.isEmpty) {
                return Center(
                  child: SizedBox(
                      width: context.screenWidth * 0.8,
                      child: Text(
                        "No Notifications Yet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppTheme.fontSize20(context),
                            color: AppTheme.primaryGreenColor,
                            fontWeight: AppTheme.fontWeight600),
                      )),
                );
              } else {
                return SizedBox();
              }
            }else if(state is GetNotificationstLoadingState){
              return CustomCircularProgressIndicator(
                color: AppTheme.primaryGreenColor,
              );
            }
            else {
              return SizedBox();
            }
          },
          listener: (context, state) {
            if (state is GetNotificationsErrorState) {
              SnackBarMessage.showErrorSnackBar(
                  message: state.message, context: context);
            }
            else if(state is GetNotificationsSuccessState){
              CachedNotifications.data = state.notifications;
              setState(() {

              });
            }
            else if(state is GetNotificationstLoadingState){
              SnackBarMessage.showSuccessSnackBar(message: "Getting Notifications", context: context);
            }
          },
        ),
      ],
    ));
  }
}
