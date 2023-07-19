import 'dart:io';

class Calculadora{

  double n1 = 0;
  double n2 = 0;

  Calculadora (double n1, double n2){
    this.n1 = n1;
    this.n2 = n2;
  }

  double _soma(){
    return n1+n2;
  }

  double _subtrai(){
    return n1-n2;
  }

  double _multiplica(){
    return n1*n2;
  }

  double _divide(){
    if (n2 == 0) {
      print("Erro: divisão por zero!");
      return double.nan;
    }
    return n1 / n2;
  }
}