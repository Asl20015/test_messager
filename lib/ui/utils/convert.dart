class Convert {
  static String onlineConvert(DateTime date) {
    final now = DateTime.now();
    if (now.difference(date).inMinutes < 5) {
      return 'В сети';
    } else {
      String dif = '';
      final difDate = now.difference(date);
      if (difDate.inDays >= 1) {
        if (difDate.inDays == 1) {
          dif = 'вчера';
        } else if (difDate.inDays < 7) {
          dif = '${difDate.inDays} дней назад';
        } else if (difDate.inDays == 7) {
          dif = 'неделю назад';
        } else {
          dif = dateToString(date);
        }
      } else if (difDate.inHours >= 1) {
        dif = '${difDate.inHours} час(а) назад';
      } else {
        dif = '${difDate.inMinutes} минут назад';
      }
      return 'Был в сети $dif';
    }
  }

  static String dateConvert(DateTime date) {
    final now = DateTime.now();
    final days = now.difference(date).inDays;
    if (days == 0) return 'Сегодня';
    if (days == 1) return 'Вчера';
    if (days == 2) return 'Позавчера';
    return dateToString(date);
  }

  static String dateToString(DateTime date) {
    return '${_checkZero(date.day)}.${_checkZero(date.month)}.${date.year.toString().substring(2, 4)}';
  }

  static String timeConvert(DateTime date) => '${_checkZero(date.hour)}:${_checkZero(date.minute)}';

  static String _checkZero(int number) => '${number.toString().length == 2 ? number : '0$number'}';
}
