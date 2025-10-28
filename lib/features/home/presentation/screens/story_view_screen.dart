import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class StoryViewScreen extends StatelessWidget {
  const StoryViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Story View',
        showBackBtn: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageLoader(
              imagePath:
                  "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              width: context.screenWidth,
              height: context.screenHeight * .9,
            ),
          ],
        ),
      ),
    );
  }
}
