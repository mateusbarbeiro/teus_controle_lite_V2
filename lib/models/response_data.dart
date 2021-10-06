class ResponseData<T>  {
  bool? status;
  String? timeStamp;
  List<Messages>? messages;
  T? data;

  ResponseData({
    this.status,
    this.timeStamp,
    this.messages,
    this.data,
  });

  ResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    timeStamp = json['timeStamp'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> convertedJson = <String, dynamic>{};
    convertedJson['status'] = status;
    convertedJson['timeStamp'] = timeStamp;
    if (messages != null) {
      convertedJson['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    if (data != null) {
      convertedJson['data'] = data;
    }
    return convertedJson;
  }
}

class Messages {
  String? message;

  Messages({this.message});

  Messages.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
