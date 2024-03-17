import 'package:flutter_application_shop/data/entity/zikirler.dart';
import 'package:flutter_application_shop/data/repo/zikir_dao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IkinciSayfaCubit extends Cubit<List<Zikir>>{
  IkinciSayfaCubit():super(<Zikir>[]);

  var zRepo = ZikirlerDaoRepository();

  Future<void> zikirleriGetir() async {
    var liste = await zRepo.zikirleriGetir();
    emit(liste);
  }
  
 Future<void> bilgileriKaydet(String yapilanZikir , int zikirSayisi) async {
      await zRepo.bilgileriKaydet(yapilanZikir, zikirSayisi);
  }

 Future<void> sil(int id) async{
   await zRepo.sil(id);
  }
}