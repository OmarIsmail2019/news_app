import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/cubit/news_cubit.dart';
import '../../data/cubit/news_state.dart';
import '../../resources/string_manager.dart';
import '../../widgets/drawer_component.dart';
import '../../widgets/recent_news_component.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 15,
          title: Text(AppString.sports,
              style: GoogleFonts.abhayaLibre(
                  fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        drawer: const DrawerWidget(),
        body: BlocProvider(
          create: (context) => NewsCubit()..getSportsNews(),
          child: BlocBuilder<NewsCubit, NewsStates>(
            builder: (context, state) {
              var cubit = NewsCubit.get(context);
              if (state is NewsSportsSuccessState) {
                return ListView.separated(
                    padding: const EdgeInsets.all(15),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsComponent(
                          url: cubit.sports[index]['urlToImage'] ==
                              null
                              ? 'https://static.thenounproject.com/png/504708-200.png'
                              : '${cubit.sports[index]['urlToImage']}',
                          title: '${cubit.sports[index]['title']}',
                          time:
                          '${cubit.sports[index]['publishedAt']}');
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: cubit.sports.length);
              } else if (state is NewsSportsLoadingState) {
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
