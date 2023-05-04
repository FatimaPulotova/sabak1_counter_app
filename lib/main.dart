import 'package:flutter/material.dart';
import 'package:sabak1/ekinchibet.dart';

//import-флаттерге тиешлуу бардык нерселерди камтыйт
//импортсуз биздин проектини тааныбайт
void main() {
  //runApp-тиркемени баштоо функциясы ал ичине виджет алат
  //MyApp-класс же виджеттин аталышы.ар кандай кылып озгортсо болот
  runApp(const MyApp());
}

//void-пустота деген соз.эч нерсе кайтарбайт
//main-негизги функция дартка тиешелуу
//()-каша.функциянын функция экенин билдирет
//{}-фигурная скобка.функциянын денеси
class MyApp extends StatelessWidget {
  //класстын конструктору.ичине супер кейди алып жатат
  //Супер-стейдлест виджетке караштуу
  //кей-ключ алып жатат
  const MyApp({super.key});
  //class MyApp-StatelessWidget тен мурас алат
  //StatelessWidget-виджеттен мурас алат
  //extends-мурас алуу дегенди тушундурот
// @override-коюуу менен билд методтун ичине каалаган нерселерди койюп иштей алабыз
  @override
  //билд-куруу.ал озуно виджет алат(сурот.текст.ж.б)
  Widget build(BuildContext context) {
    //BuildContext-адрес.виджеттерди козомолдоочу вектор
    return MaterialApp(
      //return-кайтарат.материал апты
      // MaterialApp-материалдык дизайны бар жаны флаттер колдонмосун тузот
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme-MaterialAppка тиешелуу свойства.ал да озуно ThemeData алат
      //primarySwatch-негизги онду берет
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      // MyHomePage-бул бир виджет же класс
      //home-MyHomePagе ти окугандыгы учун астындагы жаны класс иштеп жатат
    );
  }
}

//StatefulWidget-эки кластан турат.биросу озу.биросу State
//State-абал дегенди тушундурот.
//State-бар учун кнопкабыз иштейт.бул кластын ичине билдти куруп иштетебиз
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  //index-сан алат
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //AppBar-устунку каробкасы
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        title: Center(
            // ignore: prefer_const_constructors
            child: Text(
          "Тыпшырма 1",
          style: const TextStyle(color: Colors.black),
        )),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 30,
                // ignore: sort_child_properties_last
                child: Center(
                    child: Text(
                  "Сан $index",
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                )),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index--;
                        });
                      },
                      child: const Icon(Icons.remove)),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index++;
                        });
                      },
                      child: const Icon(Icons.add)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EkinchiBet(
                                  count: index,
                                )));
                  },
                  icon: const Icon(
                    Icons.next_plan,
                    size: 50,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
