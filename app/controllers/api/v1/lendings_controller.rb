# frozen_string_literal: true

module Api
  module V1
    class LendingsController < ApplicationController
      def index
        lendings = Lending.where(user_id: params[:user_id])
        if lendings.empty?
          render json: { error: 'No lending found' }
        else
          render json: lendings, status: 200
        end
      end

      def show
        lending = Lending.find_by(id: params[:id], user_id: params[:user_id])
        if lending
          render json: lending, status: 200
        else
          render json: { error: 'Lending not found' }
        end
      end

      def create
        lending = Lending.new(lending_params)
        if lending.save
          render json: 'New lending is created', status: 200
        else
          render json: { error: 'Lending creation failed' }
        end
      end

      def update
        lending = Lending.find_by(id: params[:id], user_id: params[:user_id])
        if lending
          if lending.update(lending_params)
            render json: 'Lending updated successfully'
          else
            render json: { error: 'Lending update unsuccessful' }
          end
        else
          render json: { error: 'Lending not found' }
        end
      end

      def complete
        lending = Lending.find_by(id: params[:id], user_id: params[:user_id])
        if lending
          if lending.update(complete_params)
            render json: (complete_params[:repayment] == true ? 'Lending closed' : 'Lending reopened')
          else
            render json: { error: 'Lending closing unsuccessful' }
          end
        else
          render json: { error: 'Lending not found' }
        end
      end

      def destroy
        lending = Lending.find_by(id: params[:id], user_id: params[:user_id])
        if lending
          if lending.destroy
            render json: 'Lending destroyed successfully'
          else
            render json: { error: 'Lending destruction unsuccessful' }
          end
        else
          render json: { error: 'Lending not found' }
        end
      end

      private

      def lending_params
        params.require(:lending).permit(:user_id, :amount, :person, :lending_date, :expected_repayment_date)
      end

      def complete_params
        permitted_params = params.require(:lending).permit(:repayment, :repayment_date)
        permitted_params[:repayment_date] = nil if permitted_params[:repayment] == false
        permitted_params
      end
    end
  end
end
