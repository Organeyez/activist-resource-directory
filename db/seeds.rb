Category.destroy_all
User.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["Mental Health & Psychology", "Labor & Economics", "Politics", "History", "Laws & The Constitution", "Schools & Education", "Legal Support", "Fundraising", "Technology", "Medicine", "Environmental Science & Issues", "Gender", "Sexuality", "Organization Building", "Transportation", "Finance", "Business", "Family & Parenting", "Housing", "Personal Development", "Spirituality" " Religion", "Scholarships", "Miscellaneous", "International Affairs", "Trafficking", "Criminal Justice", "Prisons", "War on Drugs", "Race & Ethnicity", "Global Poverty", "Health Care", "Child Labor", "Economic Justice", "U.S. Poverty", "HIV/AIDS", "Immigration", "Wars in the Middle East", "U.S. Military Activities & Spending", "Debt", "Water", "Food Justice", "Civil Rights & Discrimination", "Government Spending", "Humanitarian Crises", "Slavery", "Constructive Engagement of Conflict" ]

categories.each do |category|
	Category.create(title: category)
end

user = User.create(username: "cosmosiris", email: "ikn02010@gmail.com", password: "123456", admin: true)

user.posted_resources.create(title: "Labour trafficking: Challenges and opportunities from an occupational health perspective", description: " Summary points 1)Labour trafficking is intrinsically related to occupational health; however, very little attention has been paid to the issue from an occupational health perspective. 2)The recognition of certain work-related health problems in workers in specific work sectors can help to identify victims of labour trafficking. 3)This essay identifies a series of opportunities for occupational health services to detect and address labour trafficking and increase health personnel awareness of the problem", url: "http://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1002440", category_id: 1 ) 