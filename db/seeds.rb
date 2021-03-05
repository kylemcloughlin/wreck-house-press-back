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
    puts"#{cc[:title]}" 
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
      art =Article.create({
        title: cc[:title],
        subtitles: cc[:subtitles],
        author: cc[:author],
        body: array,
        photos: cc[:photos],
        originalPost: cc[:originalPost],
        legacy: cc[:legacy],
        categorization: categorization,
        subcategorization: sub_cat,
      })
        puts art.id
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
  art = Article.create({
    title: cc[:title],
    subtitles: cc[:subtitles],
    author: cc[:author],
    body: array,
    photos: cc[:photos],
    originalPost: cc[:originalPost],
    legacy: cc[:legacy],
    categorization: categorization,
    subcategorization: sub_cat,
  })
  puts art.id
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
  art = Article.create({
    title: cc[:title],
    subtitles: cc[:subtitles],
    author: cc[:author],
    body: array,
    photos: cc[:photos],
    originalPost: cc[:originalPost],
    legacy: cc[:legacy],
    categorization: categorization,
    subcategorization: sub_cat,
  })
  puts art.id
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