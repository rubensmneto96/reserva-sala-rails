require 'rails_helper'

RSpec.describe BookingsController, :type => :controller do
    context "GET #index" do
        it "should success and render to index page" do
            get :index
            expect(response).to render_template(:index)
        end

        it "bookings array should be empty" do
            get :index
            expect(assigns(:bookings)).to be_empty
        end

        it "bookings array should not be empty" do
            create(:booking)
            get :index
            expect(assigns(:bookings)).to_not be_empty
        end
    end

    context "GET #show" do
        let(:booking) { create(:booking) }
        it "should success and render to show page" do
            get :show, params: { id: booking.id }
            expect(response).to render_template(:show)
        end
    end

    context "GET #new" do
        it "should success and redirect to sign in" do
            get :new
            expect(response).to redirect_to(new_user_session_path)
        end
    end

    context "POST #create" do
        let!(:params) { { full_name: 'Full Name', email: 'mail@example.com', room: 'Room', date: DateTime.now, user_id: 'User ID' } }
        it "create new booking" do
            post :create, params: { post: params }
            expect(flash[:notice])
            expect(response).to redirect_to(new_user_session_path)
        end

        it "doesn't create new booking" do
            expect(response).to render_template(nil)
        end
    end

    context "PUT #update" do
        let!(:booking) { create(:booking) }
        it "update booking" do
            params = { room: "Room Name", date: DateTime.now }
            
            put :update, params: { id: booking.id, booking: params }
            booking.reload
            
            expect(booking.room).to eq(params[:room])
            expect(flash[:notice])
            expect(response).to redirect_to(new_user_session_path)
        end

        it "should not update booking" do
            params = { room: nil }
            
            put :update, params: { id: booking.id, booking: params }
            
            expect(response).to redirect_to(new_user_session_path)
        end
    end

    context "GET #edit" do
        let!(:booking) { create(:booking) }
        it "should success and redirect to edi page" do
            get :edit, params: { id: booking.id }
            expect(response).to redirect_to(new_user_session_path)
        end
    end

    context "DELETE #destroy" do
        let!(:booking) { create(:booking) }
        it "should delete booking" do
            delete :destroy, params: { id: booking.id }
            expect(flash[:notice])
            expect(response).to redirect_to(new_user_session_path)
        end
    end
end