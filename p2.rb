#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "p2"
    end
    body do
      svg do
        defs do
          g :id => "half" do
            circle :cx => "250", :cy => "165", :r => "40", :fill => "rgb(250,114,54)"
            circle :cx => "300", :cy => "220", :r => "27", :fill => "rgb(0,149,159)"
            circle :cx => "210", :cy => "100", :r => "19", :fill => "rgb(112,199,212)"
          end
          g :id => "tile" do
            use :"xlink:href" => "#half"
            use :"xlink:href" => "#half", :transform => "rotate(180,300,163.39745)"
          end
        end
        x1, y1 =  300, 173.2051
        x2, y2 = 200, 0
        ((-15)..20).each do |m|
          ((-15)..20).each do |n|
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
