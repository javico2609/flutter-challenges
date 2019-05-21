class StackOverflowModel {
  List<String> tags;
  Owner owner;
  bool isAnswered;
  int viewCount;
  int closedDate;
  int answerCount;
  int score;
  int lastActivityDate;
  int creationDate;
  int lastEditDate;
  int questionId;
  String link;
  String closedReason;
  String title;

  StackOverflowModel({
    this.tags,
    this.owner,
    this.isAnswered,
    this.viewCount,
    this.closedDate,
    this.answerCount,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.lastEditDate,
    this.questionId,
    this.link,
    this.closedReason,
    this.title,
  });

  StackOverflowModel.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    isAnswered = json['is_answered'];
    viewCount = json['view_count'];
    answerCount = json['answer_count'];
    score = json['score'];
    lastActivityDate = json['last_activity_date'];
    creationDate = json['creation_date'];
    questionId = json['question_id'];
    link = json['link'];
    title = json['title'];
  }
}

class Owner {
  int reputation;
  int userId;
  String userType;
  String profileImage;
  String displayName;
  String link;

  Owner({
    this.reputation,
    this.userId,
    this.userType,
    this.profileImage,
    this.displayName,
    this.link,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    reputation = json['reputation'];
    userId = json['user_id'];
    userType = json['user_type'];
    profileImage = json['profile_image'];
    displayName = json['display_name'];
    link = json['link'];
  }
}
