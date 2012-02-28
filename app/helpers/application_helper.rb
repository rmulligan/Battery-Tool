module ApplicationHelper

  def logo
    image_tag("agua_logo.png",:id => "logo_link",
                         :alt=>"Tracell")
  end

  def title
     if @title.nil?
       ""
     else
       "#{@title}"
     end
   end

end
