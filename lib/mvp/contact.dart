import 'dart:async';

class Contact {
  final String name;
  final String email;

  const Contact({this.name, this.email});
}

abstract class ContactRepo {
  Future<List<Contact>> getContacts();
}
