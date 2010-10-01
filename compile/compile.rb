require 'java'
java_package 'demo'

class Engine
  java_implements 'java.lang.Runnable'

  java_signature 'void run()'
  def run
    puts "The #{self.inspect} is running."
  end
end
