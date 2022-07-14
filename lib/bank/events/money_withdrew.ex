defmodule Bank.Events.MoneyWithdrew do
  @derive Jason.Encoder
  defstruct [:account_number, :amount]
end
