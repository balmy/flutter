import 'dart:async';
import 'contact.dart';


class MockContactRepo implements ContactRepo {
  @override
  Future<List<Contact>> getContacts() {
    // TODO: implement getContacts
    return new Future.value(kContacts);
  }
}


const kContacts = const<Contact>[
  const Contact(name: "Li bai",email: "libai@live.com"),
  const Contact(name: "Cheng yaojin",email: "chengyaojin@live.com"),
  const Contact(name: "Mi yue",email: "miyue@live.com"),
  const Contact(name: "A ke",email: "ake@live.com"),
  const Contact(name: "Lu ban",email: "luban@live.com"),
  const Contact(name: "Da qiao",email: "daqiao@live.com"),
  const Contact(name: "Hou yi",email: "houyi@live.com"),
  const Contact(name: "Liu bei",email: "liubei@live.com"),
  const Contact(name: "Wang zhaojun",email: "wangzhaoju@live.com"),
];



