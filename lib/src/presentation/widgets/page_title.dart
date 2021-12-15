import 'package:flutter/material.dart';
import 'package:manabie_todo/src/presentation/widgets/app_color.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: AppColors.secondaryColor,
            blurRadius: 1,
            spreadRadius: 3,
          )
        ],
      ),
      width: double.infinity,
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
