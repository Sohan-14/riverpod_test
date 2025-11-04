import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/extensions/date_time_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class MessageModel {
  final bool isSender;
  final String message;

  MessageModel({required this.isSender, required this.message});
}

class OneToOneChatScreen extends StatelessWidget {
  const OneToOneChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MessageModel> messages = <MessageModel>[
      MessageModel(isSender: true, message: "Hi"),
      MessageModel(isSender: false, message: "Hi"),
      MessageModel(
        isSender: true,
        message: "when are we meeting its been so long since we meet.",
      ),
      MessageModel(isSender: false, message: "hy"),
      MessageModel(isSender: true, message: "Hi"),
      MessageModel(isSender: false, message: "Hi"),
      MessageModel(
        isSender: true,
        message: "when are we meeting its been so long since we meet.",
      ),
      MessageModel(isSender: false, message: "hy"),
      MessageModel(isSender: true, message: "Hi"),
      MessageModel(isSender: false, message: "Hi"),
      MessageModel(
        isSender: true,
        message: "when are we meeting its been so long since we meet.",
      ),
      MessageModel(isSender: false, message: "hy"),
      MessageModel(isSender: false, message: "hy"),
      MessageModel(isSender: true, message: "Hi"),
      MessageModel(isSender: false, message: "Hi"),
      MessageModel(
        isSender: true,
        message: "when are we meeting its been so long since we meet.",
      ),
      MessageModel(isSender: false, message: "hy"),
      MessageModel(isSender: false, message: "hy"),
      MessageModel(isSender: true, message: "Hi"),
      MessageModel(isSender: false, message: "Hi"),
      MessageModel(
        isSender: true,
        message: "when are we meeting its been so long since we meet.",
      ),
      MessageModel(isSender: false, message: "hy"),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizes.sm,
            children: <Widget>[
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 24.0,
                  color: AppColors.black,
                ),
              ),
              ClipOval(
                child: GestureDetector(
                  onTap: () => context.push(
                    RoutePaths.imageFullScreen,
                    extra: <String, String>{
                      "imagePath":
                          "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                    },
                  ),
                  child: const ImageLoader(
                    imagePath:
                        "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Rocky Parker",
                    style: context.txtTheme.bodyLarge,
                  ),
                  Text(
                    "Active",
                    style: context.txtTheme.bodySmall,
                  ),
                ],
              ),

              const Spacer(),

              PopupMenuButton<Text>(
                iconColor: AppColors.black,
                itemBuilder: (BuildContext context) => <PopupMenuItem<Text>>[
                  PopupMenuItem<Text>(
                    onTap: () => context.push(RoutePaths.report),
                    child: Text(
                      'Report User',
                      style: context.txtTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.md,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),

              ListView.separated(
                shrinkWrap: true,
                itemCount: messages.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) {
                  return MessageCard(message: messages[index]);
                },
                separatorBuilder: (_, _) => const SizedBox(
                  height: AppSizes.md,
                ),
              ),

              Container(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: AppSizes.spaceBetweenItems,
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSizes.md),
            child: AppTextField(
              labelText: "Message",
              controller: TextEditingController(),
              suffixIcon: GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: ImageLoader(
                    imagePath: AppIcons.send,
                    width: 16.0,
                    height: 16.0,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: AppSizes.spaceBetweenItems,
          ),
        ],
      ),
    );
  }

  void showPopupMenu(BuildContext context, GlobalKey buttonKey) async {
    // Get the position of the button
    final RenderBox button =
        buttonKey.currentContext!.findRenderObject() as RenderBox;
    final Offset buttonPosition = button.localToGlobal(
      Offset.zero,
    ); // Get the button's position on the screen

    // Show the menu at the button's position
    final String? result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx, // x position of the button
        buttonPosition.dy +
            button
                .size
                .height, // y position of the button (position + height for below the button)
        buttonPosition.dx + button.size.width, // x position for the right edge
        buttonPosition.dy +
            button.size.height, // y position (just below the button)
      ),
      items: <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Report',
          child: Text('Report'),
        ),
      ],
    );

    if (result != null) {
      switch (result) {
        case 'Report':
          context.push(RoutePaths.report);
          break;
      }
    }
  }
}

class MessageCard extends StatelessWidget {
  final MessageModel message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (message.isSender) const Spacer(),
        if (message.isSender) ...<Widget>[
          Text(
            DateTime.now().formattedTime,
            style: context.txtTheme.bodyMedium,
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          constraints: BoxConstraints(maxWidth: context.screenWidth * .5),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            message.message,
            style: context.txtTheme.bodyMedium?.copyWith(
              color: AppColors.white,
            ),
          ),
        ),

        if (!message.isSender) ...<Widget>[
          const SizedBox(
            width: 8.0,
          ),
          Text(
            DateTime.now().formattedTime,
            style: context.txtTheme.bodyMedium,
          ),
        ],
      ],
    );
  }
}
