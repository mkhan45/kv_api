defmodule KVApiWeb.KVController do
  use KVApiWeb, :controller

  def get(conn, %{"key" => key}) do
    case KVApi.get(key) do
      nil -> json(conn, %{error: "not found"})
      value -> json(conn, %{success: value})
    end
  end

  def put(conn, %{"key" => key, "value" => value}) do
    KVApi.put(key, value)
    json(conn, true)
  end
end
