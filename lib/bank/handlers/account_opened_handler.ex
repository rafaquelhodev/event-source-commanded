defmodule Bank.Handlers.AccountOpenedHandler do
  use Commanded.Event.Handler,
    application: Bank.BankApp,
    name: __MODULE__

  alias Bank.Events.AccountOpened

  require Logger

  def handle(%AccountOpened{initial_balance: initial_balance}, _metadata) do
    # Process.sleep(10000)
    IO.inspect("HERE HANDLING EVENT")
    Logger.info("Account created with balance #{initial_balance}")
  end
end
