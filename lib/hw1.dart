void main() {

  // TASK 1
  for (int i = 1; i <= 10; i++) {
    print("multiplication table for $i");

    for (int j = 1; j <= 10; j++) {
      print("$i * $j = ${i * j}");
    }
  }

  // TASK 2
  int day = 28;
  int month = 2;
  int year = 2026;

  int daysInMonth = 31;

  if (month == 2) {
    if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
      daysInMonth = 29;
    } else {
      daysInMonth = 28;
    }
  } else if (month == 4 || month == 6 || month == 9 || month == 11) {
    daysInMonth = 30;
  }

  if (day < daysInMonth) {
    day++;
  } else {
    day = 1;

    if (month < 12) {
      month++;
    } else {
      month = 1;
      year++;
    }
  }

  print("$day.$month.$year");

  //TASK 3
  String text = "flutter mobile development";
  int count = 0;

  for (int i=0; i<text.length; i++) {
    String letter = text[i];

    if ("aeiou".contains(letter)) {
      count++;
    }
  }
  print("number of vowels: $count");

  //TASK 4
  List<int> numbers = [14, 88, 3, 42, 99, 12, 67];

  int min = numbers[0];
  int max = numbers[0];

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] < min) {
    min = numbers[i];
  }

  if (numbers[i] > max) {
    max = numbers[i];
  }
}
print("min: $min");
print("max: $max");

//TASK 5
int number = 3;
bool isPrime = true;

if (number < 2) {
    isPrime = false;
}

for (int i = 2; i < number; i++) {
  if (number % i == 0) {
    isPrime = false;
  }
}  
 if (isPrime) {
  print("prime number");
 } else {
  print("not prime number");
} 

}