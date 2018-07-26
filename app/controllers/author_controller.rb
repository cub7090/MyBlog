class AuthorController < ApplicationController
	before_action :authenticate_author!, :except => [:search]
end
