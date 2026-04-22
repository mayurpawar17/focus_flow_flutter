class EntryRequest {
  String? title;
  String? category;
  int? timeSpent;

  EntryRequest({this.title, this.category, this.timeSpent});

  EntryRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    timeSpent = json['timeSpent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['category'] = this.category;
    data['timeSpent'] = this.timeSpent;
    return data;
  }
}
