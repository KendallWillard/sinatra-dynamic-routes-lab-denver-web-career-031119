require 'pry'

require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do
    @user_name = params[:name].reverse
    "#{@user_name}"
  end

  get '/square/:number' do
    @user_input = params[:number].to_i
    @user_input = @user_input * @user_input
    "#{@user_input}"
  end

  get '/say/:number/:phrase' do
    @user_number = params[:number].to_i
    @user_phrase = params[:phrase]
    array = []
    @user_number.times do
      array << @user_phrase
    end
    array.join(" ")
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    array = []
        params.each do |key, value|
      array << value
    end

    result = array.join(" ")
    result.concat(".")
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i

    case @operation

    when "add"
      @result = @num1 + @num2
    when "subtract"
      @result = @num1 - @num2
    when "multiply"
      @result = @num1 * @num2
    when "divide"
      @result = @num1 / @num2
    end
    "#{@result}"
  end
end
