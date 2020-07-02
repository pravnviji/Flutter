class EmployeeModel {
  String id, name, salary, age, profileimage;
  EmployeeModel({
    this.id,
    this.name,
    this.age,
    this.salary,
    this.profileimage,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> parsedJson) {
    return EmployeeModel(
        id: parsedJson['id'],
        name: parsedJson['employee_name'],
        age: parsedJson['employee_age'],
        salary: parsedJson['employee_salary'],
        profileimage: parsedJson['profile_image']
        );
  }
}
