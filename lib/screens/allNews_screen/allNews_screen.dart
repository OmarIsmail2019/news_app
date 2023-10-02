import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/cubit/news_cubit.dart';
import '../../data/cubit/news_state.dart';
import '../../widgets/drawer_component.dart';
import '../../widgets/recent_news_component.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All News',
              style: GoogleFonts.abhayaLibre(
                  fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        drawer: const DrawerWidget(),
        body: BlocProvider(
          create: (context) => NewsCubit()..getEveryThingNews(),
          child: BlocBuilder<NewsCubit, NewsStates>(
            builder: (context, state) {
              var cubit = NewsCubit.get(context);
              if (state is NewsGeneralSuccessState) {
                return ListView.separated(
                    padding: const EdgeInsets.all(15),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsComponent(
                          url: cubit.general[index]['urlToImage'] == null
                              ? 'https://static.thenounproject.com/png/504708-200.png'
                              : '${cubit.general[index]['urlToImage']}',
                          title: '${cubit.general[index]['title']}',
                          time: '${cubit.general[index]['publishedAt']}');
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: cubit.general.length);
              } else if (state is NewsGeneralLoadingState) {
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
