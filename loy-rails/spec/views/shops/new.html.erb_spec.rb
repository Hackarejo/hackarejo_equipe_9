require 'rails_helper'

RSpec.describe "shops/new", type: :view do
  before(:each) do
    assign(:shop, Shop.new(
      :name => "MyString",
      :cnpj => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :info => "MyText",
      :company_name => "MyString"
    ))
  end

  it "renders new shop form" do
    render

    assert_select "form[action=?][method=?]", shops_path, "post" do

      assert_select "input#shop_name[name=?]", "shop[name]"

      assert_select "input#shop_cnpj[name=?]", "shop[cnpj]"

      assert_select "input#shop_address[name=?]", "shop[address]"

      assert_select "input#shop_phone[name=?]", "shop[phone]"

      assert_select "input#shop_email[name=?]", "shop[email]"

      assert_select "textarea#shop_info[name=?]", "shop[info]"

      assert_select "input#shop_company_name[name=?]", "shop[company_name]"
    end
  end
end
