require 'test_helper'

class Customer::TodolistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_todolists_new_url
    assert_response :success
  end

end
