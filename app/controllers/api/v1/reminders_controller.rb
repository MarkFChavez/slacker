class Api::V1::RemindersController < ApplicationController
  def index
    render json: reminders
  end

  def create
    create_reminder!
    render json: { status: :ok, message: "success" }

  rescue ActiveRecord::RecordInvalid
    render json: { status: :unprocessable_entity, message: "error" }
  end

  private

  def reminders
    Reminder.order(created_at: :desc)
  end

  def reminder_params
    params.require(:reminder).permit(:description)
  end

  def create_reminder!
    Reminder.create! reminder_params
  end
end
