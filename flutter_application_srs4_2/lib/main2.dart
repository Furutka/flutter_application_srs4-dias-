import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Container(
        color: Colors.lightBlueAccent, // Голубой фон
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              ).then((value) {
                // Вызывается при возврате с второго экрана
                if (value != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Возврат с данных: $value'),
                    ),
                  );
                }
              });
            },
            child: Text('Перейти к следующему экрану'),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        color: Colors.lightGreenAccent, // Светло-зеленый фон
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Возврат данных на предыдущий экран
              Navigator.pop(context, 'Данные с второго экрана');
            },
            child: Text('Вернуться'),
          ),
        ),
      ),
    );
  }
}
