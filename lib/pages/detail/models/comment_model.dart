import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class YJCommentItem {
  String? avatar;
  String? content;
  int? id;
  String? name;

  @JsonKey(name: "receiver_name")
  String? receiverName;

  String? time;

  @JsonKey(name: "time_hour")
  String? timeHour;

  int? type;

  List<YJCommentItem>? items;

  YJCommentItem(
    this.avatar,
    this.content,
    this.id,
    this.name,
    this.receiverName,
    this.time,
    this.timeHour,
    this.type,
    this.items,
  );

  factory YJCommentItem.fromJson(Map<String, dynamic> json) =>
      _$YJCommentItemFromJson(json);
  Map<String, dynamic> toJson() => _$YJCommentItemToJson(this);
}

@JsonSerializable()
class YJCommentModel {
  List<YJCommentItem>? list;
  int? total;
  YJCommentModel(this.list, this.total);

  factory YJCommentModel.fromJson(Map<String, dynamic> json) =>
      _$YJCommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$YJCommentModelToJson(this);
}

/*
{
    "avatar": "http://thirdqq.qlogo.cn/g?b=oidb&k=F3owf11Cib7DuAQU7t1w7BQ&s=640&t=1637413629",
    "content": "《山海经》里不是说说九尾狐泣婴儿声，吃人....吗？",
    "id": 2898,
    "items":
    [
        {
            "avatar": "https://thirdwx.qlogo.cn/mmopen/vi_32/AXnL4Q3Zer3cdMCpZ9V6aYBcyvEicfHOGUBdmZQJNia6n5ZMhcnsFWgWqwhSt8sSvfKKo1F9gQHxic8HJoqk4mS3Q/132",
            "content": "是吗",
            "id": 10061,
            "name": "执手星辰",
            "receiver_name": "额",
            "time": "2022-09-19 00:50:21",
            "time_hour": "09-19 00:50",
            "type": 2
        },
        {
            "avatar": "https://thirdwx.qlogo.cn/mmopen/vi_32/SIMI9dKI6PYK02Glc8kMibFgff6I5d9B1JPhCziaJHAqLYf59RYzKdPylkeOLicBf7ORVL3afjaic1P0Yic8pGFt4eQ/132",
            "content": "对啊，我看过，里面还说九尾又称婴宁，是凶兽，我怀疑这里的瑞狐里面不是山海经收录的那种狐狸。根据文章来看，这里的瑞狐更侧重指白狐或者玄狐，婴宁好像是赤狐…",
            "id": 12531,
            "name": "傲骨™",
            "receiver_name": "额",
            "time": "2023-05-23 19:44:38",
            "time_hour": "05-23 19:44",
            "type": 2
        },
        {
            "avatar": "https://thirdwx.qlogo.cn/mmopen/vi_32/TG0llFIicHDnB4PsD8bUx2rI9Du5DmVQ8ETJLfS5DKOwJAe2iaX2KlVHdRCcSDQEyCt0zA5LLPFqvXeKNk1Rc5Ow/132",
            "content": "“能食人”是倒装句，意思是人能吃。😂",
            "id": 13703,
            "name": "美好午后",
            "receiver_name": "傲骨™",
            "time": "2023-10-19 12:45:14",
            "time_hour": "10-19 12:45",
            "type": 2
        }
    ],
    "name": "额",
    "receiver_name": "",
    "time": "2022-01-25 18:59:08",
    "time_hour": "01-25 18:59",
    "type": 1
}
*/
