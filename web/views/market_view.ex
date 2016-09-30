defmodule MarketApi.MarketView do
  use MarketApi.Web, :view

  def render("index.json", %{markets: markets}) do
    %{data: render_many(markets, MarketApi.MarketView, "market.json")}
  end

  def render("show.json", %{market: market}) do
    %{data: render_one(market, MarketApi.MarketView, "market.json")}
  end

  def render("market.json", %{market: market}) do
    %{id: market.id,
      name: market.name,
      phone: market.phone}
  end
end
