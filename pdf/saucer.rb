require 'java'
HERE = File.dirname(__FILE__)
puts "I'm here: #{HERE}"
Dir["#{HERE}/*.jar"].each do |jar| 
  puts "Requiring #{jar}"
  require jar
end

java_import org.xhtmlrenderer.pdf.ITextRenderer

document = <<-HTML
<html><body><h1>Hello JRubyConf!</h1></body></html>
HTML

File.open("doc.pdf", "wb") do |out|
  renderer = ITextRenderer.new
  renderer.set_document_from_string document
  renderer.layout
  renderer.create_pdf out.to_outputstream
end
