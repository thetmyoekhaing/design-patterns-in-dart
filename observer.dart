abstract class Subject {
  void follow(Observer observer);
  void unFollow(Observer observer);
  void notifySubs();
}

abstract class Observer {
  void like(Subject sub);
  void unLike(Subject sub);
  void notify();
}

class FbPage implements Subject {
  List<Observer> followers = [];

  @override
  void follow(Observer observer) {
    if (!followers.contains(observer)) {
      followers.add(observer);
    }
  }

  @override
  void unFollow(Observer observer) {
    followers.removeWhere((follower) => follower == observer);
  }

  @override
  void notifySubs() {
    for (var sub in followers) {
      sub.notify();
    }
  }

  void post() {
    notifySubs();
  }
}

class Follower implements Observer {
  Follower({required String name}) {
    _name = name;
  }
  String _name = '';

  @override
  void notify() {
    print('hey $_name, a new post uploaded from the page u liked');
  }

  @override
  void like(Subject page) {
    page.follow(this);
  }

  @override
  void unLike(Subject page) {
    page.unFollow(this);
  }
}

void main() {
  FbPage fbPage = FbPage();
  Follower tmk = Follower(name: 'tmk');
  Follower tomari = Follower(name: 'tomari');

  tmk.like(fbPage);
  tomari.like(fbPage);
  tomari.unLike(fbPage);

  fbPage.post();
}
