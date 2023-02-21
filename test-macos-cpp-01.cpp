#include <iostream>
#include <map>

using namespace std;

int main (){
  
  // Map
  map<char,int> first;
  
  first['a']=100;
  first['b']=200;
  
   map<char, int>::iterator it;
   for(it=first.begin(); it!=first.end(); ++it){
      cout << it->first << " => " << it->second << '\n';
   }
   

   // Time
   time_t now = time(0);
   char* dt = ctime(&now);
   cout << "The local date and time is: " << dt << endl;
   

  return 0;
}

