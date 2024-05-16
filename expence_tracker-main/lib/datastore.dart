class ReturnValues {
  final double enteredcash;
  final String cat;
  final String discription;
  final String time;
  final String type;

  ReturnValues(
      {required this.enteredcash,
      required this.cat,
      required this.discription,
      required this.time,
      required this.type});
  Map<String, dynamic> toMap() {
    return {
      'discription': discription,
      'enteredcash': enteredcash,
      'time': time,
      'cat': cat,
      'type': type,
    };
  }

  factory ReturnValues.fromMap(Map<String, dynamic> map) {
    return ReturnValues(
        cat: map['cat'],
        discription: map['discription'],
        enteredcash: map['enteredcash'],
        time: map['time'],
        type: map['type']);
  }
}
