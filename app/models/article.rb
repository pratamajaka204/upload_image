class Article < ApplicationRecord
	require 'csv'

	validates :title, presence: true
	validates :content, presence: true
	validates :status, presence: true

	dragonfly_accessor :image

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |articles|
	      csv << articles.attributes.values_at(*column_names)
	    end
	  end
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    	Article.create! row.to_hash
	    end
	end

	# def self.open_spreadsheet(file)
	#   case File.extname(file.original_filename)
	#   when ".csv" then Csv.new(file.path, nil, :ignore)
	#   when ".xls" then Excel.new(file.path, nil, :ignore)
	#   when ".xlsx" then Excelx.new(file.path, nil, :ignore)
	#   else raise "Unknown file type: #{file.original_filename}"
	#   end
	# end



end
