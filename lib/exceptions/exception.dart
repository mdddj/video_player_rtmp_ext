

class InitException extends Error {

  final String msg;
  InitException(this.msg);

  @override
  String toString() {
    return 'error: $msg';
  }
}