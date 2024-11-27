class Query {
  Query({required this.table, this.where = "", this.customfields = "*"});

  String customfields;
  String table;
  String where;

  String select() {
    return "SELECT $customfields FROM `$table` $where";
  }

  String delete() {
    return "DELETE FROM `$table` $where;";
  }

  String call({required List data}) {
    String val = "";
    String set = '';
    for (var i = 0; i < data.length; i++) {
      set = "${set}SET @p$i='${data[i]}'; ";
      if (data.length == 1) {
        val = "(${data[i]})";
        continue;
      } else if (data[i].hashCode == data.first.hashCode) {
        val = "(@p$i, ";
        continue;
      } else if (data[i].hashCode == data.last.hashCode) {
        val = "$val@p$i)";
        continue;
      }
      val = "$val@p$i, ";
    }
    return "$set CALL `$table`$val";
  }

  String update({required Map<String, dynamic> data}) {
    String set = "";
    for (var key in data.keys) {
      if (key == data.keys.first) {
        set = "`$key` = ${data[key]}";
        continue;
      }
      if (key == data.keys.last) {
        set = "$set, `$key` = ${data[key]}";
        continue;
      }
      set = "$set, `$key` = ${data[key]}";
    }

    return 'UPDATE  `$table` SET $set $where;';
  }

  String insert({required List<Map<String, dynamic>> values}) {
    String fields = _keys(map: values.first);
    String val = "";
    if (values.length > 1) {
      for (var i in values) {
        if (i == values.first) {
          val = "${_values(i)},";
          continue;
        }
        if (i == values.last) {
          val = "$val${_values(i)}";
          continue;
        }
        val = "$val${_values(i)}, ";
      }
    } else {
      val = _values(values[0]);
    }
    return "INSERT INTO `$table` ($fields) VALUES $val";
  }

  String _values(Map values) {
    String val = "";
    for (var value in values.keys) {
      if (value == values.keys.first) {
        val = "(${values[value]}, ";
        continue;
      }
      if (value == values.keys.last) {
        val = "$val${values[value]})";
        continue;
      }
      val = "$val${values[value]}, ";
    }
    return val;
  }

  String _keys({required Map map}) {
    String fields = "";
    for (var key in map.keys) {
      if (key == map.keys.first) {
        fields = "`$key`";
        continue;
      }
      if (key == map.keys.last) {
        fields = "$fields, `$key`";
        continue;
      }
      fields = "$fields, `$key`";
    }
    return fields;
  }
}
