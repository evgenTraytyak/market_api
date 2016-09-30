# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MarketApi.Repo.insert!(%MarketApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias MarketApi.Repo
alias MarketApi.Market

Enum.each(1..5, fn(_) ->
  Repo.insert!(
    %Market{
      name: Faker.Company.name,
      phone: Faker.Phone.EnUs.phone
    }
  )
end)

Repo.transaction fn ->
  Repo.all(Market) |> Enum.each(fn(market) ->
    Enum.each(1..20, fn(_) ->
      product = %{
        name: Faker.Commerce.product_name,
        barcode: Faker.Code.isbn,
        image: Faker.Avatar.image_url,
        price: Faker.Commerce.price
      }
      new_product = Ecto.build_assoc(market, :products, Map.put(product, :market_id, market.id))
      Repo.insert!(new_product)
    end)
  end)
end
