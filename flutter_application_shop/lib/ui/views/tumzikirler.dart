
import 'package:flutter/material.dart';
import 'package:flutter_application_shop/data/entity/zikirler.dart';
import 'package:flutter_application_shop/ui/cubit/ikincisayfa_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TumZikirler extends StatelessWidget {
  const TumZikirler({super.key});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161B33),
      appBar: _buildAppbar(),
      body: Center(
        child: _buildToplamSayi(),
      ),
    );
  }

 AppBar _buildAppbar() {
  return AppBar(
    backgroundColor: Color(0xFF161B33),
    title: Text("Toplam Zikir Sayısı",style: TextStyle(color: Colors.white),),
    iconTheme: IconThemeData(color: Colors.white),
  );
 }

 Widget _buildToplamSayi() {
    return BlocBuilder<IkinciSayfaCubit , List<Zikir>>(
      builder: (context, zikirler) {
        int toplamZikir = 0;
        for (var zikir in zikirler) {
          toplamZikir = toplamZikir + zikir.zikir_sayisi;
        }
        return Text(
          toplamZikir.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 60,
          ),
        );
      },
    );
  } 
}