import 'package:flutter/material.dart';
import 'package:myflutter/mvp/contact.dart';
import 'package:myflutter/mvp/contact_presenter.dart';
import 'package:myflutter/mvp/contract.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Contacts mvp test"),
      ),
      body: new ContactList(),
    );
  }
}

class ContactList extends StatefulWidget {
  ContactList({Key key}) : super(key: key);

  @override
  _ContactListState createState() {
    _ContactListState view = new _ContactListState();
    ContactPresenter presenter = new ContactPresenter(view);
    presenter.init();
    return view;
  }
}

class _ContactListState extends State<ContactList> implements View {
  List<Contact> contacts = [];

  ContactPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter.loadContacts();
  }

  Widget buildListTile(BuildContext context, Contact contact) {
    return new MergeSemantics(
      child: new ListTile(
        isThreeLine: true,
        dense: false,
        leading: new ExcludeSemantics(
            child: new CircleAvatar(
                child: new Text(contact.name.substring(0, 1)))),
        title: new Text(contact.name),
        subtitle: new Text(contact.email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    widget = new ListView.builder(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (BuildContext context, int index) {
        return buildListTile(context, contacts[index]);
      },
      itemCount: contacts.length,
    );
    return widget;
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {
    setState(() {
      contacts = items;
      print("  contacts size  ${contacts.length}");
    });
  }

  @override
  void onLoadContactsError() {}

  @override
  setPresenter(Presenter presenter) {
    _presenter = presenter;
  }
}

void main() => runApp(new MaterialApp(
  title: 'Flutter教程',
  home: new ContactPage(),
),);
