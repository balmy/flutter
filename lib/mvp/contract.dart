import 'mvp.dart';
import 'contact.dart';

abstract class Presenter implements IPresenter {
  loadContacts();
}

abstract class View implements IView<Presenter>{
  void onLoadContactsComplete(List<Contact> items);
  void onLoadContactsError();
}