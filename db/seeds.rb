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
  name: "Annual Digital $60",
  period: "60 Every Year",
  validUntil: "",
  dis: "A year of content from the Wreckhouse Weekly Print edition",
  includes: "Automatically entered into all contest & promotions",
  foot: "Billed Anually. Taxes extra",
  cost: 60
}, {
  name: "6-Month Digital",
  period: "5 Every Month",
  validUntil: "6 months",
  dis: "All content from the Wreckhouse Weekly print edition",
  includes: "Automatically entered into all contest & promotions",
  foot: "Billed Anually. Taxes extra",
  cost: 5
},
 {
  name: "3-Month Digital",
  period: "5 Every Month",
  dis: "All content from the Wreckhouse Weekly print edition.",
  validUntil: "3 months",
  includes: "Automatically entered into all contest & promotions",
  foot: "Billed Anually. Taxes extra",
  cost: 5

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
       puts art.photos.length
    end
  

    two.each do |cc|
  # sub_cat = nil
  categorization = Categorization.find_by(name: cc[:categorization])
  array = cc[:body].split(/\n+/)

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
  puts art.photos.length
end
three.each do |cc|
  # sub_cat = nil
  categorization = Categorization.find_by(name: cc[:categorization])
  array = cc[:body].split(/\n+/)

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
  puts "#{fallback_imgs}"
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
  # puts art.photos.length
end
    
    
    
    
    puts 'done'
    
    
    
    # two.each do|cc|
    #   # sub_cat = nil 
    #   # @categorization = Categorization.find_by(name: cc[:categorization])
    #   array = cc[:body].split(/\n+/)
    #   puts ""
    #   # puts "date:#{cc[:originalPost]}---title:#{cc[:title]}----author:#{cc[:author]}----cat:#{cc[:categorization]}--sub:#{cc[:subcategorization]}----body:#{array.length}"
    #   puts "title:#{cc[:title]} body:#{array.length}--"
     
    #   puts ""

    # end
    # three.each do|cc|
    #   # sub_cat = nil 
    #   # @categorization = Categorization.find_by(name: cc[:categorization])
    #   array = cc[:body].split(/\n+/)
    #   puts ""
    #   # puts "date:#{cc[:originalPost]}---title:#{cc[:title]}----author:#{cc[:author]}----cat:#{cc[:categorization]}--sub:#{cc[:subcategorization]}----body:#{array.length}"
    #   puts "title:#{cc[:title]} body:#{array.length}--"

    # end




  