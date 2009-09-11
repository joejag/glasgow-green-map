include PlacesHelper

class AddRealData < ActiveRecord::Migration
  def self.up

    Tag.new(:name => "Volunteering opportunities")
    Tag.new(:name => "Textiles")
    Tag.new(:name => "Clothing")
    Tag.new(:name => "Books/Music")
    Tag.new(:name => "Bric-a-brac")
    Tag.new(:name => "Baby/Kids Wear")
    Tag.new(:name => "Small Electrical")
    Tag.new(:name => "Large Electrical")
    Tag.new(:name => "Small Furniture")
    Tag.new(:name => "Large Furniture")
    Tag.new(:name => "Carpet")
    Tag.new(:name => "Bikes")
    Tag.new(:name => "IT Equipment")
    Tag.new(:name => "Ink Cartridges")
    Tag.new(:name => "Wood")
    Tag.new(:name => "Mobile Phones")
    Tag.new(:name => "Environmental Organisation")

    p = Place.new(
    :name => "Barnardo's", 
    :about => '',
    :telephone => "0141 5529581",
    :address_1 => "54 Wilson St",
    :town => "Glasgow", 
    :postcode => "G1 1HD", 
    :opening_times => "Mon to Fri 9-5, Sat 9-5:30, Sun 11-4",
    :url => "www.barnardos.org.uk",
    :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, ["Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(
    :name => "Barnardo's",
    :about => '', 
    :address_1 => "250 Great Western Rd.",
    :town => "Glasgow", 
    :postcode => "G4 9EJ",
    :telephone => "0141 331 1272",
    :email => "elaine.rattray@bernardoes.org.uk", 
    :contact => "Elaine 9567241", 
    :opening_times => "Mon to Sat 9 - 5:30",
    :url => "www.barnardos.org.uk",
    :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, ["Books/Music", "Textiles", "Ink Cartridges", "Baby/Kids Wear", "Large Furniture", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities", "Large Electrical", "Small Electrical", "Small Furniture", "Bikes", "Mobile Phones"])
    p.save

    p = Place.new(:about => '', :name => "Barnardo's", :url => "www.barnardos.org.uk", :telephone => "0141 357 4165", :address_1 => "116 Dumbarton Rd.", :postcode => "G11 6NY", :contact => "Elaine 9567234", :email => "elaine.rattray@bernardoes.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10:30 - 5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, ["Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Barnardo's", :url => "www.barnardos.org.uk", :telephone => "0141 959 6908", :address_1 => "38 Ancaster Drive", :postcode => "G13 1NB", :contact => "Elaine 9567234", :email => "elaine.rattray@bernardoes.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30- 5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Barnardo's", :url => "www.barnardos.org.uk", :telephone => "0141 556 1893", :address_1 => "340A Duke St.", :postcode => "G31 1QZ", :contact => "Elaine 9567234", :email => "elaine.rattray@bernardoes.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30- 5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Barnardo's", :url => "www.barnardos.org.uk", :telephone => "0141 778 1203", :address_1 => "909-911 Shettleston Rd.", :postcode => "G32 7NU", :contact => "Elaine 9567234", :email => "elaine.rattray@bernardoes.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9 - 5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Barnardo's", :url => "http://www.barnardos.org.uk", :telephone => "0141 423 7845", :address_1 => "483 Victoria Rd.", :postcode => "G42 8RL", :contact => "Elaine 9567234", :email => "elaine.rattray@bernardoes.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9 - 5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Barnardo's", :url => "http://www.barnardos.org.uk", :telephone => "0141 636 6557", :address_1 => "38 Kiilmarnock Rd.", :postcode => "G41 3NH", :contact => "Elaine 9567234", :email => "elaine.rattray@bernardoes.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30 - 5:00", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Blythswood Care", :url => "www.blythswood.org", :telephone => "0141 342 4171", :address_1 => "544 Dumbarton Rd.", :postcode => "G11 6SW", :contact => "Yvonne Morgan - shop manager", :email => "please call Yvonne at the shop", :town => "Glasgow", :opening_times => "Mon to Sat 9.30-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9.30-5", :telephone => "0141 9491019", :email => "please call Yvonne at the shop", :url => "www.blythswood.org", :postcode => "G15 6BS", :name => "Blythswood Care", :town => "Glasgow", :address_1 => "33 Glenkirk Drive", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to thur 9-4 .30, fri 9-3", :contact => "Bill", :telephone => "0141 945 6252", :postcode => "G20 9BD", :name => "Boomerang", :town => "Glasgow", :address_1 => "69-73 Chapel St.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Wood"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon-Sat 9.30-5", :telephone => "0141 332 7056", :email => "wendy graham", :url => "www.bhf.org.uk", :postcode => "G2 3EQ", :name => "British Heart Foundation", :town => "Glasgow", :address_1 => "260 Sauchiehall St.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac",  "Clothing", "Mobile Phones", "Volunteering opportunities" ])
    p.save

    p = Place.new(:about => '', :name => "British Heart Foundation", :url => "www.bhf.org.uk", :telephone => "0141 334 9046", :address_1 => "467 Dumbarton Rd.", :postcode => "G11 6EJ", :contact => "mari mcdoogle", :email => "please call Martin at the shop", :town => "Glasgow", :opening_times => "Mon-Sat 9.30-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "IT Equipment", "Small Electrical", "Ink Cartridges", "Large Furniture", "Large Electrical", "Small Furniture", "Mobile Phones", "Volunteering opportunities" ])
    p.save

    p = Place.new(:about => '', :name => "British Heart Foundation", :url => "www.bhf.org.uk", :address_2 => "795 Govan Rd.", :telephone => "0141 445 1617", :address_1 => "Unit 1", :postcode => "G51 3JP", :contact => "Marion Murray Regional Manager 01372 477 300", :town => "Glasgow", :opening_times => "Mon-Sat 9.30-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "British Red Cross", :url => "www.redcross.org.uk", :telephone => "0141 337 6801", :address_1 => "456 Dumbarton Rd.", :postcode => "G11 6SE", :contact => "Diana Wing - shop manager", :email => "please call Diana at the shop", :town => "Glasgow", :opening_times => "Mon-Sat 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "British Red Cross", :url => "www.redcross.org.uk", :telephone => "0141 422 2188", :address_1 => "343 Victoria Rd.", :postcode => "G42 7SA", :contact => "melica", :email => "please call melica at the shop", :town => "Glasgow", :opening_times => "Mon-Sat 9.30-6", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Bullwood Project", :url => "www.bullwoodproject.co.uk", :telephone => "0141 883 5433", :address_1 => "26 Bullwood Drive", :postcode => "G53 7NW", :contact => "Joe Kilmartin", :email => "jkilma6548@aol.com", :town => "Glasgow", :opening_times => "By arrangement", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Wood", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5, Sun 1-5", :telephone => "0141 332 8204", :url => "www.cancerresearchuk.org", :postcode => "G2  3HQ", :name => "Cancer Research UK", :town => "Glasgow", :address_1 => "269 Sauchiehall St.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5, Sun 1-5", :telephone => "0141 334 9717", :url => "www.cancerresearchuk.org", :postcode => "G12 8UQ", :name => "Cancer Research UK", :town => "Glasgow", :address_1 => "315 Byres Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-8", :telephone => "0141 339 8858", :url => "www.cancerresearchuk.org", :postcode => "G11 6SE", :name => "Cancer Research UK", :town => "Glasgow", :address_1 => "458 Dumbarton Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-9", :telephone => "0141 950 1702", :url => "www.cancerresearchuk.org", :postcode => "G13 1HH", :name => "Cancer Research UK", :town => "Glasgow", :address_1 => "1644 Great Western Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5", :telephone => "0141 422 2121", :email => "Elizabeth Hair 07768441734", :url => "www.cancerresearchuk.org", :postcode => "G42 8YS", :name => "Cancer Research UK", :town => "Glasgow", :address_1 => "424 Victoria Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5", :telephone => "0141 632 4961", :email => "Elizabeth Hair", :url => "www.cancerresearchuk.org", :postcode => "G41 3YG", :name => "Cancer Researcy UK", :town => "Glasgow", :address_1 => "1073 Pollokshaws Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5", :contact => "Jan Hill 0131 347 1029", :telephone => "0141 944 6522", :url => "www.capability-scotland.org.uk", :postcode => "G15 7TG", :name => "Capability Scotland", :town => "Glasgow", :address_1 => "71 Kinfaus Drive", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Small Electrical", "Ink Cartridges", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :contact => "Jan Hill 0131 347 1029", :telephone => "0141 558 0365", :url => "www.capability-scotland.org.uk", :postcode => "G21 1TS", :name => "Capability Scotland", :town => "Glasgow", :address_2 => "230 Springburn Way", :address_1 => "Unit 9", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Small Electrical", "Carpet", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Capability Scotland", :url => "www.capability-scotland.org.uk", :address_2 => "4 Town Centre", :telephone => "0141 771 7974", :address_1 => "Easter House", :postcode => "G34 9DT", :contact => "Jan Hill 0131 347 1029", :town => "Glasgow", :opening_times => "Mon to Sat 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Castlemilk Environment Trust", :url => "www.castlemilkenvironmenttrust.org.uk", :address_2 => "59 Machrie Rd.", :telephone => "0141 630 1919", :address_1 => "The Stables Block", :postcode => "G45 0AZ", :contact => "Matthew Finkle", :email => "matthewfinkle@btconnect.com", :town => "Glasgow", :opening_times => "Mon to Thur 9-5, Fri 9-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 10:30 - 5:30", :url => "www.cats.org.uk", :postcode => "G11 6SE", :name => "Cats Protection League", :town => "Glasgow", :address_1 => "440 Dumbarton Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Chest, Heart & Stroke Association", :url => "www.chss.org.uk", :telephone => "0141 579 0090", :address_1 => "608 Dumbarton Rd.", :postcode => "G11 6hy", :contact => "Ellen Boyle 01312256964", :email => "ellen.boyle@chss.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4.30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Chest, Heart & Stroke Association", :url => "www.chss.org.uk", :telephone => "0141 633 0473", :address_1 => "103 Clarkston Rd.", :postcode => "G44 3BL", :contact => "Ellen Boyle 01312256963", :email => "ellen.boyle@chss.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4.30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "City IT Recycling", :url => "www.cityitservices.co.uk", :address_3 => "89 Chapel St.", :address_2 => "Chapel St.Industrial Estate", :telephone => "0141 404 6395", :address_1 => "Unit 3", :postcode => "G20 9BD", :contact => "Steph Grant", :email => "stephen@cityitservices.co.uk", :town => "Glasgow", :opening_times => "Mon to Fri 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "IT Equipment", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Community Can Cycle (Bicycle Workshop)", :url => "www.communitycancycle.org.uk", :address_2 => "179 Drakemire Drive", :telephone => "0141 630 1015", :address_1 => "Unit 4a", :postcode => "G45 9SS", :contact => "Mr James O'Donnell", :email => "lovecancycle@btconnect.com", :town => "Glasgow", :opening_times => "Mon to Thur 9-5, Fri 9-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Cosgrove Care", :url => "www.cosgrove.co.uk", :telephone => "0141 632 1441", :address_1 => "5 Skirving St.", :postcode => "G41 3AB", :contact => "Eleanr Livingston 0141 6497789", :email => "eleanrlivingston@ntlworld.com", :town => "Glasgow", :opening_times => "Mon to Fri 10-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "IT Equipment", "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Large Furniture", "Bric-a-brac", "Small Furniture", "Mobile Phones", "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Cosgrove Care", :url => "www.cosgrove.co.uk", :telephone => "0141 649 4000", :address_1 => "4 Skirving St.", :postcode => "G41 3AA", :contact => "Eleanr Livingston 0141 6497790", :email => "eleanrlivingston@ntlworld.com", :town => "Glasgow", :opening_times => "Mon to Fri 10-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "IT Equipment", "Textiles", "Bric-a-brac", "Large Electrical", "Small Furniture", "Bikes", "Books/Music", "Baby/Kids Wear", "Small Electrical", "Large Furniture", "Ink Cartridges", "Volunteering opportunities", "Mobile Phones"])
    p.save

    p = Place.new(:about => '', :name => "Cosgrove Care", :url => "www.cosgrove.co.uk", :telephone => "0141 649 7788", :address_1 => "16 Skirving St.", :postcode => "G41 3AA", :contact => "Eleanr Livingston 0141 6497788", :email => "eleanrlivingston@ntlworld.com", :town => "Glasgow", :opening_times => "Mon to Fri 10-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "IT Equipment", "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Large Furniture", "Bric-a-brac", "Small Furniture", "Mobile Phones", "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "DEBRA", :url => "www.debra.org.uk", :telephone => "0141 243 2695", :address_1 => "10 Union St.", :postcode => "G1 3QX", :contact => "tricia muir", :email => "debra.scotland@btconnect.com", :town => "Glasgow", :opening_times => "Mon to Sat 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "DEBRA", :url => "www.debra.org.uk", :telephone => "0141 548 1083", :address_1 => "15-17  Argyle St.", :postcode => "G2  8AH", :contact => "tricia muir", :email => "debra.scotland@btconnect.com", :town => "Glasgow", :opening_times => "Mon to Sat 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Large Furniture", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "DEBRA", :url => "www.debra.org.uk", :telephone => "0141 548 1246", :address_1 => "25 Argyle St.", :postcode => "G2  8AH", :contact => "tricia muir", :email => "debra.scotland@btconnect.com", :town => "Glasgow", :opening_times => "Mon to Sat 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "IT Equipment", "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Dennistoun Baptist Church", :url => "www.dennistounbc.co.uk", :telephone => "0141 770 8292", :address_1 => "654 Alexandra Parade", :postcode => "G31 3BU", :contact => "Alan hamilton-messer", :email => "minister@dennistounbc.co.uk", :town => "Glasgow", :opening_times => "Mon to Fri 10:30- 4, Sat 10:30-1", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "IT Equipment", "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Bikes"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Fri 11-4", :contact => "Jean Fergusson", :postcode => "G31 3BQ", :name => "DennistounCentral Church", :town => "Glasgow", :address_1 => "496 Alexandra Parade", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture"])
    p.save

    p = Place.new(:about => '', :name => "DRC Environmental Trust", :url => "www.dumbartonroad.com", :address_2 => "Kingsway Court", :telephone => "0141 587 6010", :address_1 => "Ground Floor, Block 40", :postcode => "G14 9UJ", :contact => "Mr Kenneth Montgomery", :email => "monty@dumbartonroad.com", :town => "Glasgow", :opening_times => "Mon to Fri 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Bikes"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Fri 9-5", :telephone => "0141 353 3903", :email => "susan pringle", :url => "www.emmausglasgow.org.uk", :postcode => "G22 5QT", :name => "Emmaus Community Shop", :town => "Glasgow", :address_1 => "101 Ellesmere St.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 10-4", :telephone => "0141 342 4089", :email => "cecilia mckintosh", :url => "www.emmausglasgow.org.uk", :postcode => "G11 6RH", :name => "Emmaus Solidarity", :town => "Glasgow", :address_1 => "576 Dumbarton Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Mobile Phones"])
    p.save

    p = Place.new(:about => '', :name => "GalGael Trust", :url => "www.galgael.org", :telephone => "0141 427 3070", :address_1 => "15 Fairley St.", :postcode => "G51 2SN", :contact => "helen hollywood", :email => "mail@galgael.org", :town => "Glasgow", :opening_times => "Mon to Fri 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Wood", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Glasgow East Environmental Team", :address_2 => "69 Aberdalgie", :telephone => "0141 781 2000", :address_1 => "Westwood Business Centre", :postcode => "G34 9HJ", :contact => "Ann- Marie Allen", :email => "enquiries@geenvironment.org", :town => "Glasgow", :opening_times => "Mon to Fri 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Environmental Organisation"])
    p.save

    p = Place.new(:about => '', :name => "Glasgow Science Centre", :url => "www.glasgowsciencecentre.org", :telephone => "0141 420 5010", :address_1 => "50 Pacific Quay", :postcode => "G51 1EA", :contact => "Mr Steven Owens", :email => "steve.owens@glasgowsciencecentre.org", :town => "Glasgow", :opening_times => "Mon to Sun 10-6", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Environmental Organisation"])
    p.save

    p = Place.new(:about => '', :name => "Glasgow Wood Recycling Project", :url => "www.glasgowwoodrecycling.org.uk", :address_2 => "42 Dalsetter Avenue", :telephone => "0141 944 6541", :address_1 => "Unit 33-34 Dalsetter Business Centre", :postcode => "G15 8TE", :contact => "Peter Lavelle", :email => "info@glasgowwoodrecycling.org.uk", :town => "Glasgow", :opening_times => "Mon to Fri 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Wood"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Fri 9-5", :contact => "Moyra Lindsay", :telephone => "0141 420 3573 ext. 216", :email => "gorbalsrecycles@yahoo.co.uk", :postcode => "G5 0PG", :name => "Gorbals Recycles, Number Ten", :town => "Glasgow", :address_1 => "10 Commercial Court", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Govanhill Reaction Team (GREAT)", :url => "www.govanhillha.org", :address_2 => "79 Coplaw St.", :telephone => "0141 636 3666", :address_1 => "Samaritan House", :postcode => "G42 7JG", :contact => "Mr Ian Borthwick", :email => "Iborthwick@govanhillha.org", :town => "Glasgow", :opening_times => "Mon to Fri 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Fri 9-5", :telephone => "0141 445 4418", :email => "ken.bussey@Linthouseha.com", :postcode => "G51 4RB", :name => "Greater Govan Environment Trust", :town => "Glasgow", :address_1 => "1Cressy St.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Environmental Organisation"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 10-5", :telephone => "0141 424 1110", :email => "haevib", :url => "www.hrf.co.uk", :postcode => "G41 2QQ", :name => "Human Relief Foundation", :town => "Glasgow", :address_1 => "577 Pollokshaws Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Carpet", "Bric-a-brac", "Clothing", "Small Furniture"])
    p.save

    p = Place.new(:about => '', :telephone => "0141 575 3001 call for further information and details on shop opening times", :url => "www.impactarts.co.uk", :postcode => "G1", :name => "Impact Arts", :town => "Glasgow", :address_2 => "45 High St.", :address_1 => "Home Shop", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    p.save

    p = Place.new(:about => '', :opening_times => "Mon-Sat 9:30-5:30, Sun 10 till 4", :telephone => "0141 423 3929", :email => "habib.malik@islamic-relief.co.uk", :url => "www.islamic-relief.co.uk", :postcode => "G41 2SU", :name => "Islamic Relief", :town => "Glasgow", :address_1 => "115 Albert Drive", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "James Shields Project", :url => "www.quarriers.org.uk", :telephone => "0141 429 2663", :address_1 => "100 Pollokshaws Rd.", :postcode => "G41 1PZ", :contact => "grant brooks", :email => "grant.brooks@quarriersjsp.org.uk", :town => "Glasgow", :opening_times => "Mon toFri 9 to 5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Large Furniture", "Small Furniture"])
    p.save

    p = Place.new(:about => '', :name => "Kelvin Clyde Greenspace", :url => "www.greenspace.org.uk", :address_3 => "95 Boden St.", :address_2 => "Boden St. Industrial Estate", :telephone => "0141 554 8672", :address_1 => "Unit 8", :postcode => "G40 3QF", :contact => "Derek Dunsire", :email => "kc.greenspace@btopenworld.com", :town => "Glasgow", :opening_times => "Mon to Fri 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Environmental Organisation", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Fri 11-4, Sat 11-2", :telephone => "0141 636 9240", :postcode => "G41 3RP", :name => "Life", :town => "Glasgow", :address_1 => "1311 Pollokshaws Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Marie Curie Cancer Care", :url => "www.mariecurie.org.uk", :address_3 => "Maryhill Rd.", :address_2 => "Maryhill Shopping Centre", :telephone => "0141 945 5907", :address_1 => "Unit 6", :postcode => "G20 9SH", :contact => "mairi kelly 01236721007/07798637918", :email => "mairi.kelly@mariecurie.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30-5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Marie Curie Cancer Care", :url => "www.mariecurie.org.uk", :telephone => "0141 337 3764", :address_1 => "147 Hyndland Rd.", :postcode => "G12 9JA", :contact => "mairi kelly 01236721007/07798637918", :email => "mairi.kelly@mariecurie.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30-5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Marie Curie Cancer Care", :url => "www.mariecurie.org.uk", :telephone => "0141 341 0258", :address_1 => "383 Dumbarton Rd.", :postcode => "G11 6BE", :contact => "mairi kelly 01236721007/07798637918", :email => "mairi.kelly@mariecurie.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30-5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Marie Curie Cancer Care", :url => "www.mariecurie.org.uk", :telephone => "0141 954 7802", :address_1 => "742 Anniesland Rd.", :postcode => "G14 0YU", :contact => "mairi kelly 01236721007/07798637918", :email => "mairi.kelly@mariecurie.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30-5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Marie Curie Cancer Care", :url => "www.mariecurie.org.uk", :address_2 => "Springburn Shopping Centre", :telephone => "0141 558 9537", :address_1 => "Unit 20", :postcode => "G21 1TS", :contact => "mairi kelly 01236721007/07798637918", :email => "mairi.kelly@mariecurie.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30-5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Marie Curie Cancer Care", :url => "www.mariecurie.org.uk", :telephone => "0141 423 6057", :address_1 => "353 Victoria Rd.", :postcode => "G42 8YZ", :contact => "mairi kelly 01236721007/07798637918", :email => "mairi.kelly@mariecurie.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30-5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Marie Curie Cancer Care", :url => "www.mariecurie.org.uk", :telephone => "0141 636 6584", :address_1 => "109 Kiilmarnock Rd.", :postcode => "G41 3YT", :contact => "mairi kelly 01236721007/07798637918", :email => "mairi.kelly@mariecurie.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30-5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Marie Curie Cancer Care", :url => "www.mariecurie.org.uk", :telephone => "0141 882 2977", :address_1 => "2224 Paisley Rd. West", :postcode => "G51 9SW", :contact => "mairi kelly 01236721007/07798637918", :email => "mairi.kelly@mariecurie.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 9:30-5:30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-4", :telephone => "0141 946 0209", :email => "patrick park", :url => "www.maxirichards.org", :postcode => "G20 9AX", :name => "Maxie Richards Foundation", :town => "Glasgow", :address_1 => "1079 Maryhill Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Books/Music", "Small Electrical", "Large Furniture", "Bric-a-brac", "Large Electrical", "Small Furniture", "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 7:45 - 4:30", :telephone => "0142 334 7799   ", :email => "patrick park", :url => "www.maxirichards.org", :postcode => "G11 6RH", :name => "Maxie Richards Foundation", :town => "Glasgow", :address_1 => "550 Dumbarton Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
     add_tags (p, [ "Books/Music", "Small Electrical", "Large Furniture", "Bric-a-brac", "Large Electrical","Small Furniture", "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 7:45 - 4:30", :telephone => "0141 334 7799   ", :email => "patrick park", :url => "www.maxirichards.org", :postcode => "G11 6RH", :name => "Maxie Richards Foundation", :town => "Glasgow", :address_1 => "568 Dumbarton Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Books/Music", "Small Electrical", "Large Furniture", "Bric-a-brac", "Large Electrical", "Small Furniture", "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Thur 9-5, Thur 9-4.30", :telephone => "0141 429 6034", :email => "meridianbemwc@hotmail.com", :postcode => "G5 8AQ", :name => "Meridian", :town => "Glasgow", :address_1 => "30 Clyde Place", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Textiles", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "North Glasgow Community Food Initiative", :url => "www.ngcfi.org.uk", :address_2 => "221 Millburn St.", :telephone => "0141 552 8817", :address_1 => "The Millburn Centre", :postcode => "G21 2HL", :contact => "Abi Mordon", :email => "ngcfi@yahoo.co.uk", :town => "Glasgow", :opening_times => "Mon to Fri 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Environmental Organisation", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 10-6, Sun 12-6", :contact => "caron andrews", :telephone => "0141 339 3111", :url => "www.oxfam.org.uk", :postcode => "G12 8UD", :name => "Oxfam", :town => "Glasgow", :address_1 => "231 Byres Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Baby/Kids Wear", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon, Wed, Fri 10:30- 5, Tue, Thur 10:30-6, Sun 12-5", :contact => "eddy steele", :telephone => "0141 423 4317", :url => "www.oxfam.org.uk", :postcode => "G42 8RW", :name => "Oxfam (Books & Music)", :town => "Glasgow", :address_1 => "437 Victoria Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [ "Books/Music", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Wed 9:30-5:30, Thur to Sat 9:30-6, Sun 12-6", :contact => "xx", :telephone => "0141 338 6185", :url => "www.oxfam.org.uk", :postcode => "G12 8AP", :name => "Oxfam (Books)", :town => "Glasgow", :address_1 => "330 Byres Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 10:30-5:30, Thur 10:30-6, Sun 12-5", :telephone => "0141 334 7669", :url => "www.oxfam.org.uk", :postcode => "G12 8TS", :name => "Oxfam (Music)", :town => "Glasgow", :address_1 => "171 Byres Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Books/Music", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5pm", :contact => "jill bartholemue", :telephone => "0141 339 8370", :url => "www.pdsa.org.uk", :postcode => "G11 6XE", :name => "PDSA", :town => "Glasgow", :address_1 => "154 Dumbarton Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5pm", :telephone => "0141 550 0871", :url => "www.pdsa.org.uk", :postcode => "G31 1DL", :name => "PDSA", :town => "Glasgow", :address_1 => "553 Duke St.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5pm", :contact => "myree keir", :telephone => "0141 636 1294", :url => "www.pdsa.org.uk", :postcode => "G41 3XA", :name => "PDSA", :town => "Glasgow", :address_1 => "1104 Pollokshaws Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Prince & Princess of Wales Hospice", :url => "www.ppwh.org.uk", :telephone => "0141 945 0360", :address_1 => "1089 Maryhill Rd.", :postcode => "G20 9AY", :contact => "Anne McBryan 0141 4295599", :email => "anne.mcbryan@ppwh.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Prince & Princess of Wales Hospice", :url => "www.ppwh.org.uk", :telephone => "0141 357 2863", :address_1 => "349 Dumbarton Rd.", :postcode => "G11 6AL", :contact => "Anne McBryan 0141 4295599", :email => "anne.mcbryan@ppwh.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Prince & Princess of Wales Hospice", :url => "www.ppwh.org.uk", :telephone => "0141 778 4016", :address_1 => "1114 Shettleston Rd.", :postcode => "G32 7PR", :contact => "Anne McBryan 0141 4295599", :email => "anne.mcbryan@ppwh.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Prince & Princess of Wales Hospice", :url => "www.ppwh.org.uk", :telephone => "0141 554 6809", :address_1 => "61 Main St.", :postcode => "G40 1QB", :contact => "Anne McBryan 0141 4295599", :email => "anne.mcbryan@ppwh.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Prince & Princess of Wales Hospice", :url => "www.ppwh.org.uk", :telephone => "0141 422 1118", :address_1 => "689 Pollokshaws Rd.", :postcode => "G41 2QB", :contact => "Anne McBryan 0141 4295599", :email => "anne.mcbryan@ppwh.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Prince & Princess of Wales Hospice", :url => "www.ppwh.org.uk", :telephone => "0141 637 1177", :address_1 => "10 Drakemire Dr.", :postcode => "G44 5EL", :contact => "Anne McBryan 0141 4295599", :email => "anne.mcbryan@ppwh.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Prince & Princess of Wales Hospice", :url => "www.ppwh.org.uk", :telephone => "0141 810 5169", :address_1 => "1616 Paisley Rd. West", :postcode => "G52 3QN", :contact => "Anne McBryan 0141 4295599", :email => "anne.mcbryan@ppwh.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Prince & Princess of Wales Hospice", :url => "www.ppwh.org.uk", :telephone => "0141 620 0044", :address_1 => "3 Kennishead Rd.", :postcode => "G46 8NY", :contact => "Anne McBryan 0141 4295599", :email => "anne.mcbryan@ppwh.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Ink Cartridges", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Radius Glasgow", :url => "www.radiusglasgow.org", :address_2 => "28-32 Epic House", :telephone => "07780 604031", :address_1 => "Rear Suite", :postcode => "G2 7LP", :contact => "Ms Hannah Clinch", :email => "hannah@radiusglasgow.org", :town => "Glasgow", :opening_times => "Mon-Fri 10-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Really Resourceful", :url => "www.reallyresourceful.co.uk/", :address_2 => "Parish Church", :telephone => "0141 942 6154/", :address_1 => "Bearsden Cross (nrth)", :postcode => "G61 4PP", :contact => "Ms Shiela Gillan", :email => "info@reallyresourceful.co.uk", :town => "Glasgow", :opening_times => "Thurs 10 - 2", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Textiles"])
    p.save

    p = Place.new(:about => '', :name => "Ruchill Furniture Project", :url => "www.morethanfurniture.org.uk", :address_3 => "89 Chapel St.", :address_2 => "Chapel St. Industrial Estate", :telephone => "0141 945 2746", :address_1 => "Unit 3", :postcode => "G20 9BD", :contact => "Mr Robert Montgomery", :email => "ruchfurn@yahoo.co.uk", :town => "Glasgow", :opening_times => "Mon to Fri 9.30-4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Small Electrical", "Large Furniture", "Large Electrical", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon 10-3, Tue toThur 10-4", :telephone => "0141 5500520", :postcode => "G31 1DL", :name => "S.P.U.C", :town => "Glasgow", :address_1 => "489 Duke St", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon toSat 9.30-4.30", :telephone => "0141 334 6259", :url => "www.savethechildren.org.uk", :postcode => "G12 8TS", :name => "Save The Children", :town => "Glasgow", :address_1 => "165 Byres Rd", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Scottish International Relief", :url => "www.sircharity.org", :address_2 => "Balmore Industrial Estate", :telephone => "0141 336 7094", :address_1 => "64-66 Glentanar Rd.", :postcode => "G22 7XS ", :contact => "Simon 01413368978", :email => "simon@sircharity.org?", :town => "Glasgow", :opening_times => "Mon to Fri 10-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Books/Music", "Textiles", "Large Furniture", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Scottish International Relief", :url => "www.sircharity.org", :telephone => "0141 554 0739", :address_1 => "364 Duke St.", :postcode => "G31 1RE", :contact => "Simon 01413368980", :email => "simon@sircharity.org?", :town => "Glasgow", :opening_times => "Mon to Fri 9- 5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Books/Music", "Textiles", "Large Furniture", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Second Opportunities", :url => "www.secondopportunities.org.uk", :address_2 => "302 Broomloan Rd.", :telephone => "0141 425 1177", :address_1 => "Ferguson House", :postcode => "G51 2JQ", :contact => "ken thompson", :email => "contact@newtwo.org.uk", :town => "Glasgow", :opening_times => "Mon to Thur 8.30-4.30, Fri 8.30 -4", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Small Electrical", "Large Furniture", "Large Electrical", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5", :contact => "gerry irvine 0141 3576930", :telephone => "0141 334 9675", :url => "www.sensescotland.org.uk", :postcode => "G11 6XE", :name => "Sense Scotland", :town => "Glasgow", :address_1 => "168 Dumbarton Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-6", :contact => "gerry irvine 0141 3576930", :telephone => "0141 551 9708", :url => "www.sensescotland.org.uk", :postcode => "G31 5BH", :name => "Sense Scotland", :town => "Glasgow", :address_1 => "30  Westmuir St.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Sense Scotland", :url => "www.sensescotland.org.uk", :address_2 => "35 Shandwick Square", :telephone => "0141 773 2900", :address_1 => "Easterhouse Shopping Centre", :postcode => "G34 9DT", :contact => "gerry irvine 0141 3576930", :town => "Glasgow", :opening_times => "Mon to Sat 9-7", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-8", :contact => "gerry irvine 0141 3576930", :telephone => "0141 649 0888", :url => "www.sensescotland.org.uk", :postcode => "G42 9XJ", :name => "Sense Scotland", :town => "Glasgow", :address_1 => "1109 Cathcart Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Sense Scotland", :url => "www.sensescotland.org.uk", :address_2 => "29 Castlemilk  Arcade", :telephone => "0141 631 4977", :address_1 => "The Braes Shopping Centre", :postcode => "G45 9AA", :contact => "gerry irvine 0141 3576930", :town => "Glasgow", :opening_times => "Mon to Sat 9-9", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 11-5", :telephone => "0141 423 5300", :postcode => "G42 8HD", :name => "Shad Human Relief", :town => "Glasgow", :address_1 => "296  Allison St.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5", :contact => "KATE MICKLE", :telephone => "0141 332 8505", :url => "www.scotland.shelter.org.uk", :postcode => "G4 9EJ", :name => "Shelter", :town => "Glasgow", :address_1 => "214 Great Western Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5", :contact => "KATE MICKLE", :telephone => "0141 357 4347", :url => "www.scotland.shelter.org.uk", :postcode => "G12 8RA", :name => "Shelter", :town => "Glasgow", :address_1 => "679 Great Western Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5", :contact => "MARY MCGLINCHY", :telephone => "0141 337 6387", :url => "www.scotland.shelter.org.uk", :postcode => "G11 6BE", :name => "Shelter", :town => "Glasgow", :address_1 => "391 Dumbarton Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Tues to Sat 10-3.30", :contact => "teresa mcgeagy", :telephone => "0141 552 1144", :url => "www.svp.org.uk", :postcode => "G1 5LD", :name => "Society Of St. Vincent de Paul", :town => "Glasgow", :address_1 => "94  Saltmarket", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Mobile Phones"])
    p.save

    p = Place.new(:about => '', :name => "Spruce Carpets", :url => "www.sprucecarpets.org.uk", :address_2 => "308 Broomloan Rd.", :telephone => "0141 425 1555", :address_1 => "Ferguson House", :postcode => "G51 2JQ", :contact => "Izzie Johnston", :email => "info@sprucecarpet.org.uk", :town => "Glasgow", :opening_times => "Mon to Thur 9-5, Fri 9-4.30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Carpet"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 9-5", :contact => "MR TOM WATT", :telephone => "0141 552 9387", :url => "www.smh.org.uk", :postcode => "G1 5HF", :name => "St. Margaret's Hospice", :town => "Glasgow", :address_1 => "175 Trongate", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Large Furniture", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Fri 10 till 4, Sat 10-1", :telephone => "0141 958 0959", :url => "www.smh.org.uk", :postcode => "G13 1LY", :name => "St. Margaret's Hospice", :town => "Glasgow", :address_1 => "804 Crow Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Sat 11-5", :telephone => "0141 954 9708", :url => "www.smh.org.uk", :postcode => "G14 0JX", :name => "St. Margaret's Hospice", :town => "Glasgow", :address_1 => "2346 Dumbarton Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Large Furniture", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "Starter Packs Glasgow", :url => "www.starterpacks.org.uk", :telephone => "0141 440 1008", :address_1 => "41 Burleigh St.", :postcode => "G51 3LA", :contact => "Ms Sarah Findlay", :email => "starterpacks@btopenworld.com", :town => "Glasgow", :opening_times => "Open for donations only Mon to Fri  9.30-3.30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac"])
    p.save

    p = Place.new(:about => '', :name => "The Appliance Outlet", :url => "www.ltes.org.uk/", :address_3 => "Maryhill Rd.", :address_2 => "Maryhill Shopping Centre", :telephone => "0141 946 1225, 01389 754 666", :address_1 => "Unit 13", :postcode => "G20 9SH", :email => "lindsayb@ltes.org.uk", :town => "Glasgow", :opening_times => "Mon to Sat, 9.15am - 5pm", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    p.save

    p = Place.new(:about => '', :name => "The Coach House Trust", :url => "www.thecht.co.uk", :address_2 => "84 Belmont Lane", :telephone => "0141 334 6888", :address_1 => "The Coach House", :postcode => "G12 8EN", :contact => "Mr David Cruickshank", :email => "info@thecht.co.uk", :town => "Glasgow", :opening_times => "Mon to Fri 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Wood"])
    p.save

    p = Place.new(:about => '', :opening_times => "Tue 10-4, Wed to Sat 10-6, Sun 12-5", :telephone => "0141 341 0993", :url => "www.thecht.co.uk/", :postcode => "G12 8EN", :name => "The Coach House Trust Shop", :town => "Glasgow", :address_1 => "518 Great Western Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    p.save

    p = Place.new(:about => '', :name => "The Common Wheel", :url => "www.commonwheel.org.uk", :telephone => "0141 946 0777", :address_1 => "53 Chapel St.", :postcode => "G20 9BD", :contact => "Mr nrman Armstrong", :email => "commonwheel@tiscali.co.uk", :town => "Glasgow", :opening_times => "Mon to Fri 10-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Bikes"])
    p.save

    p = Place.new(:about => '', :name => "The Common Wheel", :url => "www.commonwheel.org.uk", :telephone => "0141 944 9859", :address_1 => "100 Summerhill Rd.", :postcode => "G15 7JY", :contact => "Mr nrman Armstrong", :email => "commonwheel@tiscali.co.uk", :town => "Glasgow", :opening_times => "Mon to Fri 10-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Bikes"])
    p.save

    p = Place.new(:about => '', :name => "The Common Wheel", :url => "www.commonwheel.org.uk", :telephone => "0141 550 3854", :address_1 => "76-136 Fordneuk St.", :postcode => "G40 3AH", :contact => "Mr nrman Armstrong", :email => "commonwheel@tiscali.co.uk", :town => "Glasgow", :opening_times => "Mon to Fri 10-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Bikes"])
    p.save

    p = Place.new(:about => '', :name => "The Friends of Britannia Panopticon Shop", :url => "www.britanniapanpticon.org/", :telephone => "0141 552 4467", :address_1 => "49 High St.", :postcode => "G1 1LX", :contact => "Magda - shop manager", :email => "judith@britanniapanpticon.fsnet.co.uk", :town => "Glasgow", :opening_times => "Tues-Sat 10-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "IT Equipment", "Baby/Kids Wear", "Books/Music", "Small Electrical", "Ink Cartridges", "Carpet", "Large Furniture", "Bric-a-brac", "Clothing", "Small Furniture", "Bikes", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Tues-Fri 10-3:30, Sat 10-1", :contact => "liz benson", :telephone => "0141 944 9660", :postcode => "G15 6BS", :name => "The Friends of Veterans in Scotland", :town => "Glasgow", :address_1 => "41 Glenkirk Drive", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "The Hidden Gardens", :url => "www.thehiddengardens.org.uk", :address_2 => "25 Albert Drive", :telephone => "0141 433 2722", :address_1 => "Tramway", :postcode => "G41 2PE", :contact => "Ms Clementine Sandison", :email => "info@thehiddengardens.org.uk", :town => "Glasgow", :opening_times => "Oct-April: Tue-Sat 10-4, Sun12-4, May-Sept: Tue-Sat 10-8, Sun 12-6", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Environmental Organisation"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Fri 10-4, alternate Sat 10-12", :telephone => "0141 429 0130", :email => "JESSE PROVEN", :postcode => "G41 2NJ", :name => "The Local Charity Shop", :town => "Glasgow", :address_1 => "214 Albert Drive", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Fri 9-5", :telephone => "0141 339 8698, 07774 938478", :url => "www.thereclaimer.co.uk", :postcode => "G20 6HJ", :name => "The Reclaimer", :town => "Glasgow", :address_1 => "4 Holyrood Crescent", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Textiles", "Environmental Organisation"])
    p.save

    p = Place.new(:about => '', :name => "The Salvation Army", :url => "www.salvationarmy.org.uk", :telephone => "0141 334 7253", :address_1 => "91 Dumbarton Rd.", :postcode => "G11 6PW", :contact => "Denise - shop manager", :email => "please call Denise at the shop", :town => "Glasgow", :opening_times => "Mon-Sat 9-5.30", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Small Electrical", "Textiles", "Large Furniture", "Bric-a-brac", "Large Electrical", "Clothing", "Small Furniture", "Volunteering opportunities"])
    p.save

    p = Place.new(:about => '', :name => "The Wise Group - Getting into Recycling", :url => "www.thewisegroup.co.uk", :address_2 => "Larchgrove", :telephone => "0141 303 3131 ext. 3074", :address_1 => "1212 Edinburgh Rd.", :postcode => "G33 4EJ", :contact => "Ms Claire Roxburgh", :email => "alex_warren@thewisegroup.co.uk", :town => "Glasgow", :opening_times => "Mon to Fri 9-5", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Environmental Organisation"])
    p.save

    p = Place.new(:about => '', :opening_times => "Mon to Fri 11-4.30", :postcode => "G42 HAF", :name => "United As One", :town => "Glasgow", :address_1 => "1007 Cathcart Rd.", :category_id => Category.find(:first, :conditions => { :name => "Charity Shop"}).id)
    add_tags (p, [  "Baby/Kids Wear", "Books/Music", "Textiles", "Bric-a-brac", "Clothing", "Volunteering opportunities"])
    p.save
  end

  def self.down
    Place.delete(Place.find(:all))
  end
end
