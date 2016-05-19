defmodule Wigs.PageController do
  use Wigs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
