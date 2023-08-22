class BannerModel {
  final bool status;
  final int statusCode;
  final String message;
  final List<BannerCard> data;

  BannerModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      status: json['status'] ?? false,
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((cardJson) => BannerCard.fromJson(cardJson))
          .toList() ??
          [],
    );
  }
}

class BannerCard {
  final String cardName;
  final int cardType;
  final String aspectRatio;
  final List<Content> contentList;

  BannerCard({
    required this.cardName,
    required this.cardType,
    required this.aspectRatio,
    required this.contentList,
  });

  factory BannerCard.fromJson(Map<String, dynamic> json) {
    return BannerCard(
      cardName: json['card_name'] ?? '',
      cardType: json['card_type'] ?? 0,
      aspectRatio: json['aspect_ratio'] ?? '',
      contentList: (json['content_list'] as List<dynamic>?)
          ?.map((contentJson) => Content.fromJson(contentJson))
          .toList() ??
          [],
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
  final String? duration;
  final bool? isResume;
  final String? watchedDuration;

  Content({
    required this.imageUrl,
    required this.name,
    required this.contentId,
    required this.aspectRatio,
    required this.isAvod,
    required this.isTvod,
    required this.isSvod,
    this.duration,
    this.isResume,
    this.watchedDuration,
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
      duration: json['duration'],
      isResume: json['is_resume'],
      watchedDuration: json['watched_duration'],
    );
  }
}
