import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared/provider/role_provider.dart';
import 'feed_post_screen.dart';
import 'product_screen.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final Role role = ref.read(selectedRoleProvider);
            if (role != Role.seller) {
              return const FeedPostScreen();
            } else {
              return const ProductScreen();
            }
          },
        ),
      ),
    );
  }
}
