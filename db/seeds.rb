require_relative 'seed_data.rb'
require_relative 'seed_data_two.rb'
require_relative "seed_data_three.rb"
require_relative "seed_data_four.rb"
require_relative 'user_seed.rb'

@articles = Article.destroy_all
@Subcategorization = Subcategorization.destroy_all
@Categorization = Categorization.destroy_all







one = get_seed_one
two = get_seed_two
three = get_seed_three
four = get_seed_four
users =  get_users


users.each do |x|
  expiry = nil
  if x[:expiry_date]
    xp = x[:expiry_date]

    if xp == "annual"
      expiry = xp
    else
      puts "hit"
      xp = xp.split("/")

      expiry = [xp[2], xp[1], xp[0]]
      expiry = expiry.join("/")
      puts expiry
    end
 raw = RawUser.create!({
      email: x[:email],
      expiry: expiry,
      token: nil,

    })
  
    puts raw
  
  end
end





opts = [{
  name: "Annual Digital",
  period: "60 Dollars Yearly",
  validUntil: "",
  dis: "A year of content from the Wreckhouse Weekly Print edition",
  includes: "Automatically entered into all contest & promotions",
  foot: "Billed Anually. Taxes extra",
  cost: 60,
  stripe: "price_1IdzU5FLIGg7N7ZVvr1o4zaB"
}, {
  name: "6-Month Digital",
  period: "5 Dollars Monthly",
  validUntil: "6 months",
  dis: "All content from the Wreckhouse Weekly print edition",
  includes: "Automatically entered into all contest & promotions",
  foot: "Billed Anually. Taxes extra",
  cost: 5,
   stripe: "price_1IdzVwFLIGg7N7ZVCNQJ4sQE"
},
 {
  name: "3-Month Digital",
  period: "5 Dollars Monthly",
  dis: "All content from the Wreckhouse Weekly print edition.",
  validUntil: "3 months",
  includes: "Automatically entered into all contest & promotions",
  foot: "Billed Anually. Taxes extra",
  cost: 5,
   stripe: "price_1IdzXrFLIGg7N7ZVPujKXYay"

}]


opts.each do |opt|
  Subscription.create(opt)
end
cats = [{name: 'Top Story'},{name: 'Local News'},{name: 'Sports'},{name: 'Opinion'},{name: 'Community'},{name: 'The Arts'}]
cats.each do |cat|
  Categorization.create(cat)
end
@catagorie_1 = Categorization.find_by( name: 'Opinion')
@catagorie_2 = Categorization.find_by( name: "Community")
@catagorie_3 = Categorization.find_by( name: "The Arts")



sub_cats = [{ name: "Letters", categorization: @catagorie_1 }, 
  { name: "Columnists", categorization: @catagorie_1 },  
  { name: "Profile", categorization: @catagorie_2 }, 
  { name: "Music Row", categorization: @catagorie_3 }, 
  { name: "On The Bookshelf", categorization: @catagorie_3 }]
  
  # puts sub_cats[3]
  sub_cats.each do |sub_cat|
    # cat = sub_cat[:categorization][:name]
    @subcategorization = Subcategorization.create(sub_cat)
    # puts ouput
  end
  

