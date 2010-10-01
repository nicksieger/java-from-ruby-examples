require 'java'
require 'flying_saucer'

java_import org.xhtmlrenderer.pdf.ITextRenderer

document = <<-HTML
<html><body><h1>Hello Flying Saucer!</h1></body></html>
HTML

File.open("doc.pdf", "wb") do |out|
  renderer = ITextRenderer.new
  renderer.set_document_from_string document
  renderer.layout
  renderer.create_pdf out.to_outputstream
end
