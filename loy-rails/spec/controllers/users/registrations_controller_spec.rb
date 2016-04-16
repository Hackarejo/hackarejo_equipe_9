require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  let(:user) { User.last }
  let(:sign_up_params) {{
    name: "New User Name",
    email: "newemail@test.com",
    password: "abc123456",
    password_confirmation: "abc123456"
  }}

  before {
    request.env["devise.mapping"] = Devise.mappings[:user]
  }

  describe "POST create" do
    describe "as Client" do
      context "with valid params" do
        subject { post :create, user: sign_up_params, user_type: "client" }

        it { expect { subject }.to change(User, :count).by(1) }
        it { expect { subject }.to change(Client, :count).by(1) }
      end

      context "with invalid params" do
        before { allow_any_instance_of(User).to receive(:save).and_return(false) }

        it { expect(User.count).to eq(0) }
        it { expect(Client.count).to eq(0) }
      end
    end

    describe "as Manager" do
      context "with valid params" do
        subject { post :create, user: sign_up_params, user_type: "manager" }

        it { expect { subject }.to change(User, :count).by(1) }
        it { expect { subject }.to change(Manager, :count).by(1) }
        it { expect { subject }.to change(Shop, :count).by(1) }
      end

      context "with invalid params" do
        before { allow_any_instance_of(User).to receive(:save).and_return(false) }

        it { expect(User.count).to eq(0) }
        it { expect(Manager.count).to eq(0) }
        it { expect(Shop.count).to eq(0) }
      end
    end

  end
end
