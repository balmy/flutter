import 'package:myflutter/mvp/contact.dart';
import 'package:myflutter/mvp/contact_impl.dart';

import 'contract.dart';

class ContactPresenter implements Presenter {
  View _view;

  ContactRepo _repo;

  ContactPresenter(this._view) {
    _view.setPresenter(this);
  }

  @override
  init() {
    _repo = new MockContactRepo();
  }

  @override
  loadContacts() {
    assert(_view != null);

    _repo.getContacts().then((contacts) {
      _view.onLoadContactsComplete(contacts);
    }).catchError((error) {
      print(error);
      _view.onLoadContactsError();
    });
  }
}
