defmodule MarketApi.ProductView do
  use MarketApi.Web, :view

  attributes [:id, :name, :barcode, :image, :price, :market_id]

  def render("index.json-api", %{products: products}) do
    %{data: render_many(products, MarketApi.ProductView, "product.json-api")}
  end

  def render("show.json-api", %{product: product}) do
    %{data: render_one(product, MarketApi.ProductView, "product.json-api")}
  end

  def render("product.json-api", %{product: product}) do
    %{id: product.id,
      name: product.name,
      barcode: product.barcode,
      image: product.image,
      price: product.price,
      market_id: product.market_id}
  end
end
