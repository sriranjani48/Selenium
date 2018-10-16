require_relative 'amazon.rb'
require 'test/unit'

class TestWebsite < Test::Unit::TestCase
	def test_case1_given_Home_page_title_should_return_true
		assert_equal(true, AmazonWebsite.new.home_page_title("Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more"))
	end
	def test_case2_given_Home_page_title_should_return_false
		assert_equal(false, AmazonWebsite.new.home_page_title("Amazon.com"))
	end

	def test_case3_after_searching_Books_from_search_field_should_return_Amazon_com_Books_Books_as_title
		assert_equal(true, AmazonWebsite.new.title_of_the_page_searched("Amazon.com: Books: Books"))
	end
	def test_case4_after_searching_Books_from_search_field_should_not_return_Amazon_com_Books_Books_as_title
		assert_equal(false, AmazonWebsite.new.title_of_the_page_searched("Books"))
	end

	def test_case5_return_true_if_title_of_the_book_selected_page_equal_to_actual_title
		assert_equal(true, AmazonWebsite.new.title_of_the_book_selected_page("Amazon Books Editors @ Amazon.com"))
	end
	def test_case6_return_false_if_title_of_the_book_selected_page_equal_to_actual_title
		assert_equal(false, AmazonWebsite.new.title_of_the_book_selected_page("Amazon Books Editors"))
	end

	def test_case7_return_true_if_title_of_the_adding_to_cart_page_equal_to_actual_title
		assert_equal(true, AmazonWebsite.new.title_of_the_book_selected_page("Amazon Books Editors @ Amazon.com"))
	end
	def test_case8_return_false_if_title_of_the_adding_to_cart_page_equal_to_actual_title
		assert_equal(false, AmazonWebsite.new.title_of_the_book_selected_page("Amazon Books"))
	end

	def test_case9_return_true_if_account_signin_page_title_equal_to_actual_title
		assert_equal(true, AmazonWebsite.new.title_of_the_signin_account_page("Amazon Sign In"))
	end
	def test_case9_return_false_if_account_signin_page_title_equal_to_actual_title
		assert_equal(false, AmazonWebsite.new.title_of_the_signin_account_page("Sign In"))
	end
	
end
