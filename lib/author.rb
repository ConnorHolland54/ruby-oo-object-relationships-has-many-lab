
class Author
    attr_accessor :name

    @@authors = []

    def initialize(name)
        @name = name
        @@authors << self
    end

    def add_post(post)
        post.author = self
    end

    def add_post_by_title(title)
        new_post = Post.new(title)
        new_post.author = self
    end

    def posts
        Post.all.select { |post| post.author == self}
    end

    def self.post_count
        count = 0
        @@authors.each do |author|
            count += author.posts.length
        end
        count
    end

end