
import 'package:get/get.dart';
import 'package:metro/services/storage/storage.dart';

class StorageController {


  static bool isFirst() {
    bool? isFirst = StorageService.get('isFirst', StorageType.boolType);
    return isFirst ?? true;
  }


  static void setFirst() {
    StorageService.set('isFirst', false, StorageType.boolType);
  }


  static void removeFirst() {
    StorageService.delete('isFirst');
  }

}
