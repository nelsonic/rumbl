defmodule InfoSys.Backend do
  @calback name() :: String.t()
  @callback compute(query :: String.t(), opts :: Keyword.t()) ::
    [%InfoSys.Result{}]
end