puts 'start'
    one.each do|cc|
      # sub_cat = nil

      categorization = Categorization.find_by(name: cc[:categorization])
      array = cc[:body].split(/\n+/)
      downcase_title = cc[:title].downcase
      
        # puts cc[:title]
      if downcase_title.match(/roz/)
        # puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Columnists"
      end
      if downcase_title.match(/cooking/)
        # puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Columnists"
      end
      if downcase_title.match(/seniors/)
        # puts cc[:title]
          cc[:categorization] = "Community"
          cc[:subcategorization] = "Profile"
      end
      if downcase_title.match(/highlights/)
        # puts cc[:title]
      end
      if downcase_title.match(/author profile/)
        # puts cc[:title]
          cc[:categorization] = "Community"
          cc[:subcategorization] = "Profile"
      end
      if downcase_title.match(/horoscopes/)
        # puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Columnists"
      end
      if downcase_title.match(/to the editor/)
        # puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Letters"
      end
      if downcase_title.match(/from the editor's desk/)
        # puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Columnists"
      end
      if downcase_title.match(/on the bookshelf/)
        puts cc[:title]
        cc[:categorization] = "The Arts"
        cc[:subcategorization] = "On The Bookshelf"
      end
      case cc[:categorization]

      when "Opinion"
        # puts "#{cat[:name]}"
        sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
      when "The Arts"
        # puts "#{cat[:name]}"
        sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
        # puts "Better luck next time"
      when "Community"
        sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
        # puts "You can do better"
      else
        # puts "Alternative grading system, eh?"
        sub_cat = nil
      end
      

      photos =  cc[:photos]
  fallback_imgs = []
  photos.each do |photo|

    splt = photo.split(".")
    splt.pop
    splt.push("jpg")
    nw = splt.join(".")

  fallback_imgs.push(nw)

  end
 length = Article.count
y = cc[:title].split(" ")

 x = y.select { |v| v != "-"}
 xx = x.select { |v| v != "&"}
# puts xx
z = xx.push(length).join("-").downcase
url = z.tr("(-).',?><!@{$%^&*}:#", "")
  
      art =Article.create({
        title: cc[:title],
        subtitles: cc[:subtitles],
        author: cc[:author],
        body: array,
        breaking: false,
        photos: cc[:photos],
        fallback: fallback_imgs,
        originalPost: cc[:originalPost],
        legacy: cc[:legacy],
        url: url,
        rt: "5",
        categorization: categorization,
        subcategorization: sub_cat,
      })
        puts ""
puts "#{art.url}"
  puts ""

# puts "#{art.url}"

    end
  

    two.each do |cc|
  # sub_cat = nil
  categorization = Categorization.find_by(name: cc[:categorization])
  array = cc[:body].split(/\n+/)
  downcase_title = cc[:title].downcase
    if downcase_title.match(/roz/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/cooking/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/seniors/)
      # puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if downcase_title.match(/neighbour:/)
      # puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if downcase_title.match(/Music Row/)
      # puts cc[:title]
      cc[:categorization] = "The Arts"
      cc[:subcategorization] = "Music Row"
    end
    if downcase_title.match(/author profile/)
      # puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if downcase_title.match(/horoscopes/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/to the editor/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Letters"
    end
    if downcase_title.match(/from the editor's desk/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/on the bookshelf/)
      # puts cc[:title]
      cc[:categorization] = "The Arts"
      cc[:subcategorization] = "On The Bookshelf"
    end
if downcase_title.match(/letter/)
  # puts cc[:title]
  cc[:categorization] = "Opinion"
  cc[:subcategorization] = "Letters"
end



  case cc[:categorization]
  when "Opinion"
    # puts "#{cat[:name]}"
    sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
  when "The Arts"
    # puts "#{cat[:name]}"
    sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
    # puts "Better luck next time"
  when "Community"
    sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
    # puts "You can do better"
  else
    # puts "Alternative grading system, eh?"
    sub_cat = nil
  end
photos = cc[:photos]
fallback_imgs = []
photos.each do |photo|
  splt = photo.split(".")
  splt.pop
  splt.push("jpg")
  nw = splt.join(".")

  fallback_imgs.push(nw)
end


length = Article.count
y = cc[:title].split(" ")
x = y.select { |v| v != "-" }
 xx = x.select { |v| v != "&"}

z = xx.push(length).join("-").downcase
url = z.tr("(-).',?><!@{$%^&*}:#", "")
  art = Article.create({
    title: cc[:title],
    subtitles: cc[:subtitles],
    author: cc[:author],
    body: array,
    breaking: false,
    photos: cc[:photos],
    fallback: fallback_imgs,
    originalPost: cc[:originalPost],
    legacy: cc[:legacy],
    url: url,
    rt: "7",
    categorization: categorization,
    subcategorization: sub_cat,
  })
  puts ""
puts "#{art.url}"
  puts ""

end
three.each do |cc|
  # sub_cat = nil
  categorization = Categorization.find_by(name: cc[:categorization])
  array = cc[:body].split(/\n+/)
  downcase_title = cc[:title].downcase

   if downcase_title.match(/roz /)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/cooking/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/seniors/)
      # puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if downcase_title.match(/neighbour:/)
      # puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if downcase_title.match(/music row/)
      # puts cc[:title]
      cc[:categorization] = "The Arts"
      cc[:subcategorization] = "Music Row"
    end
    if downcase_title.match(/author profile/)
      # puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if downcase_title.match(/horoscopes/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/letter/)
  # puts cc[:title]
  cc[:categorization] = "Opinion"
  cc[:subcategorization] = "Letters"
end
    if downcase_title.match(/to the editor/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Letters"
    end
    if downcase_title.match(/from the editor/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/on the bookshelf/)
      # puts cc[:title]
      cc[:categorization] = "The Arts"
      cc[:subcategorization] = "On The Bookshelf"
    end  
  case cc[:categorization]
  when "Opinion"
    # puts "#{cat[:name]}"
    sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
  when "The Arts"
    # puts "#{cat[:name]}"
    sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
    # puts "Better luck next time"
  when "Community"
    sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
    # puts "You can do better"
  else
    # puts "Alternative grading system, eh?"
    sub_cat = nil
  end
  # puts "#{cc[:photos]}"
  photos =  cc[:photos]
  fallback_imgs = []
  photos.each do |photo|

    splt = photo.split(".")
    splt.pop
    splt.push("jpg")
    nw = splt.join(".")

  fallback_imgs.push(nw)

  end

length = Article.count
y = cc[:title].split(" ")
x = y.select { |v| v != "-" }
 xx = x.select { |v| v != "&"}
z = xx.push(length).join("-").downcase!
url = z.tr("(-).',?><!@{$%^&*}:#", "")
  art = Article.create({
    title: cc[:title],
    subtitles: cc[:subtitles],
    author: cc[:author],
    body: array,
    fallback: fallback_imgs,
    photos: cc[:photos],
    breaking: false,
    originalPost: cc[:originalPost],
    legacy: cc[:legacy],
    url: url,
    rt: "4",
    categorization: categorization,
    subcategorization: sub_cat,
  }
  )
    puts ""
puts "#{art.url}"
  puts ""

end
    
four.each do |cc|
  # sub_cat = nil
  categorization = Categorization.find_by(name: cc[:categorization])
  array = cc[:body].split(/\n+/)
  downcase_title = cc[:title].downcase
   if downcase_title.match(/roz /)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/cooking with/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/seniors/)
      # puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if downcase_title.match(/neighbour:/)
      # puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if downcase_title.match(/music Row/)
      # puts cc[:title]
      cc[:categorization] = "The Arts"
      cc[:subcategorization] = "Music Row"
    end
    if downcase_title.match(/author profile/)
      # puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if downcase_title.match(/horoscopes/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/letter/)
  # puts cc[:title]
  cc[:categorization] = "Opinion"
  cc[:subcategorization] = "Letters"
end
    if downcase_title.match(/to the editor/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Letters"
    end
    if downcase_title.match(/from the editor/)
      # puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if downcase_title.match(/on the bookshelf/)
      # puts cc[:title]
      cc[:categorization] = "The Arts"
      cc[:subcategorization] = "On The Bookshelf"
    end  
  case cc[:categorization]
  when "Opinion"
    # puts "#{cat[:name]}"
    sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
  when "The Arts"
    # puts "#{cat[:name]}"
    sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
    # puts "Better luck next time"
  when "Community"
    sub_cat = Subcategorization.find_by(name: cc[:subcategorization])
    # puts "You can do better"
  else
    # puts "Alternative grading system, eh?"
    sub_cat = nil
  end
  # puts "#{cc[:photos]}"
  photos =  cc[:photos]
  fallback_imgs = []
  photos.each do |photo|

    splt = photo.split(".")
    splt.pop
    splt.push("jpg")
    nw = splt.join(".")

  fallback_imgs.push(nw)

  end

length = Article.count
y = cc[:title].split(" ")
x = y.select { |v| v != "-" }
 xx = x.select { |v| v != "&"}
z = xx.push(length).join("-").downcase()
url = z.tr("(-).',?><!@{$%^&*}:#", "")
# puts "#{url}"
  art = Article.create({
    title: cc[:title],
    subtitles: cc[:subtitles],
    author: cc[:author],
    body: array,
    fallback: fallback_imgs,
    photos: cc[:photos],
    breaking: false,
    originalPost: cc[:originalPost],
    legacy: cc[:legacy],
    rt: cc[:rt],
    url: url,
    categorization: categorization,
    subcategorization: sub_cat,
  })
  puts ""
puts "#{art.url}"
  puts ""

end
    
    
 




    puts 'done'
    
   


  