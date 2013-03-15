module ApplicationHelper

	def flashes_helper
	    results = []
	    flashes = [:alert, :error, :info, :notice, :success]

	    flashes.each do |name, msg|
	      hidden = "hide" if flash[name].blank?
	      results << content_tag(:div, content_tag(:p, flash[name]), class: "alert alter-#{name} #{hidden} alert-block").html_safe
	    end
	    results.join("").html_safe
	end

end
