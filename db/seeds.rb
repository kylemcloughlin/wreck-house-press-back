require_relative 'seed_data.rb'
require_relative 'seed_data_two.rb'
require_relative "seed_data_three.rb"

# require_relative 'file1.rb'

@articles = Article.destroy_all
@Subcategorization = Subcategorization.destroy_all
@Categorization = Categorization.destroy_all


one = get_seed_one
two = get_seed_two
three = get_seed_three
opts = [{
  name: "Annual Digital",
  period: "60 Every Year",
  validUntil: "",
  dis: "A year of content from the Wreckhouse Weekly Print edition",
  includes: "Automatically entered into all contest & promotions",
  foot: "Billed Anually. Taxes extra",
  cost: 60,
  stripe: "price_1IYJ2cHPabCG8MNSGty3kbpf"
}, {
  name: "6-Month Digital",
  period: "5 Every Month",
  validUntil: "6 months",
  dis: "All content from the Wreckhouse Weekly print edition",
  includes: "Automatically entered into all contest & promotions",
  foot: "Billed Anually. Taxes extra",
  cost: 5,
   stripe: "price_1IYJ2cHPabCG8MNSGty3kbpf"
},
 {
  name: "3-Month Digital",
  period: "5 Every Month",
  dis: "All content from the Wreckhouse Weekly print edition.",
  validUntil: "3 months",
  includes: "Automatically entered into all contest & promotions",
  foot: "Billed Anually. Taxes extra",
  cost: 5,
   stripe: "price_1IYJ0wHPabCG8MNS8Uj8BvGy"

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
  
  puts sub_cats[3]
  sub_cats.each do |sub_cat|
    # cat = sub_cat[:categorization][:name]
    @subcategorization = Subcategorization.create(sub_cat)
    # puts ouput
  end
  


    one.each do|cc|
      # sub_cat = nil

      categorization = Categorization.find_by(name: cc[:categorization])
      array = cc[:body].split(/\n+/)
        # puts cc[:title]
      if cc[:title].match(/Roz/)
        puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Columnists"
      end
      if cc[:title].match(/Cooking/)
        puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Columnists"
      end
      if cc[:title].match(/seniors/)
        puts cc[:title]
          cc[:categorization] = "Community"
          cc[:subcategorization] = "Profile"
      end
      if cc[:title].match(/Highlights/)
        puts cc[:title]
      end
      if cc[:title].match(/Author profile/)
        puts cc[:title]
          cc[:categorization] = "Community"
          cc[:subcategorization] = "Profile"
      end
      if cc[:title].match(/Horoscopes/)
        puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Columnists"
      end
      if cc[:title].match(/to the editor/)
        puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Letters"
      end
      if cc[:title].match(/From the editor's desk/)
        puts cc[:title]
        cc[:categorization] = "Opinion"
        cc[:subcategorization] = "Columnists"
      end
      if cc[:title].match(/On the Bookshelf/)
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
  puts "   "
  puts cc[:title]
  puts cc[:categorization]
  puts cc[:subcategorization]
  puts "   " 
      art =Article.create({
        title: cc[:title],
        subtitles: cc[:subtitles],
        author: cc[:author],
        body: array,
        photos: cc[:photos],
        fallback: fallback_imgs,
        originalPost: cc[:originalPost],
        legacy: cc[:legacy],
        categorization: categorization,
        subcategorization: sub_cat,
      })
    end
  

    two.each do |cc|
  # sub_cat = nil
  categorization = Categorization.find_by(name: cc[:categorization])
  array = cc[:body].split(/\n+/)

    if cc[:title].match(/Roz/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if cc[:title].match(/Cooking/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if cc[:title].match(/seniors/)
      puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if cc[:title].match(/neighbour:/)
      puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if cc[:title].match(/Music Row/)
      puts cc[:title]
      cc[:categorization] = "The Arts"
      cc[:subcategorization] = "Music Row"
    end
    if cc[:title].match(/Author profile/)
      puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if cc[:title].match(/Horoscopes/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if cc[:title].match(/to the editor/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Letters"
    end
    if cc[:title].match(/From the editor's desk/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if cc[:title].match(/On the Bookshelf/)
      puts cc[:title]
      cc[:categorization] = "The Arts"
      cc[:subcategorization] = "On The Bookshelf"
    end
if cc[:title].match(/Letter/)
  puts cc[:title]
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
puts "   "
puts cc[:title]
puts cc[:categorization]
puts cc[:subcategorization]
puts "   "

  art = Article.create({
    title: cc[:title],
    subtitles: cc[:subtitles],
    author: cc[:author],
    body: array,
    photos: cc[:photos],
    fallback: fallback_imgs,
    originalPost: cc[:originalPost],
    legacy: cc[:legacy],
    categorization: categorization,
    subcategorization: sub_cat,
  })
end
three.each do |cc|
  # sub_cat = nil
  categorization = Categorization.find_by(name: cc[:categorization])
  array = cc[:body].split(/\n+/)

   if cc[:title].match(/Roz/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if cc[:title].match(/Cooking/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if cc[:title].match(/seniors/)
      puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if cc[:title].match(/neighbour:/)
      puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if cc[:title].match(/Music Row/)
      puts cc[:title]
      cc[:categorization] = "The Arts"
      cc[:subcategorization] = "Music Row"
    end
    if cc[:title].match(/Author profile/)
      puts cc[:title]
        cc[:categorization] = "Community"
        cc[:subcategorization] = "Profile"
    end
    if cc[:title].match(/Horoscopes/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if cc[:title].match(/Letter/)
  puts cc[:title]
  cc[:categorization] = "Opinion"
  cc[:subcategorization] = "Letters"
end
    if cc[:title].match(/to the editor/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Letters"
    end
    if cc[:title].match(/From the editor/)
      puts cc[:title]
      cc[:categorization] = "Opinion"
      cc[:subcategorization] = "Columnists"
    end
    if cc[:title].match(/On the Bookshelf/)
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
  puts "   "
puts cc[:title]
puts cc[:categorization]
puts cc[:subcategorization]
puts "   "
  art = Article.create({
    title: cc[:title],
    subtitles: cc[:subtitles],
    author: cc[:author],
    body: array,
    fallback: fallback_imgs,
    photos: cc[:photos],
    originalPost: cc[:originalPost],
    legacy: cc[:legacy],
    categorization: categorization,
    subcategorization: sub_cat,
  })
end
    
    
    
    
    puts 'done'
    
   


  