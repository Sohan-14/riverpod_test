import 'package:app/core/config/colors.dart';
import 'package:app/core/config/sizes.dart';
import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:app/core/shared/widgets/app_outline_button.dart';
import 'package:app/core/shared/widgets/custom_app_bar.dart';
import 'package:app/core/shared/widgets/image_loader.dart';
import 'package:flutter/material.dart';

class Notification {
  final String title;
  final String message;
  final Widget? icon;
  final String? imageUrl;

  Notification({
    required this.title,
    required this.message,
    this.icon,
    this.imageUrl,
  });
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Notification> notifications = <Notification>[
      Notification(
        title: "New Message",
        message: "John reacted on your story.",
        icon: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite, color: AppColors.white),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000',
      ),
      Notification(
        title: "Friend Request",
        message: "Anna has sent you a friend request.",
        icon: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite, color: AppColors.white),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000',
      ),
      Notification(
        title: "Photo Like",
        message: "Mike liked your photo.",
        icon: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.thumb_up, color: Colors.blueAccent),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000',
      ),
      Notification(
        title: "New Message",
        message: "John reacted on your story.",
        icon: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite, color: AppColors.white),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000',
      ),
      Notification(
        title: "Friend Request",
        message: "Anna has sent you a friend request.",
        icon: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite, color: AppColors.white),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000',
      ),
      Notification(
        title: "Photo Like",
        message: "Mike liked your photo.",
        icon: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.thumb_up, color: Colors.blueAccent),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000',
      ),
      Notification(
        title: "New Message",
        message: "John reacted on your story.",
        icon: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite, color: AppColors.white),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000',
      ),
      Notification(
        title: "Friend Request",
        message: "Anna has sent you a friend request.",
        icon: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite, color: AppColors.white),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000',
      ),
      Notification(
        title: "Photo Like",
        message: "Mike liked your photo.",
        icon: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.thumb_up, color: Colors.blueAccent),
        ),
        imageUrl:
            'https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000',
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Notifications',
        showBackBtn: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              spacing: AppSizes.sm,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppOutlineButton(
                  width: 100,
                  height: 40,
                  label: "All (12)",
                  onPressed: () {},
                ),
                AppElevatedButton(
                  width: 100,
                  height: 40,
                  backgroundColor: AppColors.primary.withValues(alpha: .8),
                  label: "Unread (5)",
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: AppSizes.md),

            ListView.separated(
              itemCount: notifications.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return NotificationCard(notification: notifications[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: AppSizes.md,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final Notification notification;
  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: AppColors.primary, width: .5),
      ),
      child: Row(
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              ClipOval(
                child: ImageLoader(
                  imagePath: notification.imageUrl ?? '',
                  width: 60,
                  height: 60,
                ),
              ),

              Positioned(
                bottom: -5,
                right: -5,
                child: notification.icon ?? const SizedBox.shrink(),
              ),
            ],
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(notification.title, style: context.txtTheme.bodyLarge),
                const SizedBox(height: 4.0),
                Text(
                  notification.message,
                  style: context.txtTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
