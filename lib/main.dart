import 'package:bloc_kullanimi/IkinciSayfa.dart';
import 'package:bloc_kullanimi/SayacCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> SayacCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Anasayfa(),
      ),
    );
  }
}



class Anasayfa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<SayacCubit,int>(
              builder: (context,sayacDegeri){
                return Text("$sayacDegeri",style: TextStyle(fontSize: 30),);
              },
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> IkinciSayfa()));
                },
                child: Text("Geçiş Yap"),
            ),

          ],
        ),
      ),

    );
  }
}
