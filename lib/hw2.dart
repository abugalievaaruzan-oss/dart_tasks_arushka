void main() {
  double balance = 60000;

  checkBalance(
    name: "Aruzhan",
    balance: balance,
  );

  balance = deposit(
    currentBalance: balance,
    amount: 10000,
  );

  balance = withdraw(
    name: "Aruzhan",
    currentBalance: balance,
    amount: 15000,
    pinCode: 1234,
  );

  checkBalance(
    name: "Aruzhan",
    balance: balance,
  );
}


// TASK 1

void checkBalance({
  required String name,
  required double balance,
}) =>
    print("$name balance: $balance");


// TASK 2

double deposit({
  required double currentBalance,
  double? amount,
}) {
  amount = amount ?? 0.0;

  currentBalance = currentBalance + amount;

  print("Deposit: $amount");
  print("Balance: $currentBalance");

  return currentBalance;
}


// TASK 3

double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  pinCode = pinCode ?? 0000;
  amount = amount ?? 0.0;

  if (pinCode != 1234) {
    print("Wrong PIN. Transaction declined.");
    return currentBalance;
  }

  if (amount > currentBalance) {
    print("Not enough money. Transaction declined.");
    return currentBalance;
  }

  currentBalance = currentBalance - amount;

  print("$name, withdrawal successful.");
  print("Balance: $currentBalance");

  return currentBalance;
}