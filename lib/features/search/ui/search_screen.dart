import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/features/details/presentation/ui/news_details_screen.dart';
import 'package:news_app/features/home/logic/cubit/news_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/news_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: TextField(
          onChanged: (val) {
            context.read<NewsCubit>().searchNews(val);
          },
          decoration: InputDecoration(
            hintText: 'Search news...',

            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.r),
            ),
            fillColor: Colors.grey[200],
            filled: true,
          ),
        ),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 2.w,
              ),
            );
          }
          if (state is NewsError) {
            return Center(
              child: Text(
                "Not found news",
                style: TextStyle(color: Colors.red, fontSize: 16.sp),
              ),
            );
          }
          if (state is NewsSuccess) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                final article = state.news[index];
                return NewsCard(
                  imageUrl: article.imageUrl,
                  title: article.title,
                  description: article.description,
                  category: article.category,
                  readTime: article.readTime.toString(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(news: article),
                      ),
                    );
                  },
                );
              },
            );
          }
          return const Center(child: Text("Type something to search..."));
        },
      ),
    );
  }
}
