defmodule Bank.BankApp do
  use Commanded.Application,
    otp_app: :bank,
    event_store: [adapter: Commanded.EventStore.Adapters.InMemory]

  router Bank.Router

end
