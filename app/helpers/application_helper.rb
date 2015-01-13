module ApplicationHelper

  def full_title(page_title = '')
    base_title = "The Bike Detective'"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def default_meta_tags
    {
        title: 'The Bike Detective',
        description:'Search and compare pricing on thousands of cycling products from all the top brands, in one place',
        keywords: %w[Cycling, product, search, comparison, find]
    }
  end

end

