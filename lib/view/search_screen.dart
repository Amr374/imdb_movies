import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movies/view/movie_details_screen.dart';
import 'package:imdb_movies/view_model/search_cubit.dart';

import '../states.dart';
import '../view_model/movie_details_cubit.dart';


class Search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final TextEditingController searchController = TextEditingController();
  var id = 0;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body:  Container(
        height: 1000,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(5.0),
                    topLeft: Radius.circular(5.0),
                  )),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //   contentPadding: EdgeInsets.only(top: 14.0),
                  hintText: 'Search By Title ',
                  hintStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 14.0),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
                textInputAction: TextInputAction.search,
                controller: searchController,
                onSubmitted: (value)async {
                   SearchCubit.get(context).getSearchData(value);
                  // Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => MovieTile()));
                  setState(() {
                    pressed = true;
                  });

                },
              ),
            ),
            pressed ? Container(
              height: 600,
                child: MovieTile()):const SizedBox(height: 1,)
          ]
        ),
      )
    );
  }
}
class MovieTile extends StatelessWidget {
  const MovieTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, MoviesStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Container(
            child: state is MoviesLoadingState ?Center(child: CircularProgressIndicator()):
              ListView.builder(
                  itemCount: SearchCubit.get(context).searchResult!.results.length ,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            color: Colors.grey[800],
                            child: ListTile(

                              leading: Container(
                                width: 75,
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                        image: NetworkImage('${SearchCubit.get(context).searchResult!.results[index].image}')
                                    )
                                ),),
                              title: Text('${SearchCubit.get(context).searchResult!.results[index].title}',
                              style: TextStyle(color: Colors.white),
                              ),
                              subtitle:  Text('${SearchCubit.get(context).searchResult!.results[index].id}'
                              ,                      style: TextStyle(color: Colors.white),
                              ),
                              trailing: Text('${SearchCubit.get(context).searchResult!.results[index].resultType}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: ()async{
                         await MovieDetailsCubit.get(context).getMovieDetails(SearchCubit.get(context).searchResult!.results[index].id);
                            Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => MovieDetailsScreen()));
                            print(MovieDetailsCubit.get(context).movieDetails!.type);

                          },
                        ),
                        SizedBox(height: 5,)
                      ],
                    );
                  }),

          );
        }
    );
  }
}
