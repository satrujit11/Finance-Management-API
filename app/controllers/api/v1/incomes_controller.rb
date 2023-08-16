# frozen_string_literal: true

module Api
  module V1
    class IncomesController < ApplicationController
      def index_all
        incomes = Income.all
        render json: incomes, status: 200
      end

      def index
        incomes = Income.where(user_id: params[:user_id])
        if incomes.empty?
          render json: { error: 'No income found' }
        else
          income_data = incomes.map { |income| generate_api_end_point(income) }
          render json: income_data, status: 200
        end
      end

      def show
        income = Income.find_by(id: params[:id], user_id: params[:user_id])
        if income
          income_data = generate_api_end_point(income)
          render json: income_data, status: 200
        else
          render json: { error: 'Income not found' }, status: 404
        end
      end

      def create
        income = Income.new(income_params)
        if income.save
          render json: 'New income is created', status: 200
        else
          render json: { error: 'Income creation failed' }
        end
      end

      def update
        income = Income.find_by(id: params[:id], user_id: params[:user_id])
        if income
          if income.update(update_params)
            render json: 'Income updated sucessfully', status: 200
          else
            render json: { error: 'Income could not updated' }
          end
        else
          render json: { error: 'Income not found' }, status: 404
        end
      end

      def destroy
        income = Income.find_by(id: params[:id], user_id: params[:user_id])
        if income
          if income.destroy
            render json: 'Income is deleted sucessfully', status: 200
          else
            render json: { error: 'Income could not destroyed' }
          end
        else
          render json: { error: 'Income not found' }, status: 404
        end
      end

      private

      def income_params
        params.require(:income).permit(:amount, :source, :user_id, :income_type)
      end

      def update_params
        params.require(:income).permit(:amount, :source, :income_type)
      end

      def generate_api_end_point(income)
        {
          "amount": income.amount,
          "source": income.source,
          "income_type": income.income_type,
          "date": income.created_at.strftime('%Y-%m-%d'),
          "time": income.created_at.strftime('%I:%M%p')
        }
      end
    end
  end
end
