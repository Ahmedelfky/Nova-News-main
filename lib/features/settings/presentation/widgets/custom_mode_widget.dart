import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/features/settings/presentation/widgets/themebutton.dart';

class CustomModeWidget extends StatelessWidget {
  const CustomModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.palette_outlined,color: AppColors.primary,),
              SizedBox(width: 10,),
              Text("Theme",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Themebutton(title: "Light", icon: Icons.brightness_5, isSelected: true, onTap: (){}),
              Themebutton(title: "Dark", icon: Icons.brightness_2, isSelected: false, onTap: (){}),
            ],
          ),
        ],
      ),
    );
  }
}
