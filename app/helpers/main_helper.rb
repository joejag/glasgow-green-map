module MainHelper

  def normalize_webaddress addy
    if (addy.nil?)
      return ""
    end

    if (addy.match("http*"))
      return addy
    else
      return 'http://' + addy
    end
  end

  def create_info_text place
    # Alternate formatting
    # text ="<h4 style='margin-bottom:0px;'>" + place.name + "</h4>"
    # if (place.url != nil)
    #   if (place.url.match("http*"))
    #     text += "<a href='" + place.url + "'>" + place.url + "</a><br />"
    #   else
    #     text += "<a href='http://" + place.url + "'>" + place.url + "</a><br />"
    #   end
    # end
    # 
    # if(place.photos.size > 0)
    #   text += "<img src='" + @context + "photo_admin/thumbnail/#{place.photos[0].id}' height='100' /><br />"
    # end
    # 
    # text += convert_address(place ) + "<br />"
    # 
    # if (place.telephone != nil)
    #   text += place.telephone.to_s + "<br />"
    # end
    # if (place.email != nil)
    #   text += place.email + "<br />"
    # end
    # if (place.opening_times != nil)
    #   text += "Open " + place.opening_times.to_s + "<br />"
    # end
    # 
    # if (place.about != nil)
    #   place.about.split("\r").each{ |str| text += "<p>" + str + "</p>"}
    # end
    # 
    # text += "<a href='" + @context + 'places/show/' + place.id.to_s + "'>More info</a></p>"
    # 
    # return text

    
    # Original formatting
    text ="<b>" + place.name + "</b><br /><br /><p>"
    
    if(place.photos.size > 0)
      text += "<img src='" + @context + "photo_admin/thumbnail/#{place.photos[0].id}' height='100' /><br />"
    end
    
    text += "<b>Address</b> " + convert_address(place ) + "<br />"
    
    if (place.opening_times != nil)
      text += "<b>Opening Hours</b> " + place.opening_times.to_s + "<br />"
    end
    if (place.telephone != nil)
      text += "<b>Telephone</b> " + place.telephone.to_s + "<br />"
    end
    if (place.url != nil)
      if (place.url.match("http*"))
        text += "<b>Webpage</b> <a href='" + place.url + "'>" + place.url + "</a><br />"
      else
        text += "<b>Webpage</b> <a href='http://" + place.url + "'>" + place.url + "</a><br />"
      end
    end
    if (place.email != nil)
      text += "<b>Email</b> " + place.email + "<br />"
    end
    
    if (place.about != nil)
      place.about.split("\r").each{ |str| text += "<p>" + str + "</p>"}
    end
    
    text += "<br /><a href='" + @context + 'places/show/' + place.id.to_s + "'>More info</a></p>"
    
    return text
  end

  def convert_address place
    result = ""

    unless (place.address_1.nil? or place.address_1.size == 0)
      result += place.address_1.to_s
    end
    unless (place.address_2.nil? or place.address_2.size == 0)
      result += ', ' + place.address_2.to_s
    end
    unless (place.address_3.nil? or place.address_3.size == 0)
      result += ', ' + place.address_3.to_s
    end

    return result
  end

  def createDropDownOption(label,value)
      option = OptionInList.new
      option.value = value
      option.label = label
      return option
  end

  $TIME_TO_WALK_DISTANCE_INCREMEMNT=15
  $UNIT_OF_TIME='mins'
  $DISTANCE_INCREMENT=0.5
  $UNIT_OF_DISTANCE_LENGTH='miles'
  $MODE_OF_TRANSPORT='walking'

  def getSearchWithinAreaOptions

    pulldownOptions = []
    time, distance = 0

    6.times do |distance|
      time += $TIME_TO_WALK_DISTANCE_INCREMEMNT

      if distance == 0
        distance +=$DISTANCE_INCREMENT
      else
        pulldownOptions  << createDropDownOption(distance.to_s + $UNIT_OF_DISTANCE_LENGTH + ' ('+ time.to_s + $UNIT_OF_TIME + $MODE_OF_TRANSPORT+')', distance)
        time += $TIME_TO_WALK_DISTANCE_INCREMEMNT
        distance += $DISTANCE_INCREMENT
      end

      pulldownOptions  << createDropDownOption(distance.to_s + $UNIT_OF_DISTANCE_LENGTH + ' ('+ time.to_s + $UNIT_OF_TIME + $MODE_OF_TRANSPORT +')', distance)
    end

    return pulldownOptions;

  end

  $TIME_TO_WALK_DISTANCE_INCREMEMNT=15
  $UNIT_OF_TIME='mins'
  $DISTANCE_INCREMENT=0.5
  $UNIT_OF_DISTANCE_LENGTH='miles'
  $MODE_OF_TRANSPORT='walking'

  def getSearchWithinAreaOptionsFilter

    pulldownOptions = []
    time, distance = 0

    6.times do |distance|

      if distance == 0
        distance +=$DISTANCE_INCREMENT
      else
        pulldownOptions  << createDropDownOption(distance.to_s, distance)
        distance += $DISTANCE_INCREMENT
      end

      pulldownOptions  << createDropDownOption(distance.to_s, distance)
    end

    return pulldownOptions;

  end

end
