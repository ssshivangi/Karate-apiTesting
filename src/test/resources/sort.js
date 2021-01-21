function fn(array) {
  var ArrayList = Java.type('java.util.ArrayList')
  var Collections = Java.type('java.util.Collections')
  var list = new ArrayList();
  console.log("Naveen");
  console.log(array);
  for (var i = 0; i < array.length; i++) {
    list.add(array[i]);
  }
  Collections.sort(list, java.lang.String.CASE_INSENSITIVE_ORDER)
  return list;
}