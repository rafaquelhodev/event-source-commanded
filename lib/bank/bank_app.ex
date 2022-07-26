defmodule Bank.BankApp do
  use Commanded.Application, otp_app: :bank

  router(Bank.Router)
end
