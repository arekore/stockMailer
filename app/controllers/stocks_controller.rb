class StocksController < ApplicationController

  before_action :require_email

  def index
    @mailList = User.all
    @stockList = Stock.all
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      flash[:success] = "Added New Stock"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def update
    @stock = Stock.find(params[:id])
    if @stock.update_attributes(stock_params)
      flash[:success] = "Updated Stock"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    Stock.find(params[:id]).destroy
    flash[:success] = "Stock Deleted"
    redirect_to root_path
  end

  private

    def stock_params
      params.require(:stock).permit(:name, :code, :sendFlag)
    end

    def require_email
      unless email_exist?
        flash[:error] = "送信用メールアドレスを登録してください"
        redirect_to '/users/new'
      end
    end

    def email_exist?
      data = User.all
      unless data.empty?
        return true
      else
        return false
      end
    end
end
