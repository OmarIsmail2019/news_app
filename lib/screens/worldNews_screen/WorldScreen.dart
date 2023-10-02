import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widgets/drawer_component.dart';

import '../../data/cubit/news_cubit.dart';
import '../../data/cubit/news_state.dart';
import '../../resources/string_manager.dart';
import '../../widgets/recent_news_component.dart';

class WorldScreen extends StatefulWidget {
  const WorldScreen({super.key});

  @override
  State<WorldScreen> createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 15,
          title: Text(AppString.world,
              style: GoogleFonts.abhayaLibre(
                  fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        drawer: const DrawerWidget(),
        body: BlocProvider(
          create: (context) => NewsCubit()..getWorldNews(),
          child: BlocBuilder<NewsCubit, NewsStates>(
            builder: (context, state) {
              var cubit = NewsCubit.get(context);
              if (state is NewsWorldSuccessState) {
                return ListView.separated(
                    padding: const EdgeInsets.all(15),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsComponent(
                          url: cubit.world[index]['urlToImage'] ==
                              null
                              ? 'https://static.thenounproject.com/png/504708-200.png'
                              : '${cubit.world[index]['urlToImage']}',
                          title: '${cubit.world[index]['title']}',
                          time:
                          '${cubit.world[index]['publishedAt']}');
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: cubit.world.length);
              } else if (state is NewsWorldLoadingState) {
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