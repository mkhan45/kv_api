defmodule KVApi do
  def init() do
    :ets.new(:bucket, [:named_table, :public])
  end

  def put(k, v) do
    :ets.insert(:bucket, {k, v})
  end

  def get(k) do
    case :ets.lookup(:bucket, k) do
      [] -> nil
      [{_, v}] -> v
    end
  end
end
