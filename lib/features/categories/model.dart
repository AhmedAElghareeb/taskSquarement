class PhotosData {
  late final List<PhotosModel> data;

  PhotosData.fromJson(List<dynamic> json) {
    data = json.map((e) => PhotosModel.fromJson(e)).toList();
  }
}

class PhotosModel {
  late final num albumId;
  late final num id;
  late final String title;
  late final String url;
  late final String thumbnailUrl;

  PhotosModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'] ?? 0;
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    url = json['url'] ?? "";
    thumbnailUrl = json['thumbnailUrl'] ?? "";
  }
}