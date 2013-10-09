#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
Product.delete_all
Product.create(:title => 'Broccoli',
  :description => 'green broccoli',
  :brand => 'Sunny Farms',
  :image_url =>   'images/broccoli.jpg',
  :price => 2.95,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 1,
  :not_for_sale => 0)
# . . .
Product.create(:title => 'Bread',
  :description => 'Fresh baked',
  :brand => 'Sunny Farms',
  :image_url => 'images/bread.jpg',
  :price => 3.50,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 0,
  :not_for_sale => 0)
# . . .
Product.create(:title => 'Bell Peppers',
  :description => '3 colors',
  :brand => 'Sunny Farms',
  :image_url => 'images/bellPepper.jpg',
  :price => 2.75,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 1,
  :not_for_sale => 0)
 # . . .
 Product.create(:title => 'Cabbage',
  :description => 'Great for coleslaw',
  :brand => 'Sunny Farms',
  :image_url => 'images/cabbage.jpg',
  :price => 4,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 1,
  :not_for_sale => 0)
 # . . .
 Product.create(:title => 'Butter Lettuce',
  :description => 'Great for coleslaw',
  :brand => 'Sunny Farms',
  :image_url => 'images/butterLettuce.jpg',
  :price => 4,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 1,
  :not_for_sale => 0)
 # . . .
 Product.create(:title => 'Cheddar',
  :description => 'Great for coleslaw',
  :brand => 'Sunny Farms',
  :image_url => 'images/cheddar.jpg',
  :price => 4,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 0,
  :not_for_sale => 0)
 # . . .
 Product.create(:title => 'Chile Peppers',
  :description => 'Great for coleslaw',
  :brand => 'Sunny Farms',
  :image_url => 'images/chilePepper.jpg',
  :price => 4,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 1,
  :not_for_sale => 0)
 # . . .
 Product.create(:title => 'Savoy Cabbage',
  :description => 'Great for coleslaw',
  :brand => 'Sunny Farms',
  :image_url => 'images/savoyCabbage.jpg',
  :price => 4,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 1,
  :not_for_sale => 0)
 # . . .
 Product.create(:title => 'Smart Bacon',
  :description => 'Great for coleslaw',
  :brand => 'Sunny Farms',
  :image_url => 'images/SmartBacon.jpg',
  :price => 4,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 0,
  :not_for_sale => 0)
 # . . .
 Product.create(:title => 'Spinach',
  :description => 'Great for coleslaw',
  :brand => 'Sunny Farms',
  :image_url => 'images/spinach.jpg',
  :price => 4,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 1,
  :not_for_sale => 0)
 # . . .
 Product.create(:title => 'Delivery Fee SM',
  :description => 'Delivery Fee SM',
  :brand => 'none',
  :image_url => 'images/noImage2.jpg',
  :price => 10,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 0,
  :not_for_sale => 1)
 # . . .
Product.create(:title => 'Delivery Fee LG',
  :description => 'Delivery Fee LG',
  :brand => 'none',
  :image_url => 'images/noImage2.jpg',
  :price => 15,
  :portion_size => 1,
  :unit_of_measure => 'ea',
  :scalable => 0,
  :not_for_sale => 1)
 # . . .