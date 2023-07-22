require "rails_helper"

RSpec.describe "Attendances", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /new" do
    let(:date) { Time.zone.today.strftime("%Y-%m-%d") }

    it "returns http success" do
      get new_attendance_path(date: date)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:expected_date) { "2023-04-27" }

    let(:valid_attendance_attributes) do
      {
        attendance_form: {
          attendances_attributes: {
            "0" => attributes_for(:attendance, date: expected_date),
            "1" => attributes_for(:attendance, date: expected_date),
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
          post attendances_path, params: valid_attendance_attributes
        }.to change { Attendance.count }.by(2)
        expect(response).to redirect_to show_date_attendances_path(date: expected_date)
      end
    end

    context "when the request is invalid" do
      it "does not create new attendances" do
        expect {
          post attendances_path, params: invalid_attendance_attributes
        }.not_to change { Attendance.count }
      end
    end
  end
end
