class Public::CustomersController < ApplicationController
  before_action :authenticate_user!
end
