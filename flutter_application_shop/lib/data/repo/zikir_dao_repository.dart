import 'package:flutter_application_shop/data/entity/zikirler.dart';
import 'package:flutter_application_shop/sqlite/veritabani_yardimcisi.dart';

class ZikirlerDaoRepository{
  

  Future<List<Zikir>> zikirleriGetir() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM zikirler");
    
    return List.generate(
      maps.length, 
      (index) {
        var satir = maps[index];
        return Zikir(id: satir["id"], zikir_ad: satir["zikir_ad"], zikir_sayisi: satir["zikir_sayisi"],);
      },
    );
  }

  Future<void> bilgileriKaydet(String yapilanZikir , int zikirSayisi) async {
      var db = await VeritabaniYardimcisi.veritabaniErisim();
      var yeniZikir = Map<String, dynamic>();
      yeniZikir["zikir_ad"] = yapilanZikir;
      yeniZikir["zikir_sayisi"] = zikirSayisi;
      await db.insert("zikirler", yeniZikir);
  }

  Future<void> sil(int id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("zikirler",where: "id = ?" ,whereArgs: [id]);
  }


}