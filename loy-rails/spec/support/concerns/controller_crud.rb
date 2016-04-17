shared_examples_for "controller index" do
  let(:accessible_instances) { [instance] }
  let(:index_params) { {} }
  describe "GET index" do
    it "assigns all instances as @instances" do
      get :index, index_params
      expect(assigns(multiple_assign_name)).to match_array accessible_instances
    end
  end
end

shared_examples_for "controller show" do
  describe "GET show" do
    it "assigns the requested instance as @instance" do
      get :show, params
      expect(assigns(single_assign_name)).to eq(instance)
    end
  end
end

shared_examples_for "controller new" do
  describe "GET new" do
    it "assigns a new instance as @instance" do
      get :new, params
      expect(assigns(single_assign_name)).to be_a_new(instance.class)
    end
  end
end

shared_examples_for "controller new, loading instance from another model" do
  describe "GET new" do
    it "assigns requested instance as @instance" do
      get :new, params
      expect(assigns(single_assign_name)).to eq(instance)
    end
  end
end

shared_examples_for "controller new, loading multiple instances from another model" do
  describe "GET new" do
    it "assigns all instances as @instances" do
      get :new, params
      expect(assigns(multiple_assign_name)).to eq([instance])
    end
  end
end

shared_examples_for "controller edit" do
  describe "GET edit" do
    it "assigns the requested instance as @instance" do
      get :edit, params
      expect(assigns(single_assign_name)).to eq(instance)
    end
  end
end

shared_examples_for "controller edit, loading multiple instances from another model" do
  describe "GET edit" do
    it "assigns all instances as @instances" do
      get :edit, params
      expect(assigns(multiple_assign_name)).to eq([instance])
    end
  end
end

shared_examples_for "controller create" do
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Instance" do
        expect {
          post :create, params
        }.to change(instance.class, :count).by(1)
      end

      it "assigns a newly created instance as @instance" do
        post :create, params
        expect(assigns(single_assign_name)).to be_a(instance.class)
        expect(assigns(single_assign_name)).to be_persisted
      end

      it "redirects to the created instance" do
        post :create, params
        expect(response).to redirect_to(redirect_path) unless params[:format] ==  :json
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved instance as @instance" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect_any_instance_of(instance.class).to receive(:save).and_return(false)
        post :create, invalid_params
        expect(assigns(single_assign_name)).to be_a_new(instance.class)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect_any_instance_of(instance.class).to receive(:save).and_return(false)
        post :create, invalid_params
        expect(response).to render_template("new") unless params[:format] ==  :json
      end
    end
  end
end

shared_examples_for "controller update" do
  let(:received_attributes) { valid_attributes }

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested instance" do
        expect_any_instance_of(instance.class).to receive(:update).with(received_attributes)
        put :update, params
      end

      it "assigns the requested instance as @instance" do
        put :update, params
        expect(assigns(single_assign_name)).to eq(instance)
      end

      it "redirects to the instance" do
        put :update, params
        expect(response).to redirect_to(redirect_path) unless params[:format] ==  :json
      end
    end

    describe "with invalid params" do
      it "assigns the instance as @instance" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect_any_instance_of(instance.class).to receive(:save).and_return(false)
        put :update, invalid_params
        expect(assigns(single_assign_name)).to eq(instance)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect_any_instance_of(instance.class).to receive(:save).and_return(false)
        put :update, invalid_params
        expect(response).to render_template("edit") unless params[:format] ==  :json
      end
    end
  end
end

shared_examples_for "controller destroy" do
  describe "DELETE destroy" do
    it "destroys the requested instance" do
      expect {
        delete :destroy, params
      }.to change(instance.class, :count).by(-1)
    end

    it "redirects to the instances list" do
      delete :destroy, params
      expect(response).to redirect_to(redirect_path) unless params[:format] ==  :json
    end
  end
end

shared_examples_for "controller action denied" do
  it "denies access" do
    action
    if request.params[:format] ==  "json"
      expect(response).to have_http_status(:unauthorized)
    else
      expect(response).to redirect_to(root_url)
      expect(flash[:warning]).to eq "Você não tem permissão para efetuar essa operação"
    end
  end
end

shared_examples_for "controller index denied" do
  it_behaves_like "controller action denied" do
    let(:action) { get :index, {}}
  end
end

shared_examples_for "controller show denied" do
  it_behaves_like "controller action denied" do
    let(:action) { get :show, params }
  end
end

shared_examples_for "controller new denied" do
  it_behaves_like "controller action denied" do
    let(:action) { get :new, params }
  end
end

shared_examples_for "controller update denied" do
  it_behaves_like "controller action denied" do
    let(:action) { put :update, params }
  end
end

shared_examples_for "controller create denied" do
  it_behaves_like "controller action denied" do
    let(:action) { post :create, params }
  end
end

shared_examples_for "controller edit denied" do
  it_behaves_like "controller action denied" do
    let(:action) { get :edit, params }
  end
end

shared_examples_for "controller destroy denied" do
  it_behaves_like "controller action denied" do
    let(:action) { delete :destroy, params }
  end
end
