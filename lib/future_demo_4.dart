void main() {
  final names = ['ali', 'ahmed', 'mohammed'];

  Future<int> getUserId() {
    return Future.delayed(const Duration(seconds: 2),
        // () => 1,
        () {
      throw 'error1';
    } //what if this future not complete with a value?!!! throw('err')
        );
  }

  Future<String> getUserInfo(int index) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => names[index],
    );
  }

  //i can chain many of future together

  // final myFuture = getUserId()
  //     .then((index) => getUserInfo(index))
  //     .then((name) => print(name));

  //if we dealing with errors
  final myFuture2 = getUserId().then((index) => print(index)).catchError(
    (err) {
      print('catch $err');
    },
    // test: (err) => err.runtimeType == String,
    // test: (err) => err == 'error1',
  ).whenComplete(() => print('all finish'));
}
