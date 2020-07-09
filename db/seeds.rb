# (mock data for my program)

# ------------------ Users ------------------ 

# ------------------  Local businesses ------------------ 
peace_coffee = User.create(name: "Peace Coffee", description: "A bean roastery and local coffee chain that supports the Institute for Agriculture and Trade Policy.", email: "peacecoffee@gmail.com", password: "coffeebean")

rabbit_hole = User.create(name: "The Rabbit Hole", description: "A Korean Alice in Wonderland inspired restaurant.", email: "therabbithole@gmail.com", password: "koreanfood")

wild_rumpus = User.create(name: "Wild Rumpus", description: "A children's bookstore that lives the stories it sells.", email: "wildrumpus@gmail.com", password: "readmorebooks")

# ------------------ Local non-profits ------------------ 
neighborhood_house = User.create(name: "Neighborhood House", description: "We are a multi-service agency, providing wrap-around services for people when they need it most.", email: "neighborhoodhouse@gmail.com", password: "goodneighbor")

fin = User.create(name: "Friends In Need", description: "Provide food and resources to those in need.", email: "fin@gmail.com", password: "friends")

salvation_army = User.create(name: "The Salvation Army Saint Paul", description: "Wherever there is a need in western Saint Paul, you'll find the Salvation Army.", email: "salvationarmy@gmail.com", password: "lovepeople")

# ------------------ Projects ------------------ 
Project.create(title: "Social Media", image_url: "https://images.pexels.com/photos/683039/pexels-photo-683039.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260", information: "REMOTE: Peace Coffee would love help for setting up a Facebook page to showcase online menu and pickup/delivery options.", user_id: peace_coffee.id)

Project.create(title: "Online Order", image_url: "https://images.pexels.com/photos/891393/pexels-photo-891393.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", information: "REMOTE: Rabbit Hole would appreciate help for setting up online order and delivery on the website.", user_id: rabbit_hole.id)

Project.create(title: "Book Organizer", image_url: "https://images.pexels.com/photos/1370298/pexels-photo-1370298.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260", information: "IN-PERSON: Wild Rumpus is looking for 2 volunteers to help organizing books and managing new pickup option.", user_id: wild_rumpus.id)

Project.create(title: "Food Bank", image_url: "https://images.pexels.com/photos/2387343/pexels-photo-2387343.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260", information: "IN-PERSON: Neighborhood House needs 15 volunteers to help food distribution.", user_id: neighborhood_house.id)

Project.create(title: "Produce Giveaway", image_url: "https://images.pexels.com/photos/890507/pexels-photo-890507.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260", information: "IN-PERSON: Friends In Need is looking for help to collect and giveaway produce.", user_id: fin.id)

Project.create(title: "Inventory Management", image_url: "https://images.pexels.com/photos/6335/man-coffee-cup-pen.jpg?auto=compress&cs=tinysrgb&h=750&w=1260", information: "REMOTE: The Salvation Army Saint Paul is seeking a volunteer to help set up inventory management online.", user_id: salvation_army.id)