require 'rubygems'
require 'open-uri'
require 'nokogiri'

module Abscss
  class Traverser
    def initialize
      @selectors = {}
    end

    def traverse(node,parent="")
      has_id = node.attributes['id']
      name_to_use = has_id ? "##{node.attributes['id'].value}" : node.name
      parent = "" if has_id
      @selectors[[parent,name_to_use].join(" ").strip] = 1 unless (node.text? or node.name == "meta" or node.name == "link" or node.name == "style" or node.name == "#cdata-section" or node.name == "head")
      if node.children.size > 0
        node.children.each do |child|
          traverse(child,[parent, name_to_use].join(" "))
        end
      end
    end

    def output
      @selectors.keys.collect do |selector|
        selector + " {}"
      end
    end
  end
end
