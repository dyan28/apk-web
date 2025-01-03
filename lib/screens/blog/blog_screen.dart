import 'package:flutter/material.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/components/common_scaffold.dart';
import 'package:apkfree/generated/l10n.dart';
import 'package:apkfree/screens/blog/widgets/blog_list_widget.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Column(
        children: [
          Text(
            L10n.of(context).blog,
            style: AppTextStyle.extraLarge,
          ),
          const BlogListWidget(),
        ],
      ),
    );
  }
}
