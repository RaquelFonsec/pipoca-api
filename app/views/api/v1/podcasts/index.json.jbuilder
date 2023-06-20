json.array! @podcasts, partial: 'podcast', as: :podcast
json.extract! podcast, :id, :title, :description
json.extract! @podcast, :id, :name, :description

json.comments @podcast.comments do |comment|
  json.extract! comment, :id, :content
end
