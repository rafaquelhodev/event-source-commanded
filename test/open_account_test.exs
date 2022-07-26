defmodule OpenAccountTest do
  use ExUnit.Case

  alias Bank.Commands.OpenAccount
  alias Bank.Commands.WithdrawMoney

  test "opens bank account" do
    assert :ok = Bank.BankApp.dispatch(%OpenAccount{account_number: 123, initial_balance: 500})
    assert :ok = Bank.BankApp.dispatch(%WithdrawMoney{account_number: 123, amount: 600})

    IO.inspect("HERE IN TEST")
  end
end
