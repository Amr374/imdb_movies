import 'package:flutter/material.dart';

import '../constants/api_constants.dart';
import '../view_model/search_cubit.dart';

class PopularFilmWidgetState extends StatelessWidget {
  List movies = ['sdsd','sdsdsd'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 700,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final singleMovieModel = movies[index];
            return TextButton(
              onPressed: () {
                SearchCubit.get(context).getSearchData('Inspection');
              },
              child: Text('${movies[index]}') ,
              // child: Image.network(
              //     '${ApiConstants.BASE_IMAGE_URL}/${singleMovieModel.posterPath}'),
            );
          },
        ),
      ),
    );
  }
}