class TwitterAccount < ActiveRecord::Base
    has_many :twitter_account_snapshots
end
