# frozen_string_literal: true

module Api
  module V1
    class IncomesController < ApplicationController
      def index
        incomes = Income.all
        income_data = incomes.map { |income| generate_api_end_point(income) }
        render json: income_data, status: 200
      end

      def show
        income = Income.find_by(id: params[:id])
        income_data = generate_api_end_point(income)
        if income
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
          render json: { error: 'Income creation is failed' }
        end
      end

      def update
        income = Income.find_by(id: params[:id])
        if income
          if income.update(income_params)
            render json: 'Income updated sucessfully', status: 200
          else
            render json: { error: 'Income could not updated' }
          end
        else
          render json: { error: 'Income not found' }, status: 404
        end
      end

      def destroy
        income = Income.find_by(id: params[:id])
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
        params.require(:income).permit(:amount, :source)
      end

      def generate_api_end_point(income)
        {
          "amount": income.amount,
          "source": income.source,
          "date": income.created_at.strftime('%Y-%m-%d'),
          "time": income.created_at.strftime('%I:%M%p')
        }
      end
    end
  end
end
