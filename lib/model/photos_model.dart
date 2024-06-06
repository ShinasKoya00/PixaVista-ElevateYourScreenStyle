class PhotosModel {
  String imgSrc;
  String photographerName;

  PhotosModel({
    required this.imgSrc,
    required this.photographerName,
  });

  static PhotosModel fromApiToApp(Map<String, dynamic> photoMap) {
    return PhotosModel(
      imgSrc: (photoMap["src"])["original"],
      photographerName: photoMap["photographer"],
    );
  }
}
