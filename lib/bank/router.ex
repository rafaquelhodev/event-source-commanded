defmodule Bank.Router do
  use Commanded.Commands.Router

  alias Bank.Domain.Account

  alias Bank.Commands.OpenAccount
  alias Bank.Commands.WithdrawMoney

  dispatch(OpenAccount, to: Account, identity: :account_number)
  dispatch(WithdrawMoney, to: Account, identity: :account_number)
end
