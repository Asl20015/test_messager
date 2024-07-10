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
          dif = '${date.day}.${date.month}.${date.year}';
        }
      } else if (difDate.inHours >= 1) {
        dif = '${difDate.inHours} час(а) назад';
      } else {
        dif = '${difDate.inMinutes} минут назад';
      }
      return 'Был в сети $dif';
    }
  }
}
