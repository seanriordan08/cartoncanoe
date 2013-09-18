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
Product.create(:title => 'Web Design for Developers',
  :description => 'green broccoli',
  :brand => 'Sunny Farms',
  :image_url =>   'images/broccoli.jpg',
  :price => 2.95,
  :portion_size => 1,
  :unit_of_measure => 'ea')
# . . .
Product.create(:title => 'Bread',
  :description => 'Fresh baked',
  :brand => 'Sunny Farms',
  :image_url => 'images/bread.jpg',
  :price => 3.50,
  :portion_size => 1,
  :unit_of_measure => 'ea')
# . . .

Product.create(:title => 'Bell Peppers',
  :description => '3 colors',
  :brand => 'Sunny Farms',
  :image_url => 'images/bellPepper.jpg',
  :price => 2.75,
  :portion_size => 1,
  :unit_of_measure => 'ea')