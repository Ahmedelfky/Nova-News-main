import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/settings/presentation/widgets/custom_settings_tile.dart';

import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
appBar: AppBar(
  leading: IconButton(onPressed: (){
    Navigator.pop(context);
  }, icon: Icon(Icons.arrow_back,color: AppColors.primary,)),
  title: Text("Edit Profile",style: AppTextStyles.bodyLarge.copyWith(
    color: AppColors.primary,
    fontSize: 30,
    fontWeight: FontWeight.bold
  ),),
),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 70,
                  backgroundImage: AssetImage(AppAssets.personLogo),
                ),
              ),
                Positioned(
                    bottom: 0,
                    right: 140,
                    child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
        
                        ),
                        child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.edit,size: 30,color: AppColors.surface,))))
              ]
            ),
            const SizedBox(height: 20,),
            Text("Alexander Nova",style: AppTextStyles.headlineLarge,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Premium Member",style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.primary,
                ),)),
            const SizedBox(height: 20,),
            Text("alex@company.com \n+1 (555) 123-4567",style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 15,
            ),),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration:BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_2_outlined,color: AppColors.primary,),
                        const SizedBox(width: 10,),
                        Text("Personal Information",style: AppTextStyles.headlineMedium,),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text("Full Name",style: AppTextStyles.labelLarge.copyWith(
                      fontSize: 20
                    ),),
                    const SizedBox(height: 10,),
                    Text("Alexander Nova",style: AppTextStyles.bodyLarge,),
                    Divider(
                      height: 0.5,
                      color: AppColors.textLight.withValues(alpha: 0.5),
                      indent: 16,
                      endIndent: 16,
                    ),
                    const SizedBox(height: 10,),
                    Text("Email Address",style: AppTextStyles.labelLarge.copyWith(
                        fontSize: 20
                    ),),
                    const SizedBox(height: 10,),
                    Text("alex@company.com",style: AppTextStyles.bodyLarge,),
                    Divider(
                      height: 0.5,
                      color: AppColors.textLight.withValues(alpha: 0.5),
                      indent: 16,
                      endIndent: 16,
                    ),
                    const SizedBox(height: 10,),
                    Text("Location",style: AppTextStyles.labelLarge.copyWith(
                        fontSize: 20
                    ),),
                    const SizedBox(height: 10,),
                    Text("New York, USA",style: AppTextStyles.bodyLarge,),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
        children: [
          CustomSettingsTile(icon: Icons.bookmark_border_outlined, text: "Saved Articles",colorText: AppColors.textSecondary, onTap: (){}),
          CustomSettingsTile(icon: Icons.tune, text: "Reading Preferences",colorText: AppColors.textSecondary, onTap: (){}),
          CustomSettingsTile(icon: Icons.notifications_outlined, text: "Notifications",colorText: AppColors.textSecondary, onTap: (){}),
          CustomSettingsTile(icon: Icons.privacy_tip_outlined, text: "Privacy Policy",colorText: AppColors.textSecondary, onTap: (){}),
          CustomSettingsTile(icon: Icons.gavel_outlined, text: "Terms & Conditions",colorText: AppColors.textSecondary, onTap: (){}),
        
        ],
            ),
          ),
        ),
            const SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.logout,color: AppColors.error,)),
               Text("Logout",style: AppTextStyles.bodyLarge.copyWith(
                 color: AppColors.error
               ),),
             ],
           ),
            const SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
