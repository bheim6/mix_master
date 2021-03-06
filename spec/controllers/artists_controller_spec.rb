require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  describe "GET #index" do
    it "assigns all artists as @artist and renders the index template" do
      artist = create(:artist)

      get(:index)

      expect(assigns(:artists)).to eq([artist])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested artist as @artist and renders the show template" do
      artist = create(:artist)

      get(:show, {:id => artist.to_param})

      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns the new artist as an @artist" do
      get :new

      expect(assigns(:artist)).to be_a_new(Artist)
    end
  end

  describe "GET #edit" do
    it "assigns the new artist as @artist" do
      artist = create(:artist)

      get :edit, {:id => artist.to_param}

      expect(assigns(:artist)).to eq(artist)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates new artist" do
        expect {
          post :create, {:artist => attributes_for(:artist)}
        }.to change(Artist, :count).by(1)
      end

      it "assigns a newly created artist as @artist" do
        post :create, {:artist => attributes_for(:artist)}
        expect(assigns(:artist)).to be_a(Artist)
        expect(assigns(:artist)).to be_persisted
      end

      it "redirects to the created artist" do
        post :create, {:artist => attributes_for(:artist)}
        expect(response).to redirect_to(Artist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved artist as @artist" do
        post :create, {:artist => attributes_for(:artist, name: nil)}
        expect(assigns(:artist)).to be_a_new(Artist)
      end

      it "re-renders the 'new' template" do
        post :create, {:artist => attributes_for(:artist, name: nil)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates an existing artist" do
        artist = create(:artist)
        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: "New Name")}
        artist.reload

        expect(artist.name).to eq("New Name")
      end

      it "redirects newly updated artist to @artist" do
        artist = create(:artist)
        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: "New Name")}
        expect(response).to redirect_to(artist)
      end
    end

    context "with invalid params" do
      it "assigns the newly updated but not saved artist as @artist" do
        artist = create(:artist)
        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end
end
