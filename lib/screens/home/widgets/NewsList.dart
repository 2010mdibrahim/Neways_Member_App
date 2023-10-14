// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:super_home_member/config/constanent.dart';

// ignore: must_be_immutable
class NewsList extends StatelessWidget {
  NewsList({
    required this.onPress,
    required this.title,
    Key? key,
  }) : super(key: key);
  VoidCallback onPress;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
               Icon(
                Icons.my_library_books_outlined,
                color: Colors.cyan[400],
                size: 18,
              ),
              const SizedBox(width: defaultPadding / 4),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
