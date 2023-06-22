require "rails_helper"

RSpec.describe "Attendances", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /new" do
    it "returns http success" do
      get new_attendance_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create_multiple" do
    let(:valid_attendance_attributes) do
      {
        attendance_form: {
          attendances_attributes: {
            "0" => attributes_for(:attendance),
            "1" => attributes_for(:attendance),
          },
        },
      }
    end

    let(:invalid_attendance_attributes) do
      {
        attendance_form: {
          attendances_attributes: {
            "0" => attributes_for(:attendance, date: nil),
            "1" => attributes_for(:attendance, date: nil),
          },
        },
      }
    end

    context "when the request is valid" do
      it "creates new attendances" do
        expect {
          post create_multiple_attendances_path, params: valid_attendance_attributes
        }.to change { Attendance.count }.by(2)
        expect(response).to redirect_to attendances_path
      end
    end

    context "when the request is invalid" do
      it "does not create new attendances" do
        expect {
          post create_multiple_attendances_path, params: invalid_attendance_attributes
        }.not_to change { Attendance.count }
      end
    end
  end
end
