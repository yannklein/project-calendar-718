require 'erb'
require 'json'
require 'ostruct'
require 'date'

def generate(data_path, template_path, output_path)
  template = File.read(template_path)
  data = OpenStruct.new(JSON.parse(File.read(data_path)))
  # add the date to each day
  sunday_added = 0
  data['career_days'].each.with_index do |day, index|
    sunday_added += 1 if index != 0 && (index % 3).zero?
    day['date'] = Date.parse(data['start']) + index * 2 + sunday_added
  end
  # Demo day is always on Friday's
  data['career_days'].last['date'] -= 1
  generated = ERB.new(template).result(data.instance_eval { binding })
  File.write(output_path, generated)
end
