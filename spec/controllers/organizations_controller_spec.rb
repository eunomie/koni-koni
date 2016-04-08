require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  let(:valid_attributes) { { name: Faker::Company.name } }

  let(:invalid_attributes) { {} }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all organizations as @organizations' do
      organization = Organization.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:organizations)).to eq([organization])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested organization as @organization' do
      organization = Organization.create! valid_attributes
      get :show, { id: organization.to_param }, valid_session
      expect(assigns(:organization)).to eq(organization)
    end
  end

  describe 'GET #new' do
    it 'assigns a new organization as @organization' do
      get :new, {}, valid_session
      expect(assigns(:organization)).to be_a_new(Organization)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested organization as @organization' do
      organization = Organization.create! valid_attributes
      get :edit, { id: organization.to_param }, valid_session
      expect(assigns(:organization)).to eq(organization)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Organization' do
        expect do
          post :create, { organization: valid_attributes }, valid_session
        end.to change(Organization, :count).by(1)
      end

      it 'assigns a newly created org as @org' do
        post :create, { organization: valid_attributes }, valid_session
        expect(assigns(:organization)).to be_a(Organization)
        expect(assigns(:organization)).to be_persisted
      end

      it 'redirects to the created organization' do
        post :create, { organization: valid_attributes }, valid_session
        expect(response).to redirect_to(Organization.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved organization as @organization' do
        post :create, { organization: invalid_attributes }, valid_session
        expect(assigns(:organization)).to be_a_new(Organization)
      end

      it 're-renders the \'new\' template' do
        post :create, { organization: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { valid_attributes.merge(name: Faker::Company.name) }

      it 'updates the requested organization' do
        organization = Organization.create! valid_attributes
        put :update, { id: organization.to_param, organization: new_attributes }, valid_session
        organization.reload
        expect(organization.name).to eq new_attributes[:name]
      end

      it 'assigns the requested organization as @organization' do
        organization = Organization.create! valid_attributes
        put :update, { id: organization.to_param, organization: valid_attributes }, valid_session
        expect(assigns(:organization)).to eq(organization)
      end

      it 'redirects to the organization' do
        organization = Organization.create! valid_attributes
        put :update, { id: organization.to_param, organization: valid_attributes }, valid_session
        expect(response).to redirect_to(organization)
      end
    end

    context 'with invalid params' do
      it 'assigns the organization as @organization' do
        organization = Organization.create! valid_attributes
        put :update, { id: organization.to_param, organization: invalid_attributes }, valid_session
        expect(assigns(:organization)).to eq(organization)
      end

      xit 're-renders the \'edit\' template' do
        organization = Organization.create! valid_attributes
        put :update, { id: organization.to_param, organization: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested organization' do
      organization = Organization.create! valid_attributes
      expect do
        delete :destroy, { id: organization.to_param }, valid_session
      end.to change(Organization, :count).by(-1)
    end

    it 'redirects to the organizations list' do
      organization = Organization.create! valid_attributes
      delete :destroy, { id: organization.to_param }, valid_session
      expect(response).to redirect_to(organizations_url)
    end
  end
end