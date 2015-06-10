require 'test_helper'

class ProductTest < ActiveSupport::TestCase

fixtures :products
  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
	end

=begin
	test "product price must be positive" do
		product = Product.new(title:       "Myxwook Title",
		                      description: "yy",
		                      image_url:   "zz.jpg")
		product.price = -1
		assert product.invalid?
		assert_equal(product.errors[:price], product.price, ["must be greater than or equal to 0.01"])

		product.price = 0
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"], 
		  product.errors[:price]

		product.price = 1
		assert product.valid?
 	 end 
=end

  def new_product(image_url)
  	product = Product.new(title: "Title",
  	 description: "description", price: 1, 
  	 image_url: image_url)
  end

  test "image_url" do 
			 ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
		         http://a.b.c/x/y/z/fred.gif }
		bad = %w{ fred.doc fred.gif/more fred.gif.more }

		ok.each do |url|
			assert new_product(url).valid?, "#{url}should be valid"
		end

		bad.each do |url|
			assert new_product(url).invalid?, "#{url} shouldn't be valid"
		end
	end


	test "product is not unique" do
		product = Product.new(title: products(:ruby).title, 
			description: "yyy", price: 1, image_url: "url.gif")
		assert product.invalid?, "Title has already been taken"
	end



  
end
