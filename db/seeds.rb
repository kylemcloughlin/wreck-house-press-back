# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = [{name: 'Top Story'},{name: 'Local News'},{name: 'Sports'},{name: 'Opinion'},{name: 'Community'},{name: 'The Arts'}]
cats.each do |cat|
  Categorization.create(cat)
end
@catagorie_1 = Categorization.find_by( name: 'Opinion')
@catagorie_2 = Categorization.find_by( name: "Community")
@catagorie_3 = Categorization.find_by( name: "The Arts")

puts @catagorie_1
puts @catagorie_2
puts @catagorie_3

sub_cats = [{ name: "Letters", categorization: @catagorie_1 }, 
  { name: "Columnists", categorization: @catagorie_1 },  
  { name: "Profile", categorization: @catagorie_2 }, 
{ name: "Music Row", categorization: @catagorie_3 }, 
{ name: "On The Bookshelf", categorization: @catagorie_3 }]

 limpson = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque id ligula et dolor pulvinar sodales at vitae nisl. Integer condimentum est eget commodo posuere. Aenean non arcu sed tellus dapibus tincidunt ut vel est. Proin nec massa ipsum. Praesent id odio vel lectus facilisis molestie. Mauris malesuada est et bibendum placerat. Donec in commodo diam. Maecenas posuere sed nibh at imperdiet. Pellentesque interdum vel enim sit amet dictum.

Nam sodales, quam at varius euismod, purus turpis lacinia sapien, a fermentum enim erat vel velit. Vivamus et maximus orci. Nunc tempor, nibh nec maximus mollis, tellus mi egestas mauris, vitae pharetra leo turpis ac orci. Phasellus laoreet, nibh sed ultrices tristique, metus orci ultricies sem, ut tincidunt velit velit ut eros. Sed tortor augue, volutpat at vehicula et, dignissim in ipsum. Morbi quis magna orci. Mauris pharetra vehicula quam, in accumsan arcu volutpat nec. Nunc rutrum rhoncus nisl, vel mattis nibh malesuada quis. Nulla nisi nisl, scelerisque vitae sollicitudin quis, hendrerit a ipsum. Nulla gravida finibus purus a mollis. Morbi nec turpis et ipsum laoreet tempor a in eros. Suspendisse potenti. Nam pharetra porttitor purus, sit amet rutrum velit congue id. Nullam elementum bibendum sapien ut mattis.

Praesent ornare et ante eu porta. Praesent blandit, justo eu condimentum aliquet, nisi metus dignissim metus, ut ultrices nisi ligula vitae dolor. Morbi consequat lectus nulla, id molestie metus imperdiet a. Maecenas at odio velit. Quisque vulputate rhoncus justo ut consectetur. Morbi bibendum vitae velit in tempor. Integer ut risus at neque porta porta sed eget dui. Duis egestas rutrum vehicula. Integer sodales sed purus id dictum.

Sed quis turpis rhoncus, vulputate nisi at, dictum turpis. Nullam lobortis viverra velit, eu euismod mauris ornare vitae. Ut id rutrum nisi. Donec non felis purus. Proin laoreet scelerisque risus porta blandit. In sollicitudin tincidunt tincidunt. Quisque at interdum augue. Curabitur ullamcorper viverra ex eu auctor. Vestibulum at tempus arcu. Fusce sem arcu, tincidunt a dolor sed, porttitor sollicitudin eros.

In tempor dui nec turpis rhoncus, sit amet aliquet justo venenatis. Sed feugiat dictum nibh in tincidunt. Integer facilisis lorem a nibh porttitor, eget ornare magna euismod. Aliquam porta augue id lacus convallis lacinia. Sed sit amet faucibus dui. In nisl nibh, iaculis a dui at, vestibulum pretium justo. Donec pharetra ac dolor consectetur hendrerit."
puts sub_cats[3]
sub_cats.each do |sub_cat|
  cat = sub_cat[:categorization][:name]
  ouput = Subcategorization.create(sub_cat)
  puts ouput
