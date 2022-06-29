import 'package:flutter/material.dart';
import 'package:front_app/app/shared/themes/app_colors.dart';
import 'package:front_app/app/shared/themes/app_text_styles.dart';

class HistoricCardWidget extends StatelessWidget {
  final String title;
  final DateTime date;
  final String description;
  const HistoricCardWidget(
      {Key? key,
      required this.title,
      required this.date,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.black, width: 2)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleH2,
                    ),
                    Text(
                      description,
                      style: AppTextStyles.cardH3,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ]),
            ),
          ),
          Positioned(
              top: 8,
              left: 8,
              child: Text(
                '${date.hour}:${date.minute} ${date.toUtc().day}/${date.toUtc().month}/${date.toUtc().year}',
                style: AppTextStyles.cardH3,
              ))
        ],
      ),
    );
  }
}
