defmodule MarketApi.Market do
  use MarketApi.Web, :model

  schema "markets" do
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :phone])
    |> validate_required([:name, :phone])
  end
end
