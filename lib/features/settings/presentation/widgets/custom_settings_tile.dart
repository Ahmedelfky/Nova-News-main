import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CustomSettingsTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final Color? colorText;
  final VoidCallback onTap;
  final Widget? trailing;
  final String? textLang;
  const CustomSettingsTile( {
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.color,
    this.trailing,
    this.colorText,
    this.textLang
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(
              icon,color: color ?? AppColors.primary,
              size: 24,),
            const SizedBox(width: 10),
            Expanded(
                child: Text(text,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorText??AppColors.primary,
                ),)),
            const Spacer(),
            Text(textLang ?? "",style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: colorText??AppColors.primary,
            ),),
            SizedBox(width: 10,),
            trailing ?? Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
