

class ImageModel {
  int id;
  String url;
  String tittle;

  ImageModel(this.id, this.url, this.tittle);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    tittle = parsedJson['title'];
  }
}