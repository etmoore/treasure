class TweetsController < ApplicationController

  def create
    begin
      if current_user.tweet(twitter_params[:message])
        redirect_to root_path, notice: "Tweet sent successfully"
      end
    rescue MissingName
      puts "you're missing a handle!"
      flash[:notice] = "you're missing a handle!"
      render 'index/show'
    rescue Twitter::Error::NotFound
      puts "user not found"
      flash[:notice] = "user not found"
      render 'index/show'
    end
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
