import 'package:flutter/material.dart';
import 'feed_post_screen.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FeedPostScreen(),
      ),
    );
  }
}
