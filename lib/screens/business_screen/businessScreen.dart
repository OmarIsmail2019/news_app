import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/cubit/news_cubit.dart';
import 'package:news_app/data/cubit/news_state.dart';
import 'package:news_app/resources/string_manager.dart';
import 'package:news_app/widgets/drawer_component.dart';
import 'package:news_app/widgets/recent_news_component.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 15,
          title: Text(AppString.business,
              style: GoogleFonts.abhayaLibre(
                  fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        drawer: const DrawerWidget(),
        body: BlocProvider(
          create: (context) => NewsCubit()..getBusinessNews(),
          child: BlocBuilder<NewsCubit, NewsStates>(
            builder: (context, state) {
              var cubit = NewsCubit.get(context);
              if (state is NewsBusinessSuccessState) {
                return ListView.separated(
                    padding: const EdgeInsets.all(15),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsComponent(
                          url: cubit.breakingNews.articles![index].urlToImage ==
                                  null
                              ? 'https://static.thenounproject.com/png/504708-200.png'
                              : '${cubit.breakingNews.articles![index].urlToImage}',
                          title: '${cubit.breakingNews.articles![index].title}',
                          time:
                              '${cubit.breakingNews.articles![index].publishedAt}');
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: cubit.breakingNews.articles!.length);
              } else if (state is NewsBusinessLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(child: Text('Something error'));
              }
            },
          ),
        ));
  }
}
