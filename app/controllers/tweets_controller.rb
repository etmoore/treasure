class TweetsController < ApplicationController

  def create
    if current_user.tweet(twitter_params[:message])
      redirect_to root_path
    else
      render 'index#show'
    end
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
