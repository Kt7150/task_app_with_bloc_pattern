class ListingModel {
  final bool status;
  final int statusCode;
  final String message;
  final List<ListingCard> data;

  ListingModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> dataJson = json['data'] ?? [];
    final List<ListingCard> data = dataJson.map((cardJson) {
      return ListingCard.fromJson(cardJson);
    }).toList();

    return ListingModel(
      status: json['status'] ?? false,
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? '',
      data: data,
    );
  }
}

class ListingCard {
  final String cardName;
  final int cardType;
  final String aspectRatio;
  final List<Content> contentList;

  ListingCard({
    required this.cardName,
    required this.cardType,
    required this.aspectRatio,
    required this.contentList,
  });

  factory ListingCard.fromJson(Map<String, dynamic> json) {
    final List<dynamic> contentJson = json['content_list'] ?? [];
    final List<Content> contentList = contentJson.map((contentJson) {
      return Content.fromJson(contentJson);
    }).toList();

    return ListingCard(
      cardName: json['card_name'] ?? '',
      cardType: json['card_type'] ?? 0,
      aspectRatio: json['aspect_ratio'] ?? '',
      contentList: contentList,
    );
  }
}

class Content {
  final String imageUrl;
  final String name;
  final String contentId;
  final String aspectRatio;
  final bool isAvod;
  final bool isTvod;
  final bool isSvod;
  final bool isResume;
  final String duration;
  final String watchedDuration;

  Content({
    required this.imageUrl,
    required this.name,
    required this.contentId,
    required this.aspectRatio,
    required this.isAvod,
    required this.isTvod,
    required this.isSvod,
    required this.isResume,
    required this.duration,
    required this.watchedDuration,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      imageUrl: json['image_url'] ?? '',
      name: json['name'] ?? '',
      contentId: json['content_id'] ?? '',
      aspectRatio: json['aspect_ratio'] ?? '',
      isAvod: json['is_avod'] ?? false,
      isTvod: json['is_tvod'] ?? false,
      isSvod: json['is_svod'] ?? false,
      isResume: json['is_resume'] ?? false,
      duration: json['duration'] ?? '',
      watchedDuration: json['watched_duration'] ?? '',
    );
  }
}
