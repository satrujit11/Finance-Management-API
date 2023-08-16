# frozen_string_literal: true

module Api
  module V1
    class ExpensesController < ApplicationController
      def index_all
        expenses = Expense.all
        render json: expenses, status: 200
      end

      def index
        expenses = Expense.where(user_id: params[:user_id])
        if expenses.empty?
          render json: { error: 'No expense found' }
        else
          expense_data = expenses.map { |expense| generate_api_end_point(expense) }
          render json: expense_data, status: 200
        end
      end

      def show
        expense = Expense.find_by(id: params[:id], user_id: params[:user_id])
        if expense
          expense_data = generate_api_end_point(expense)
          render json: expense_data, status: 200
        else
          render json: { error: 'No expense found' }
        end
      end

      def create
        expense = Expense.new(expense_params)
        if expense.save
          render json: 'New expense is created', status: 200
        else
          render json: { error: 'Expense creation failed' }
        end
      end

      def update
        expense = Expense.find_by(id: params[:id], user_id: params[:user_id])
        if expense
          if expense.update(update_params)
            render json: 'Expense is updated', status: 200
          else
            render json: { error: 'Expense update failed' }
          end
        else
          render json: { error: 'Expense not found' }
        end
      end

      def destroy
        expense = Expense.find_by(id: params[:id], user_id: params[:user_id])
        if expense
          if expense.destroy
            render json: 'Expense is deleted', status: 200
          else
            render json: { error: 'Expense deletion failed' }
          end
        else
          render json: { error: 'Expense not found' }
        end
      end

      private

      def expense_params
        params.require(:expense).permit(:amount, :expense_type, :medium, :medium_name, :user_id)
      end

      def update_params
        params.require(:expense).permit(:amount, :expense_type, :medium, :medium_name)
      end

      def generate_api_end_point(expense)
        {
          "amount": expense.amount,
          "expense_type": expense.expense_type,
          "medium": expense.medium,
          "medium_name": expense.medium_name,
          "date": expense.created_at.strftime('%Y-%m-%d'),
          "time": expense.created_at.strftime('%I:%M%p')
        }
      end
    end
  end
end
