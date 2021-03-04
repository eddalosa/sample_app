module StaticPagesHelper
	def blog_helper(index)
    @blogs = Blog.order('created_at DESC').first(1)
    @blog = @blogs.fetch(index, "No blog found")
  end

  def blog_title(index)
    @blogs = Blog.order('created_at DESC').first(1)
    if @blogs.any?
      @blog = @blogs.fetch(index, "No blog found")
      @blog.title
    end
  end

  def blog_text_teaser(index)
    @blogs = Blog.order('created_at DESC').first(4)
    if @blogs.any?
      @blog = @blogs.fetch(index, "No blog found")
      truncate(strip_tags(@blog.content.to_s), length: 300, separator: " ")
    end
  end
end
