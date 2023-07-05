defmodule BoutiqueSuggestions do

  @max_price 100

  def get_combinations(tops, bottoms, options \\ []) do
    for top <- tops, bottom <- bottoms,
      top.base_color != bottom.base_color,
      top.price + bottom.price <= Keyword.get(options, :maximum_price, @max_price) do
      {top, bottom}
    end
  end
end
