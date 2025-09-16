# :nodoc:
class Inflector
  UNCOUNTABLE = [
    "aircraft",
    "bellows",
    "bison",
    "deer",
    "equipment",
    "fish",
    "hovercraft",
    "information",
    "jeans",
    "means",
    "measles",
    "money",
    "moose",
    "news",
    "pants",
    "police",
    "rice",
    "series",
    "sheep",
    "spacecraft",
    "species",
    "swine",
    "tights",
    "tongs",
    "trousers",
  ]

  private def self.irregular_rules
    [
      {/(alumn|cact|fung|radi|stimul|syllab)i/i, "\\1us"},
      {/(alg|antenn|amoeb|larv|vertebr)ae/i, "\\1a"},
      {/^(gen)era$/i, "\\1us"},
      {/(pe)ople/i, "\\1rson"},
      {/^(zombie)s$/i, "\\1"},
      {/(g)eese/i, "\\1oose"},
      {/(criteri)a/i, "\\1on"},
      {/^(m)en$/i, "\\1an"},
      {/^(echo)es/i, "\\1"},
      {/^(hero)es/i, "\\1"},
      {/^(potato)es/i, "\\1"},
      {/^(tomato)es/i, "\\1"},
      {/^(t)eeth/i, "\\1ooth"},
      {/^(l)ice$/i, "\\1ouse"},
      {/^(addend|bacteri|curricul|dat|memorand|quant)a$/i, "\\1um"},
      {/^(di)ce/i, "\\1e"},
      {/^(f)eet/i, "\\1oot"},
      {/^(phenomen)a/i, "\\1on"},
    ]
  end

  private def self.plural_irregular_rules
    [
      {/(alumn|cact|fung|radi|stimul|syllab)us/i, "\\1i"},
      {/(alg|antenn|amoeb|larv|vertebr)a/i, "\\1ae"},
      {/^(gen)us$/i, "\\1era"},
      {/(pe)rson$/i, "\\1ople"},
      {/^(zombie)s$/i, "\\1"},
      {/(g)oose$/i, "\\1eese"},
      {/(criteri)on/i, "\\1a"},
      {/^(men)$/i, "\\1"},
      {/^(women)/i, "\\1"},
      {/^(echo)$/i, "\\1es"},
      {/^(hero)$/i, "\\1es"},
      {/^(potato)/i, "\\1es"},
      {/^(tomato)/i, "\\1es"},
      {/^(t)ooth$/i, "\\1eeth"},
      {/^(l)ouse$/i, "\\1ice"},
      {/^(addend|bacteri|curricul|dat|memorand|quant)um$/i, "\\1a"},
      {/^(di)e$/i, "\\1ce"},
      {/^(f)oot$/i, "\\1eet"},
      {/^(phenomen)on/i, "\\1a"},
    ]
  end

  private def self.singular_rules
    irregular_rules + [
      {/(child)ren/i, "\\1"},
      {/(wo|sea)men$/i, "\\1man"},
      {/^(m|l)ice$/i, "\\1ouse"},
      {/(bus|canvas|status|alias)(es)?$/i, "\\1"},
      {/(ss)$/i, "\\1"},
      {/(database)s$/i, "\\1"},
      {/([ti])a$/i, "\\1um"},
      {/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$/i, "\\1sis"},
      {/(analy)(sis|ses)$/i, "\\1sis"},
      {/(octop|vir)i$/i, "\\1us"},
      {/(hive)s$/i, "\\1"},
      {/(tive)s$/i, "\\1"},
      {/(er)ves$/i, "\\1ve"},
      {/([lora])ves$/i, "\\1f"},
      {/([^f])ves$/i, "\\1fe"},
      {/([^aeiouy]|qu)ies$/i, "\\1y"},
      {/(m)ovies$/i, "\\1ovie"},
      {/(x|ch|ss|sh)es$/i, "\\1"},
      {/(shoe)s$/i, "\\1"},
      {/(o)es$/i, "\\1"},
      {/s$/i, ""},
    ]
  end

  private def self.plural_rules
    plural_irregular_rules + [
      {/(child)$/i, "\\1ren"},
      {/(m)an$/i, "\\1en"},
      {/(m|l)ouse/i, "\\1ice"},
      {/(database)s$/i, "\\1"},
      {/(quiz)$/i, "\\1zes"},
      {/^(ox)$/i, "\\1en"},
      {/(matr|vert|ind)ix|ex$/i, "\\1ices"},
      {/(x|ch|ss|sh)$/i, "\\1es"},
      {/([^aeiouy]|qu)y$/i, "\\1ies"},
      {/(hive)$/i, "\\1s"},
      {/(sc[au]rf)$/i, "\\1s"},
      {/(?:([^f])fe|((hoo)|([lra]))f)$/i, "\\2\\1ves"},
      {/sis$/i, "ses"},
      {/([ti])um$/i, "\\1a"},
      {/(buffal|tomat)o$/i, "\\1oes"},
      {/(octop|vir)us$/i, "\\1i"},
      {/(bus|alias|status|canvas)$/i, "\\1es"},
      {/(ax|test)is$/i, "\\1es"},
      {/s$/i, "s"},
      {/data$/i, "data"},
      {/$/i, "s"},
    ]
  end

  def self.pluralize(word : String) : String
    if UNCOUNTABLE.includes?(word)
      word
    else
      rule = plural_rules.find { |regex, replacement| regex.match(word) }
      if rule
        regex, replacement = rule
        word.gsub(regex, replacement)
      else
        word + "s"
      end
    end
  end

  def self.singularize(word : String) : String
    if UNCOUNTABLE.includes?(word)
      word
    else
      rule = singular_rules.find { |regex, replacement| regex.match(word) }
      if rule
        regex, replacement = rule
        word.gsub(regex, replacement)
      else
        if word.ends_with?("s")
          word[0..-2]
        else
          word
        end
      end
    end
  end
end
