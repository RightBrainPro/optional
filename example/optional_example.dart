import 'package:optional/optional.dart';


class Person
{
  final int id;
  final String firstName;
  final String? lastName;

  const Person({
    required this.id,
    required this.firstName,
    this.lastName,
  });

  Person copyWith({
    final int? id,
    final String? firstName,
    final Optional<String>? lastName,
  }) => Person(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName == null ? this.lastName : lastName.value,
  );

  @override
  String toString() =>
    'Person #$id "$firstName${lastName == null ? '' : ' $lastName'}"';
}


void main()
{
  final person = Person(id: 1, firstName: 'Peter', lastName: 'White');
  print(person);   // Person #1 "Peter White"
  final renamed = person.copyWith(lastName: Optional('Black'));
  print(renamed);  // Person #1 "Peter Black"
  final unnamed = person.copyWith(lastName: Optional());
  print(unnamed);  // Person #1 "Peter"
}
