module PlacesHelper
  def pagination_links_remote(paginator)
    page_options = {:window_size => 1}
    pagination_links_each(paginator, page_options) do |n|
      options = {
        :url => {:action => 'listajaxian', :params => params.merge({:page => n})},
        :update => 'PlacesListTable',
        :before => "",
        :success => ""
      }
      html_options = {:href => url_for(:action => 'listajaxian', :params => params.merge({:page => n}))}
      link_to_remote(n.to_s, options, html_options)
    end
  end
  
  def convert_address place
    result = ""
    
    if(not place.address_1.nil?)
      result += place.address_1.to_s
    end
    if(not place.address_2.nil?)
      result += ', ' + place.address_2.to_s
    end
    if(not place.address_3.nil?)
      result += ', ' + place.address_3.to_s
    end
    
    return result
  end
  
  def create_http_link place
    text= ""
    if(place.url != nil)
      if(place.url.match("http*"))
        text += "<a href='" + place.url + "'>" + place.url + "</a>"
      else
        text += "<a href='http://" + place.url + "'>" + place.url + "</a>"
      end
    end
    return text
  end
  
  
#     This function is soley for clarity in the migrations.
#  
#    @placeId = createPlace(name, about, category,
#                    [ address1, address2, address_3,  town, postcode],
#                    [ contact_name, phone_no, email, url, open_times],
#                    [ tags]
#                );
#
#
  def add_tags (place, tags)  
      tags.each do|tag|
        place.tags << Tag.find(:all, :conditions => { :name => tag })
      end
  end
  
end
