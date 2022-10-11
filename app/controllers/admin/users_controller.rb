class Admin::UsersController < ApplicationController
  # adminがログインしていないとページ見れない
  before_action :authenticate_admin!
end