end
articles = [{
  title: 'article 1',
  subtitles: 'yej',
  author: 'kyle m',
  photos: 'https://lh3.googleusercontent.com/nTDB1oJoZo9xJKH0IwJ8mOekj_Y7aInpE_9k6l67YojNRELVFa7oYHXIozkENgm2-YBPYNyO0IjTixJSIRKpCQceItwVk-d_ChkZSwuqrZwazN_3Hua8--gEZ8EiIFCeFIBN970Xx99oQHhb6Lpsz1FA7LNXtUp3S4z3cA42NJPS_0OhFUmAV9oopHOejFZHsOYo6mhd5OAvTfhDbYCpInb1Zpq-aDeKgxNZDDdcrgH2n8JJfC31w6XK_awdEVuJp7F2RHYjbYV9MnTTjhwMcfyt4YjSx_4F32J_ukiq7qc9hb49t-HPTtygiESWpV5qB0qLd01Xytl8vP0OukZaR8RpVgbNaDL8b8KTtcJUNF50jQ9eauI1bSwUmQrx3TX_kEFB2Bn6nfAelk46BXNmxuMsh2W4a9Tbhr7BF158xOMDuI_-3u093KJqsL69iC4UWJYdQZi_UX8pMHPepoftltjpZfLsJ7KEaRzyzhGtJNjTIDINTZe5DCKptXf2FPWx-LY8_YJU5y27uRQQicBL0DYiO5F5kvnio7mKUUSn7WZjYBB2K2s9SGT2iWu_hgR6jDm38w2I-CtloeNB8Z_gIjMuQ5Y4fO783IrezZYpJV8MikTdg8hOQiLjWPyy_oE55f9-_vVdTxpJ7K39Wk4RXr9QvO5Nx80iVuncWKyRfT36gQjCrH0UmGZj-da1=w901-h504-no?authuser=0',
  body: limpson,
  categorization: cats[1][:name],
  subcategorization: sub_cats[1][:name],
}, {
  title: "article 2 ",
  subtitles: "yej",
  author: "kyle m",
  photos: "",
  body: limpson,
   categorization: cats[1][:name],
  subcategorization: sub_cats[1][:name],
},{
  title: "article 3 ",
  subtitles: "yej",
  author: "kyle m",
   photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

}, 
{
  title: "article 4 ",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
    categorization: cats[1][:name],
  subcategorization: sub_cats[1][:name],
},
{
  title: "article 5 ",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},{
  title: 'article 6',
  subtitles: 'yej',
  author: 'kyle m',
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]
}, {
  title: "article 7",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},{
  title: "article 8",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

}, 
{
  title: "article 9",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},
{
  title: "article 10",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},{
  title: 'article 11',
  subtitles: 'yej',
  author: 'kyle m',
  photos: nil,
  body: limpson,
    categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]
}, {
  title: "article 12",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},{
  title: "article 13",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]
}, 
{
  title: "article 14",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},
{
  title: "article 15 ",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},{
  title: 'article 16 ',
  subtitles: 'yej',
  author: 'kyle m',
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]
}, {
  title: "article 17",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},{
  title: "article 18",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

}, 
{
  title: "article 19",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},
{
  title: "article 20",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: limpson,
   categorization: cats[1][:name],
  subcategorization: sub_cats[1][:name]

},{
  title: 'article 21',
  subtitles: 'yej',
  author: 'kyle m',
  photos: nil,
  body: 'sksks',
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]
}, {
  title: "article 22",
  subtitles: "yej",
  author: "kyle m",
   photos: nil,
  body: 'sksks',
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},{
  title: "article 23",
  subtitles: "yej",
  author: "kyle m",
   photos: nil,
  body: 'sksks',
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

}, 
{
  title: "article 24",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: 'sksks',
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

},
{
  title: "article 25",
  subtitles: "yej",
  author: "kyle m",
  photos: nil,
  body: 'sksks',
   categorization: cats[1][:name],
   subcategorization: sub_cats[1][:name]

}]
articles.each do |art|
  cat = Categorization.find_by(name: art[:categorization])
  sub_cat = art[:subcategorization]
 if sub_cat 
 sub_cat = Subcategorization.find_by(name: sub_cat)
 else
 sub_cat = nil
 end
  Article.create({
    title: art[:title],
    subtitles: art[:subtitles],
    author: art[:author],
    body: art[:body],
    photos: art[:photos],
    categorization: cat,
    subcategorization: sub_cat
  })

end

puts 'done'