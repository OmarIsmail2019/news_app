import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/cubit/news_cubit.dart';
import 'package:news_app/data/cubit/news_state.dart';
import 'package:news_app/widgets/breaking_news_component.dart';
import 'package:news_app/widgets/drawer_component.dart';
import '../../resources/routes_manager.dart';
import '../../widgets/carusal_shimmer_loading.dart';
import '../../widgets/recent_news_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        title: Text('News',
            style: GoogleFonts.abhayaLibre(
                fontSize: 28, fontWeight: FontWeight.bold)),
      ),
      drawer: const DrawerWidget(),
      body: BlocProvider(
        create: (context) => NewsCubit()..getEveryThingNews(),
        child: BlocBuilder<NewsCubit, NewsStates>(
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            if (state is NewsGeneralLoadingState) {
              return const HomeScreenLoading();
            } else if (state is NewsGeneralSuccessState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Breaking News',
                        style: GoogleFonts.abhayaLibre(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // // carusal for breaking news
                      CarouselSlider.builder(
                          itemCount: 5,
                          itemBuilder: (context, index, id) {
                            return BreakingNewsComponent(
                                source:
                                    '${cubit.general[index]['source']['name']}',
                                title: '${cubit.general[index]['title']}',
                                url: cubit.general[index]['urlToImage'] == null
                                    ? 'https://static.thenounproject.com/png/504708-200.png'
                                    : '${cubit.general[index]['urlToImage']}');
                          },
                          options: CarouselOptions(
                              aspectRatio: 19 / 9,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                              autoPlayCurve: Curves.easeInExpo,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 2),
                              enlargeCenterPage: true)),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent News',
                            style: GoogleFonts.abhayaLibre(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.allNews);
                              },
                              child: Text(
                                'See All',
                                style: GoogleFonts.abhayaLibre(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  color: Colors.blueAccent,
                                ),
                              ))
                        ],
                      ),
                      // list for recent news
                      ListView.separated(
                        padding: const EdgeInsets.only(top: 10),
                        primary: true,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        separatorBuilder: ((context, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        }),
                        itemBuilder: (context, index) {
                          return NewsComponent(
                            time: '${cubit.general[index]['publishedAt']}',
                            title: '${cubit.general[index]['title']}',
                            url: cubit.general[index]['urlToImage'] == null
                                ? 'https://static.thenounproject.com/png/504708-200.png'
                                : '${cubit.general[index]['urlToImage']}',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Text('Something Error');
            }
          },
        ),
      ),
    );
  }
}
