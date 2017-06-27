defmodule HedwigYoutube.Config do
  @moduledoc false

  @doc """
  Get all the config for an app and get runtime values.
  Parses `{:system, "ENV_NAME"}` values to get environment variable values.
  """
  @spec all(Atom.t) :: List.t
  def all(app) do
    app
    |> Application.get_all_env()
    |> Enum.map(&get_runtime_value/1)
  end

  @doc """
  Get config from key.
  Parses `{:system, "ENV_NAME"}` values to get environment variable values.
  """
  @spec get(Atom.t, Atom.t, any) :: any
  def get(app, key, default \\ nil) do
    app
    |> Application.get_env(key, default)
    |> get_runtime_value()
  end

  @doc """
  Get runtime config value.
  Parses `{:system, "ENV_NAME"}` values to get environment variable values.
  """
  @spec get_runtime_value({:system, String.t} | any) :: any
  def get_runtime_value({:system, env_key}) do
    System.get_env(env_key)
  end
  def get_runtime_value(conf), do: conf
end
