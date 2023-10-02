import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constant/api_constant.dart';
import 'package:news_app/data/cubit/news_state.dart';
import 'package:news_app/data/network/dio_factory/dioFactory.dart';
import 'package:news_app/model/top_headlines_model.dart';

import '../../model/every_thing_model.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  late BreakingNewsModel breakingNews;
  List<dynamic> sports = [];

  Future getBusinessNews() async {
    emit(NewsBusinessLoadingState());
    return await DioFactory.getData(url: ApiConstant.topHeadLinesUrl, query: {
      'apiKey': ApiConstant.apiKey,
      'country': ApiConstant.country,
      'category': ApiConstant.business
    }).then((value) {
      breakingNews = BreakingNewsModel.fromJson(value.data);
      print(breakingNews.articles![0].urlToImage);
      emit(NewsBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsBusinessErrorState(error.toString()));
    });
  }

  Future getSportsNews() async {
    emit(NewsSportsLoadingState());
    return await DioFactory.getData(url: ApiConstant.topHeadLinesUrl, query: {
      'apiKey': ApiConstant.apiKey,
      'country': ApiConstant.country,
      'category': ApiConstant.sports
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSportsErrorState(error.toString()));
    });
  }

  List<dynamic> health = [];

  Future getHealthNews() async {
    emit(NewsHealthLoadingState());
    return await DioFactory.getData(url: ApiConstant.topHeadLinesUrl, query: {
      'apiKey': ApiConstant.apiKey,
      'country': ApiConstant.country,
      'category': ApiConstant.health
    }).then((value) {
      health = value.data['articles'];
      emit(NewsHealthSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsHealthErrorState(error.toString()));
    });
  }

  late EveryThingModel everyThing;
  List<dynamic> general = [];

  Future getEveryThingNews() async {
    emit(NewsGeneralLoadingState());
    return await DioFactory.getData(url: ApiConstant.topHeadLinesUrl, query: {
      'apiKey': ApiConstant.apiKey,
      'country': ApiConstant.country,
      'category': ApiConstant.general
    }).then((value) {
      general = value.data['articles'];
      emit(NewsGeneralSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGeneralErrorState(error.toString()));
    });
  }

  List<dynamic> world = [];

  Future getWorldNews() async {
    emit(NewsWorldLoadingState());
    return await DioFactory.getData(
        url: ApiConstant.everyThingUrl,
        query: {'apiKey': ApiConstant.apiKey, 'q': 'العرب'}).then((value) {
      world = value.data['articles'];
      emit(NewsWorldSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsWorldErrorState(error.toString()));
    });
  }
}
