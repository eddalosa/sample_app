module StaticPagesHelper
	def blog_helper(index)
    @blogs = Blog.order('created_at DESC').first(1)
    @blog = @blogs.fetch(index)
  end

  def blog_title(index)
    @blogs = Blog.order('created_at DESC').first(1)
    @blog = @blogs.fetch(index)
    @blog.title
  end

  def blog_text_teaser(index)
    @blogs = Blog.order('created_at DESC').first(4)
    @blog = @blogs.fetch(index)
    truncate(strip_tags(@blog.content.to_s), length: 300, separator: " ")
  end
end
