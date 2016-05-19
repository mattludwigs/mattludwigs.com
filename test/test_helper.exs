ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Wigs.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Wigs.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Wigs.Repo)

