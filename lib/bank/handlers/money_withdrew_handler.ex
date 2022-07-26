defmodule Bank.Handlers.MoneyWithdrewHandler do
  use Commanded.Event.Handler,
    application: Bank.BankApp,
    name: __MODULE__

  alias Bank.Events.MoneyWithdrew

  require Logger

  def handle(%MoneyWithdrew{amount: amount}, _metadata) do
    Logger.info("Amount withdrew #{amount}")
  end
end
