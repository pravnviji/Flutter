class StudentModel {
  String studentId;
  String studentName;
  int studentScores;
  StudentModel({this.studentId, this.studentName, this.studentScores});
  factory StudentModel.fromJson(Map<String, dynamic> parsedJson) {
    return StudentModel(
        studentId: parsedJson['id'],
        studentName: parsedJson['name'],
        studentScores: parsedJson['score']);
  }
}
