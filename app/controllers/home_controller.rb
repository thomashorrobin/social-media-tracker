class HomeController < ApplicationController
  def index
  
  end
  
  def add_account

    account = TwitterAccount.find_by username: params[:username]

    account_doesnt_exisits = account == nil
    
    if account_doesnt_exisits
    
      Twitter.add_twitter_account(params[:username])
      
      
      # respond_to do |format|
      #     format.html { render :text => "account " + params[:username] + " has been added to the process queue" }
      # end

    else

        respond_to do |format|
            format.html { render :text => "account " + params[:username] + " already exisits" }
        end

    end
    
  end
end
