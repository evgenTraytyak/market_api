defmodule MarketApi.Product do
  use MarketApi.Web, :model

  schema "products" do
    field :name, :string
    field :barcode, :string
    field :image, :string
    field :price, :decimal
    belongs_to :market, MarketApi.Market

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :barcode, :image, :price])
    |> validate_required([:name, :barcode, :image, :price])
  end
end
