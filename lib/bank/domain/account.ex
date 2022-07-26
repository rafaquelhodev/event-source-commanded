defmodule Bank.Domain.Account do
  alias Bank.Commands.OpenAccount
  alias Bank.Commands.WithdrawMoney

  alias Bank.Events.AccountOpened
  alias Bank.Events.MoneyWithdrew

  defstruct [:account_number, :balance]

  # Public command API

  def execute(%__MODULE__{account_number: nil}, %OpenAccount{
        account_number: account_number,
        initial_balance: initial_balance
      })
      when initial_balance > 0 do
    %AccountOpened{account_number: account_number, initial_balance: initial_balance}
  end

  # Ensure initial balance is never zero or negative
  def execute(%__MODULE__{}, %OpenAccount{initial_balance: initial_balance})
      when initial_balance <= 0 do
    {:error, :initial_balance_must_be_above_zero}
  end

  # Ensure account has not already been opened
  def execute(%__MODULE__{}, %OpenAccount{}) do
    {:error, :account_already_opened}
  end

  def execute(%__MODULE__{account_number: nil}, %WithdrawMoney{}) do
    {:error, :account_not_found}
  end

  def execute(%__MODULE__{balance: balance}, %WithdrawMoney{
        account_number: account_number,
        amount: amount
      }) do
    case balance >= amount do
      true -> %MoneyWithdrew{account_number: account_number, amount: amount}
      false -> {:error, :invalid_operation}
    end
  end

  # State mutators

  def apply(%__MODULE__{} = account, %AccountOpened{} = event) do
    IO.inspect("REPLAYING CREATING ACCOUNT")
    %AccountOpened{account_number: account_number, initial_balance: initial_balance} = event

    %__MODULE__{account | account_number: account_number, balance: initial_balance}
  end

  def apply(%__MODULE__{} = account, %MoneyWithdrew{} = event) do
    IO.inspect("REPLAYING WITHDRAW MONEY ACCOUNT")

    %MoneyWithdrew{account_number: account_number, amount: amount} = event

    %__MODULE__{account | account_number: account_number, balance: account.balance - amount}
  end
end
