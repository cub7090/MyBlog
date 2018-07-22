module ApplicationHelper

	def form_image_select(post)
		return post.banner_image_url if !post.banner_image_url.nil?
		'default-banner.jpg'
	end
end
