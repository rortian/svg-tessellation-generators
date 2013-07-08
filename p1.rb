#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "p1 general"
    end
    body do
      svg do
        defs do
          g :id => "tile" do
            circle :r => "13",:fill => "rgb(68,77,97)",:cx => "20",:cy => "20"
            circle :r => "6",:fill => "rgb(254,241,174)",:cx => "-5",:cy => "17"
            circle :r => "8",:fill => "rgb(231,206,143)",:cx => "53",:cy => "16"
            circle :r => "7",:fill => "rgb(222,144,60)",:cx => "42",:cy => "31"
          end
        end
        x1, y1 =  75, 10
        x2, y2 = -30, 30
        ((-1)..5).each do |m|
          ((-1)..5).each do |n|
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
