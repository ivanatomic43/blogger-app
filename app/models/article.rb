class Article < ApplicationRecord
    after_initialize :set_default

    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings
    has_attached_file :image, :styles => {:medium => "200x200>", :thumb => "100x100>"}
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"] 
    belongs_to :author

    def tag_list
        self.tags.collect do |tag|
            tag.name
        end.join(", ")
    end

    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect{ |name| Tag.find_or_create_by(name: name)}
        self.tags = new_or_found_tags
    end

    def set_default
        self.status ||= "Draft"
    end

end
