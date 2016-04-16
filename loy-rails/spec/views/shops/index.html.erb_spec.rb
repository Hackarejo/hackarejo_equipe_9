require 'rails_helper'

RSpec.describe "shops/index", type: :view do
  before(:each) do
    assign(:shops, [
      Shop.create!(
        :name => "Name",
        :cnpj => "Cnpj",
        :address => "Address",
        :phone => "Phone",
        :email => "Email",
        :info => "MyText",
        :company_name => "Company Name"
      ),
      Shop.create!(
        :name => "Name",
        :cnpj => "Cnpj",
        :address => "Address",
        :phone => "Phone",
        :email => "Email",
        :info => "MyText",
        :company_name => "Company Name"
      )
    ])
  end

  it "renders a list of shops" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
  end
end
