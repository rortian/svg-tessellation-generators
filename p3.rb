#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "p3"
    end
    body do
      svg do
        defs do
          g :id => "tile" do
            g :id => "one" do
              circle :r => "65",:fill => "rgb(161,17,53)",:cx => "300",:cy => "151"
              circle :r => "45",:fill => "rgb(197,107,35)",:cx => "235",:cy => "125"
              circle :r => "35",:fill => "rgb(77,8,103)",:cx => "380",:cy => "210"
              circle :r => "29",:fill => "rgb(53,58,144)",:cx => "270",:cy => "220"
            end
            use :"xlink:href" => "#one",:transform => "rotate(120,250,250)"
            use :"xlink:href" => "#one",:transform => "rotate(240,250,250)"
          end
        end
        x1, y1 =  0, 346.4102
        x2, y2 = 300, 173.2051
        ((-10)..10).each do |m|
          ((-10)..10).each do |n|
            x_delta = m*x1 + n*x2
            y_delta = m*y1 + n*y2
            use :"xlink:href" => "#tile",:transform => "translate(#{x_delta},#{y_delta})"
          end
        end
      end
    end
  end

end

out = File.new('output.html','w')
out.puts html.doc.to_html
out.close
