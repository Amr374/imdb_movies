class SearchResult{

List<MovieDetails> results = [];

  SearchResult.fromJson(Map<String, dynamic> json) {
      json['results'].forEach((element){
        results.add(MovieDetails.fromJson(element));
      });


    }
}

class MovieDetails{
  String id = '' ;
  String? resultType ;
  String? image ;
  String? title ;
  String? description ;


  // MovieDetails({
  //   this.id,
  //   this.title,
  //   this.image,
  //   this.description,
  //   this.resultType,
  //
  // });

  MovieDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    resultType = json['resultType'];



  }

}