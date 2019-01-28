defmodule BinaryMatchingTest.Application do
  use Application

  def start(_, _) do
    Supervisor.start_link([
      BinaryMatchingTest
    ], strategy: :one_for_one)
  end
end
