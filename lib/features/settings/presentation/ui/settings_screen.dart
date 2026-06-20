import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/settings/presentation/widgets/custom_settings_tile.dart';
import '../../../profile/presentation/ui/edit_profile_screen.dart';
import '../widgets/custom_mode_widget.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading:IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: AppColors.primary,)) ,
        title: Text("Settings",style: AppTextStyles.bodyLarge.copyWith(
          fontSize: 30,
          color: AppColors.primary, fontWeight: FontWeight.bold
        ),),
        actions: [
          Icon(Icons.search,color: AppColors.primary,),
          const SizedBox(width: 10,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color:AppColors.surface,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.background,
                  backgroundImage: AssetImage(AppAssets.personLogo),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Julian Sterling",style: AppTextStyles.headlineLarge,),
                    Text("Premium Subscriber",style: AppTextStyles.bodyLarge,),
                  ],
                )
              ],
            ),
          ),
              SizedBox(height: 20,),
              Text("Account"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:AppColors.surface,
                ),
                child: Column(
                  children: [

                    const SizedBox(height: 16,),
                    CustomSettingsTile(
                        icon: Icons.person_2_outlined,
                        text: "Edit Profile",colorText: AppColors.textPrimary,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()),
                          );}),
                    Divider(
                      height: 0.5,
                      color: AppColors.textLight.withValues(alpha: 0.5),
                      indent: 16,
                      endIndent: 16,
                    ),
                    CustomSettingsTile(icon: Icons.lock,
                      text: "Change Password",
                      colorText: AppColors.textPrimary,
                      onTap: (){},),
                    Divider(
                      height: 0.5,
                      color: AppColors.textLight.withValues(alpha: 0.5),
                      indent: 16,
                      endIndent: 16,
                    ),
                    CustomSettingsTile(icon: Icons.security,
                      text: "Security",
                      colorText: AppColors.textPrimary,
                      onTap: (){},),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Preferences"),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:AppColors.surface,
                  ),
                  child: Column(
                    children: [
                      CustomSettingsTile(
                          icon: Icons.notifications_none,
                          text: "Notifications",
                          colorText: AppColors.textPrimary,
                          trailing: Switch(value: true,
                              activeThumbColor: AppColors.surface,
                              activeTrackColor: AppColors.primary,
                              onChanged: (newValue){}),
                          onTap: (){}),
                      Divider(
                        height: 0.5,
                        color: AppColors.textLight.withValues(alpha: 0.5),
                        indent: 16,
                        endIndent: 16,
                      ),
                      CustomSettingsTile(
                          icon: Icons.language,
                          text: "Language",
                          colorText: AppColors.textPrimary,
                          textLang: "English",
                          onTap: (){}),
                      Divider(
                        height: 0.5,
                        color: AppColors.textLight.withValues(alpha: 0.5),
                        indent: 16,
                        endIndent: 16,
                      ),
                      CustomModeWidget(),
                    ],
                  ),
              ),
              SizedBox(height: 20,),
              Text("Support"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:AppColors.surface,
                ),
                child: Column(
                  children: [
                    CustomSettingsTile(icon: Icons.help_outline_outlined,
                        text: "Help Center",
                        colorText: AppColors.textPrimary,
                        onTap: (){}),
                    CustomSettingsTile(icon: Icons.chat_bubble_outline_outlined,
                        text: "Contact Support",
                        colorText: AppColors.textPrimary,
                        onTap: (){}),
                    CustomSettingsTile(
                        icon: Icons.info_outline,
                        text: "About App",
                        colorText: AppColors.textPrimary, onTap: (){}),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Account Actions"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:AppColors.surface,
                ),
                child: Column(
                  children: [
                    CustomSettingsTile(icon: Icons.logout,color: AppColors.error,
                        text: "Logout",
                        colorText: AppColors.error,
                        trailing: Text(""),
                        onTap: (){}),
                    CustomSettingsTile(icon: Icons.delete_forever_rounded,
                        color: AppColors.error,
                        text: "Delete Account",
                        colorText: AppColors.error,
                        trailing: Text(""),
                        onTap: (){}),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
