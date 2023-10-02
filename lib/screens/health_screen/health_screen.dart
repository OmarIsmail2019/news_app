import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widgets/drawer_component.dart';

import '../../data/cubit/news_cubit.dart';
import '../../data/cubit/news_state.dart';
import '../../resources/string_manager.dart';
import '../../widgets/recent_news_component.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 15,
          title: Text(AppString.health,
              style: GoogleFonts.abhayaLibre(
                  fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        drawer: const DrawerWidget(),
        body: BlocProvider(
          create: (context) => NewsCubit()..getHealthNews(),
          child: BlocBuilder<NewsCubit, NewsStates>(
            builder: (context, state) {
              var cubit = NewsCubit.get(context);
              if (state is NewsHealthSuccessState) {
                return ListView.separated(
                    padding: const EdgeInsets.all(15),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsComponent(
                          url: cubit.health[index]['urlToImage'] ==
                              null
                              ? 'https://static.thenounproject.com/png/504708-200.png'
                              : '${cubit.health[index]['urlToImage']}',
                          title: '${cubit.health[index]['title']}',
                          time:
                          '${cubit.health[index]['publishedAt']}');
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: cubit.health.length);
              } else if (state is NewsHealthLoadingState) {
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