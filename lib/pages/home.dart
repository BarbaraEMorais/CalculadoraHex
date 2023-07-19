import 'package:flutter/material.dart';
import 'calcula.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //ele é quem controla quem aparece no meu visor
  TextEditingController expController = TextEditingController();
  String resp = "";
  
  void _resolve(String resposta) {
    expController.text = resposta;    
  }

  void _click_btn(String valor){
    
    expController.text += valor; 

    int i=0, j=0;
    double num1=0, num2=0;
    String num1_t = "";
    String num2_t = "";

   

    if(valor == ""){
      print("o valor digitado é enter");
    }
  

    //realiza soma
    if (expController.text.contains('+') && (valor!= '=')){
      
      while(j==0 && (i < expController.text.length)){

        if(expController.text[i] != '+'){
          num1_t += expController.text[i];
        }
        if(expController.text[i] == '+'){
          j++;
        }
        num1 = double.parse(num1_t);
        i++;
      }
      num2 = double.parse(expController.text.substring(i,expController.text.length));
      //salvo valores em variaveis e operadores
      resp = (num1+num2).toString();
    }
    //faz subtração
    if (expController.text.contains('-') && (valor!= '=')){
      
      while(j==0 && (i < expController.text.length)){

        if(expController.text[i] != '-'){
          num1_t += expController.text[i];
        }
        if(expController.text[i] == '-'){
          j++;
        }
        num1 = double.parse(num1_t);
        i++;
      }
      num2 = double.parse(expController.text.substring(i,expController.text.length));
      //salvo valores em variaveis e operadores
      resp = (num1-num2).toString();
    }

    //faz multiplicacao
    if (expController.text.contains('*') && (valor!= '=')){
      
      while(j==0 && (i < expController.text.length)){

        if(expController.text[i] != '*'){
          num1_t += expController.text[i];
        }
        if(expController.text[i] == '*'){
          j++;
        }
        num1 = double.parse(num1_t);
        i++;
      }
      num2 = double.parse(expController.text.substring(i,expController.text.length));
      //salvo valores em variaveis e operadores
      resp = (num1*num2).toString();
    }

    //faz a divisão
    if (expController.text.contains('/') && (valor!= '=')){
      
      while(j==0 && (i < expController.text.length)){

        if(expController.text[i] != '/'){
          num1_t += expController.text[i];
        }
        if(expController.text[i] == '/'){
          j++;
        }
        num1 = double.parse(num1_t);
        i++;
      }
      num2 = double.parse(expController.text.substring(i,expController.text.length));
      //salvo valores em variaveis e operadores
      if(num2 != 0){
        resp = (num1/num2).toString();
      }
      else{
        resp = "Erro: Divisão por 0";
      }
    }

    if ((valor == "=" && (resp != ""))){
      _resolve(resp);
    }

  }
  //limpa tela #finalizado
  void _clear(){
    expController.text =""; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Hexadecimal"),
        backgroundColor: Color.fromARGB(255, 51, 186, 2),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: expController,
                showCursor: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black))),
                  style: TextStyle(fontSize: 30, color: Colors.black),
                  obscureText: false,
                  onChanged: (String text) { //usado quando digito algo
                    //
                  },
                  onSubmitted: (String text) {
                    _click_btn(text);
                    //_resolve();
                  },
              ),

              //botoes
              SizedBox(height: 15, width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("13")}, /*style: estilo,*/ child: Text("D", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("14")}, /*style: estilo,*/ child: Text("E", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("15")}, /*style: estilo,*/ child: Text("F", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_clear()}, /*style: estilo,*/ child: Text("CLR", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("10")}, /*style: estilo,*/ child: Text("A", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("11")}, /*style: estilo,*/ child: Text("B", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("12")}, /*style: estilo,*/ child: Text("C", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("-")}, /*style: estilo,*/ child: Text("-", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("7")}, /*style: estilo,*/ child: Text("7", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("8")}, /*style: estilo,*/ child: Text("8", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("9")}, /*style: estilo,*/ child: Text("9", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("/")}, /*style: estilo,*/ child: Text("/", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("4")}, /*style: estilo,*/ child: Text("4", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("5")}, /*style: estilo,*/ child: Text("5", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("6")}, /*style: estilo,*/ child: Text("6", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("*")}, /*style: estilo,*/ child: Text("*", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("1")}, /*style: estilo,*/ child: Text("1", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("2")}, /*style: estilo,*/ child: Text("2", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  ElevatedButton(onPressed: () => {_click_btn("3")}, /*style: estilo,*/ child: Text("3", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("+")}, /*style: estilo,*/ child: Text("+", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("0")}, /*style: estilo,*/ child: Text("0", style: TextStyle(fontSize: 20, color: Colors.amber[200]))), 
                  ElevatedButton(onPressed: () => {_click_btn(".")}, /*style: estilo,*/ child: Text(",", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("=")}, /*style: estilo,*/ child: Text("=", style: TextStyle(fontSize: 20, color: Colors.amber[200]))),
                ],
              ),

            ]),),
      ),
    );
  }
}
