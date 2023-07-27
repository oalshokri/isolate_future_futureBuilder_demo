void main() {
  final myFuture = Future(() {
    print('creating the future');
    return 12;
  });

  print('Done with main()');
  print('Done with main()1111');
}
