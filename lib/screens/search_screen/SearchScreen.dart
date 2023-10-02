// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/data/cubit/news_cubit.dart';
// import 'package:news_app/data/cubit/news_state.dart';

// import '../../widgets/recent_news_component.dart';

// class SearchNews extends StatefulWidget {
//   const SearchNews({super.key});

//   @override
//   State<SearchNews> createState() => _SearchNewsState();
// }

// class _SearchNewsState extends State<SearchNews> {
//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) =>
//             NewsCubit()..EveryThingNews(search: controller.text),
//         child: BlocBuilder<NewsCubit, NewsStates>(
//           builder: (context, state) {
//             var cubit = NewsCubit.get(context);
//             if (state is NewsSearchSuccessState) {
//               ListView.separated(
//                   itemBuilder: (context, index) {
//                     return RecentNewsComponent(
//                       time: cubit.search[index]["publishedAt"],
//                       title: cubit.search[index]["title"],
//                       url: cubit.search[index]["urlToImage"],
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return const SizedBox(
//                       height: 10,
//                     );
//                   },
//                   itemCount: cubit.search.length);
//             }
//             return Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: controller,
//                     keyboardType: TextInputType.text,
//                     onChanged: (value) {
//                       NewsCubit.get(context).EveryThingNews(search: value);
//                     },
//                     decoration: InputDecoration(
//                         hintText: 'Search',
//                         labelText: 'Seach',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20))),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
