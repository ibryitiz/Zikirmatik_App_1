import 'package:flutter/material.dart';

import 'package:flutter_application_shop/ui/cubit/ikincisayfa_cubit.dart';
import 'package:flutter_application_shop/ui/views/ikincisayfa.dart';
import 'package:flutter_application_shop/ui/views/tumzikirler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController yapilanZikir = TextEditingController();
   int deger = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161B33),
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

 AppBar _buildAppbar(){
    return AppBar(
      backgroundColor: const Color(0xFF161B33),
      title: const Text("ZİKİRMATİK"),
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
      actions: [
        IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TumZikirler(),));
        }, icon: Icon(Icons.keyboard_double_arrow_right,color: Colors.white,size: 30,))
      ],
    );
 }

 Widget _buildBody(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildZikirContainer(),
      _buildRowButtons(context),
    ],
  );
 }

Widget _buildZikirContainer(){
  return Container(
                decoration: BoxDecoration(
                  color: Color(0xFF474973),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 210,
                        decoration: BoxDecoration(
                          color: Color(0xFFA69CAC),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            deger.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.black
                              ),
                            ),
                        )
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0D0C1D),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              deger = 0;
                            });
                          }, 
                          icon: Icon(Icons.lock_reset,color: Color(0xFF0D0C1D),)
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0D0C1D),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: IconButton(
                          onPressed: () {
                              setState(() {
                                deger = deger+1;
                              });
                          }, 
                          icon: Icon(Icons.add,size: 175,color: Color(0xFF0D0C1D),),
                        ),
                      ),
                    ],
                  ),
                ),
              );
    }

 Widget  _buildRowButtons(BuildContext context){
  return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => IkinciSayfa(),));
            }, 
            child: Text("ZİKİRLERİM",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF474973)
            ),
          ),
          ElevatedButton(
            onPressed: () {
               showDialog(
                  context: context, 
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFFFFFCF2),
                      actionsPadding: const EdgeInsets.all(5),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: yapilanZikir,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              filled: true,
                              hintText: "Yapılan zikir adını girin",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none 
                              )
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.clear,color: Colors.black,),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<IkinciSayfaCubit>().bilgileriKaydet(yapilanZikir.text, deger);
                            setState(() {
                              deger = 0;
                              yapilanZikir.text = "";
                            });
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.navigation,color: Colors.black,),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            }, 
            child: Text("KAYDET",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF474973)
            ),
          ),
        ],
      );
 }
}