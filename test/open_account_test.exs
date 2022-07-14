defmodule OpenAccountTest do
  use ExUnit.Case

  alias Bank.Commands.OpenAccount

  test "opens bank account" do
    assert :ok = Bank.BankApp.dispatch(%OpenAccount{account_number: 123, initial_balance: 500})

    IO.inspect("HERE IN TEST")
  end

end
