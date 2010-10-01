import org.jruby.embed.ScriptingContainer;
import org.jruby.embed.EmbedEvalUnit;

public class EmbedMultiple { public static void main(String[] args) {
ScriptingContainer container = new ScriptingContainer();

// import org.jruby.embed.EmbedEvalUnit;
EmbedEvalUnit unit = container.parse("'Ruby' * @times");
container.put("@times", 2);
System.out.println(unit.run()); // RubyRuby
container.put("@times", 4);
System.out.println(unit.run()); // RubyRubyRubyRuby
}}