class User {

  User(this.name,this.age);

  String name;
  int age;


  int add(int age){
    return age;
  }

}


void main(){
var hazem =  User('hazem', 31);
int newAge = hazem.add(10);

}


