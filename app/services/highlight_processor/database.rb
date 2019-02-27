class HighlightProcessor::Database < HighlightProcessor
  def call
    results = []
    Highlight.near([lat, lon], radius, units: :km).find_each do |highlight|
      byebug
      results << HighlightStruct.new(name: highlight.name, lat: highlight.latitude, lon: highlight.longitude)
    end
    byebug
    results
  end
  puts "hello hello hello"
end
