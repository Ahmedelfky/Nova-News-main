import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/details/presentation/ui/news_details_screen.dart';
import 'package:news_app/features/home/logic/cubit/news_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/news_card.dart';
import 'package:news_app/features/search/ui/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent * 0.9) {
      context.read<NewsCubit>().getNews();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 2.w,
              ),
            );
          }
          if (state is NewsError) {
            return Center(
              child: Text(
                "Failed to load news",
                style: AppTextStyles.bodyMedium.copyWith(color: Colors.red),
              ),
            );
          }
          if (state is NewsSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<NewsCubit>().getNews(isRefresh: true);
              },
              child: CustomScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    systemOverlayStyle: SystemUiOverlayStyle.dark,
                    pinned: true,
                    expandedHeight: 60.h,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    flexibleSpace: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          color: AppColors.background.withValues(alpha: 0.75),
                        ),
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 28.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: Text(
                              "N",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "NovaNews",
                          style: AppTextStyles.headlineMedium.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5.sp,
                          ),
                        ),
                      ],
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.search),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ).r,
                      child: Column(
                        children: [
                          Text(
                            "The Morning Brief",
                            style: AppTextStyles.bodyLarge,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Curated insights for the modern \n professional. Stay ahead of the curve.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 20.h,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index == state.news.length) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ).r,
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                  strokeWidth: 2.w,
                                ),
                              ),
                            );
                          }
                          final article = state.news[index];
                          return NewsCard(
                            imageUrl: article.imageUrl,
                            title: article.title,
                            description: article.description,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NewsDetailsScreen(news: article),
                                ),
                              );
                            },
                            category: article.category,
                            readTime: article.readTime.toString(),
                          );
                        },
                        childCount: state.hasReachedMax
                            ? state.news.length
                            : state.news.length + 1,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
