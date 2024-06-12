A wrapper for optional values forwarding to functions. It can be useful when you need to define whether an optional named argument is explicitly provided with `null` value or is omited.

## Usage

Define a function with named arguments, use [Optional] for nullable arguments.
```dart
  final String firstName;
  final String? lastName;

  Person copyWith({
    final String? firstName,
    final Optional<String>? lastName,
  }) => Person(
    firstName: firstName ?? this.firstName,
    lastName: lastName == null ? this.lastName : lastName.value,
  );
```

Use [Optional] to provide the function with nullable value:

```dart
  final person = Person(firstName: 'Peter', lastName: 'Jenkins');
  final renamedPerson = person.copyWith(
    firstName: 'Frank',
  );
  print(changedPerson.lastName == 'Jenkins');
  final privatePerson = changedPerson.copyWith(
    lastName: Optional(),
  );
  print(privatePerson.lastName == null);
```
