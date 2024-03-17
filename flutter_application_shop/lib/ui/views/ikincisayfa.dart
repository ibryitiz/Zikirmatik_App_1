import 'package:flutter/material.dart';
import 'package:flutter_application_shop/data/entity/zikirler.dart';
import 'package:flutter_application_shop/ui/cubit/ikincisayfa_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IkinciSayfa extends StatefulWidget {
  const IkinciSayfa({super.key});

  @override
  State<IkinciSayfa> createState() => _IkinciSayfaState();
}

class _IkinciSayfaState extends State<IkinciSayfa> {

  @override
  void initState() {
    super.initState();
    context.read<IkinciSayfaCubit>().zikirleriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161B33),
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

 AppBar _buildAppbar() {
  return AppBar(
    backgroundColor: Color(0xFF161B33),
    title: Text("Zikirlerim",style: TextStyle(color: Colors.white),),
    iconTheme: IconThemeData(color: Colors.white),
  );
 }

  Widget _buildBody() {
    return BlocBuilder<IkinciSayfaCubit , List<Zikir>>(
    builder:(context, zikirListesi) {
      return ListView.builder(
        itemCount: zikirListesi.length,
        itemBuilder: (context, index) {
          var zikir = zikirListesi[index];
          return Card(
            color: Color(0xFF474973),
            child: ListTile(
              title: Text(zikir.zikir_ad,style: TextStyle(color: Colors.white,fontSize: 24),),
              trailing: Text(zikir.zikir_sayisi.toString(),style: TextStyle(color: Colors.white,fontSize: 36)),
              leading: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Yapılan Zikir Silinsin mi?"),
                      action: SnackBarAction(
                        label: "Evet",
                        onPressed: () {
                          context.read<IkinciSayfaCubit>().sil(zikir.id);
                          context.read<IkinciSayfaCubit>().zikirleriGetir();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Silindi"))
                          );
                        },
                      ),
                    ),
                  );
                  },
                  icon: Icon(Icons.clear,color: Color(0xFFDB5461),),
                ),
              ),
            );
          },
        );
      },
    );
  }
}