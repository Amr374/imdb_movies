class MovieDetailsModel{

  List<Actor> actorList = [];
  // Map<String,dynamic> posters = {}
  // List<Actor> actorList = [];
  PostersModel? posters;
  String? id ;
  String? fullTitle ;
  String? type ;
  String? year ;
  String? image ;
  String? releaseDate ;
  String? runtimeMins ;
  String? runtimeStr ;
  String? plot ;
  String? contentRating ;
  String? imDbRating ;
  String? imDbRatingVotes ;
  String? metacriticRating ;
  String? languages ;
  String? countries ;
  String? companies ;
  String? genres ;
  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    json['actorList'].forEach((element){
      actorList.add(Actor.fromJson(element));
    });
    posters = PostersModel.fromJson(json['posters']);
    id = json['id'];
    fullTitle = json['fullTitle'];
    type = json['type'];
    year = json['year'];
    image = json['image'];
    releaseDate = json['releaseDate'];
    runtimeMins = json['runtimeMins'];
    runtimeStr = json['runtimeStr'];
    plot = json['plot'];
    contentRating = json['contentRating'];
    imDbRating = json['imDbRating'];
    imDbRatingVotes = json['imDbRatingVotes'];
    metacriticRating = json['metacriticRating'];
    languages = json['languages'];
    countries = json['countries'];
    companies = json['companies'];
    genres = json['genres'];

  }
}

class Actor{
  String? id ;
  String? name ;
  String? image ;
  String? asCharacter ;


  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    asCharacter = json['asCharacter'];




  }

}
class PostersModel{
  List<PostersListModel> postersList = [];
  List<PostersListModel> backDropsList = [];

  PostersModel.fromJson(Map<String, dynamic> json) {
    json['posters'].forEach((element){
      postersList.add(PostersListModel.fromJson(element));
    });
    json['backdrops'].forEach((element){
      backDropsList.add(PostersListModel.fromJson(element));
    });


  }
}

class PostersListModel{
  String? id ;
  String? link ;
  double? aspectRatio ;


  PostersListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    aspectRatio = json['aspectRatio'];

  }
}