// To parse this JSON data, do
//
//     final callDetails = callDetailsFromJson(jsonString);

import 'dart:convert';

CallDetails callDetailsFromJson(String str) => CallDetails.fromJson(json.decode(str));

String callDetailsToJson(CallDetails data) => json.encode(data.toJson());

class CallDetails {
    CallDetails({
        this.image,
        this.name,
        this.isIncoming,
        this.updateAt,
        this.isVoice,
        this.isGroup,
    });

    String? image;
    String? name;
    bool? isIncoming;
    String? updateAt;
    bool? isVoice;
    bool? isGroup;

    factory CallDetails.fromJson(Map<String, dynamic> json) => CallDetails(
        image: json["image"],
        name: json["name"],
        isIncoming: json["isIncoming"],
        updateAt: json["updateAt"],
        isVoice: json["isVoice"],
        isGroup: json["isGroup"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "isIncoming": isIncoming,
        "updateAt": updateAt,
        "isVoice": isVoice,
        "isGroup": isGroup,
    };
}
