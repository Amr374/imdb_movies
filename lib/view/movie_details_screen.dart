import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_movies/model/movie_details_model.dart';
import 'package:imdb_movies/view_model/movie_details_cubit.dart';

import '../states.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsCubit, MoviesStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(backgroundColor: Colors.grey[800],
              title: Text('${MovieDetailsCubit.get(context).movieDetails!.fullTitle}'),
              centerTitle: true,),
            body:state != GetMovieDetailsLoadingState ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomCrausol(MovieDetailsCubit.get(context).movieDetails!.posters!.backDropsList),
                    SizedBox(height: 20,),
                    Actors(MovieDetailsCubit.get(context).movieDetails!.actorList)

                  ],

                ),
              ),
            ):Center(child: CircularProgressIndicator(),),
          );
        }
    );
  }
}
class Actors extends StatelessWidget {
  final List<Actor>? actorList;
  const Actors(this.actorList);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Cast',style: TextStyle(color: Colors.white),),
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: actorList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ActorTile(actorList![index].image,actorList![index].name,actorList![index].asCharacter),
                  );

            }),
          ),
        ],
      ),
    );
  }
}


class ContainerImage extends StatelessWidget {
  String? image;
   ContainerImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: 80,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('${image}'),
            fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight:Radius.circular(10.0)
          )
      ),
    );
  }
}
class ActorTile extends StatelessWidget {
  final String? image;
  final String? name;
  final String? asCharacter;
  const ActorTile(this.image,this.name,this.asCharacter);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex:6,child: ContainerImage(image)),
          // SizedBox(height: 5,),
          Expanded(flex:1,child: Center(child: Text('${name}',style: TextStyle(color: Colors.grey[200]),))),
          // SizedBox(height: 20,),
          Expanded(flex:1,child: Text('${asCharacter}',style: TextStyle(color: Colors.grey),))

        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10)


      ),
    );
  }
}

class CustomCrausol extends StatefulWidget {
  final List<PostersListModel> backDropsList ;
  const CustomCrausol(this.backDropsList);

  @override
  State<CustomCrausol> createState() => _CustomCrausolState();
}

class _CustomCrausolState extends State<CustomCrausol> {
  var _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width:MediaQuery.of(context).size.width ,
      child: CarouselSlider(
        items: widget.backDropsList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('${i.link}'),
                        fit: BoxFit.cover
                    )
                ),


                // child: Image.network(i)
              );
            },
          );
        }).toList(),

        carouselController: _controller,
        options: CarouselOptions(
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    );
  }
}
