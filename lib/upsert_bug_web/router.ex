defmodule UpsertBugWeb.Router do
  use UpsertBugWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UpsertBugWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PostController, :index
    resources "/posts", PostController
    resources "/comments", CommentController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", UpsertBugWeb do
  #   pipe_through :api
  # end
end
