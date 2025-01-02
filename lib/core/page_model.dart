class PageModel<T> {
  final List<T> content;
  final int totalElements;
  final int totalPages;
  final int currentPage;

  PageModel({
    required this.content,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
  });

  factory PageModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PageModel<T>(
      content: List<T>.from(json['content'].map((item) => fromJsonT(item))),
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
    );
  }
}
