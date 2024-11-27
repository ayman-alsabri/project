class Tasks{
  int id;
  String name;
  String decription;
  String taskDate;
  int categoryID;
  String priority;
  String status;
  int isActive;
  String impDate;

  Tasks(
      {required this.id,
      required this.name,
      required this.decription,
      required this.taskDate,
      required this.categoryID,
      required this.priority,
      required this.status,
      required this.isActive,
      required this.impDate});

  factory Tasks.fromJson(Map<dynamic, dynamic> json) {
    return Tasks(
        id: json["ID"],
        name: json["Name"],
        decription: json["Decription"],
        taskDate: json["TaskDate"],
        categoryID: json["CategoryID"],
        priority: json["Priority"],
        status: json["Status"],
        isActive: json["IsActive"],
        impDate: json["ImpDate"]);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["ID"] = id;
    json["Name"] = name;
    json["Decription"] = decription;
    json["TaskDate"] = taskDate;
    json["CategoryID"] = categoryID;
    json["Priority"] = priority;
    json["Status"] = status;
    json["IsActive"] = isActive;
    json["ImpDate"] = impDate;
    return json;
  }
}
