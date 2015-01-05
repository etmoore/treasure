class TwitterController < ApplicationController
	require 'twitter'

	puts 'TwitterCtrlr: calling update'
	$client.update("You've been treasured!")
end
