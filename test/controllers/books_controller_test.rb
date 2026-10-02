require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create!(
      title: "Ruby入門",
      author: "山田太郎",
      price: 1800,
      published_on: Date.new(2026, 1, 1)
    )
  end

  test "renders the shared two-column layout and navigation" do
    get root_path

    assert_response :success
    assert_select "header.site-header"
    assert_select ".container > aside.sidebar"
    assert_select ".container > main.content"
    assert_select "footer.site-footer"
    assert_select "a[href=?]", books_path
    assert_select "a[href=?]", new_book_path
  end

  test "new and edit pages render the book form with named routes" do
    get new_book_path

    assert_response :success
    assert_select "form[action=?]", books_path
    assert_select "input[name=?]", "book[title]"
    assert_select "input[name=?]", "book[author]"
    assert_select "input[name=?]", "book[price]"
    assert_select "input[name=?]", "book[published_on]"

    get edit_book_path(@book)

    assert_response :success
    assert_select "form[action=?]", book_path(@book)
    assert_select "input[name='_method'][value='patch']"
    assert_select "input[name=?]", "book[title]"
    assert_select "input[name=?]", "book[author]"
    assert_select "input[name=?]", "book[price]"
    assert_select "input[name=?]", "book[published_on]"
  end
end
