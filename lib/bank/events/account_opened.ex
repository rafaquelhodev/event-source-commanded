defmodule Bank.Events.AccountOpened do
  @derive Jason.Encoder
  defstruct [:account_number, :initial_balance]
end
