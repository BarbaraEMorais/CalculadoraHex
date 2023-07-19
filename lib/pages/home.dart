import 'package:flutter/material.dart';
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
  //realiza operações com dígitos
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
    expController.text = "0";
  }
  //realiza operações com digitação do usuário
  void _click_enter(String texto){
    int i=0, j=0;
    double num1=0, num2=0;
    String num1_t = "";
    String num2_t = "";
    print("GALINHAAZUL " + texto);

    if (texto.contains('+')){
      
      while(j==0 && (i < texto.length)){

        if(texto[i] != '+'){
          num1_t += texto[i];
        }
        if(texto[i] == '+'){
          j++;
        }
        num1 = double.parse(num1_t);
        i++;
      }
      num2 = double.parse(texto.substring(i,texto.length));
      //salvo valores em variaveis e operadores
      resp = (num1+num2).toString();
    }
    //faz subtração
    if (texto.contains('-')){
      
      while(j==0 && (i < texto.length)){

        if(texto[i] != '-'){
          num1_t += texto[i];
        }
        if(texto[i] == '-'){
          j++;
        }
        num1 = double.parse(num1_t);
        i++;
      }
      num2 = double.parse(texto.substring(i,texto.length));
      //salvo valores em variaveis e operadores
      resp = (num1-num2).toString();
    }

    //faz multiplicacao
    if (texto.contains('*')){
      
      while(j==0 && (i < texto.length)){

        if(texto[i] != '*'){
          num1_t += texto[i];
        }
        if(texto[i] == '*'){
          j++;
        }
        num1 = double.parse(num1_t);
        i++;
      }
      num2 = double.parse(texto.substring(i,texto.length));
      //salvo valores em variaveis e operadores
      resp = (num1*num2).toString();
    }

    //faz a divisão
    if (texto.contains('/')){
      
      while(j==0 && (i < texto.length)){

        if(texto[i] != '/'){
          num1_t += texto[i];
        }
        if(texto[i] == '/'){
          j++;
        }
        num1 = double.parse(num1_t);
        i++;
      }
      num2 = double.parse(texto.substring(i,texto.length));
      //salvo valores em variaveis e operadores
      if(num2 != 0){
        resp = (num1/num2).toString();
      }
      else{
        resp = "Erro: Divisão por 0";
      }
    }

    if ((resp != "")){
      _resolve(resp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Calculadora Hexadecimal"),
        backgroundColor: Color.fromARGB(255, 2, 137, 161),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 50, 10, 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: expController,
                showCursor: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.black)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black))),
                  style: TextStyle(fontSize: 30, color: Colors.black),
                  obscureText: false,
                  onSubmitted: (String text) {
                    _click_enter(text);
                    //_resolve();
                  },
                  textAlign:TextAlign.end,
              ),

              //botoes
              SizedBox(height: 20, width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("13")},child: Text("D", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("14")}, child: Text("E", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("15")}, child: Text("F", style: TextStyle(fontSize: 20, color: Colors.black))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_clear()}, child: Text("CLR", style: TextStyle(fontSize: 20, color: Colors.black))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("10")}, child: Text("A", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("11")}, child: Text("B", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("12")}, child: Text("C", style: TextStyle(fontSize: 20, color: Colors.black))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("-")}, child: Text("-", style: TextStyle(fontSize: 20, color: Colors.black))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("7")}, child: Text("7", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("8")}, child: Text("8", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("9")}, child: Text("9", style: TextStyle(fontSize: 20, color: Colors.black))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("/")}, child: Text("/", style: TextStyle(fontSize: 20, color: Colors.black))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("4")}, child: Text("4", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("5")}, child: Text("5", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("6")}, child: Text("6", style: TextStyle(fontSize: 20, color: Colors.black))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("*")}, child: Text("*", style: TextStyle(fontSize: 20, color: Colors.black))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("1")}, child: Text("1", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("2")}, child: Text("2", style: TextStyle(fontSize: 20, color: Colors.black))),
                  ElevatedButton(onPressed: () => {_click_btn("3")}, child: Text("3", style: TextStyle(fontSize: 20, color: Colors.black))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("+")}, child: Text("+", style: TextStyle(fontSize: 20, color: Colors.black))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                  ElevatedButton(onPressed: () => {_click_btn("0")}, child: Text("0", style: TextStyle(fontSize: 20, color: Colors.black))), 
                  ElevatedButton(onPressed: () => {_click_btn(".")}, child: Text(",", style: TextStyle(fontSize: 20, color: Colors.black))),
                  SizedBox(height: 20, width: 15),
                  ElevatedButton(onPressed: () => {_click_btn("=")}, child: Text("=", style: TextStyle(fontSize: 20, color: Colors.black))),
                ],
              ),

            ]),),
      ),
    );
  }
}
