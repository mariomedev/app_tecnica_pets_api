class ImageBreed {
  final String url;
  ImageBreed({required this.url});

  factory ImageBreed.fromJson(Map<String, dynamic> json) {
    return ImageBreed(url: json['url'] ?? '');
  }
}
