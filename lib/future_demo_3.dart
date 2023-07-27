void main() {
  final myFuture1 = Future.value(12);
  //
  // final myFuture2 = Future.error(Exception());
  //

  // final myFuture3 = Future.delayed(
  //   const Duration(seconds: 2),
  //   () => 12,
  // );

  final myFuture4 = Future.delayed(
    const Duration(seconds: 2),
    () => throw 'error!',
  );

  //if i want to get data i should use then

  // myFuture1.then((value) {
  //   print(value);
  // });
  //
  // myFuture2.catchError((err) {
  //   print(err.toString());
  // });
  //
  // myFuture3.then((value) {
  //   print(value);
  // });
  //
  myFuture4.then((value) {
    print(value);
  }).catchError((err) {
    print(err.toString());
  }, test: (err) => err == 'error1!');

  print('waiting ...');
}
