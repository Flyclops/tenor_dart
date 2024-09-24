// coverage:ignore-file

// Not sure why codecov doesn't accurately record this as it's tested
extension StringX on String {
  String withQueryParams(
    Map<String, dynamic> queryParams, {
    bool extend = false,
  }) {
    var res = this;

    if (queryParams.isNotEmpty) {
      res += extend ? '&' : '?';

      queryParams.forEach((key, dynamic value) {
        if (value == null) return;

        if (value is String && value.isEmpty) return;

        res += '$key=$value&';
      });
      res = res.substring(0, res.length - 1);
    }

    return res;
  }
}
