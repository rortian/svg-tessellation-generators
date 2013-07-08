#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "p6m"
    end
    body do
      svg do
        defs do
          g :id => "starter",:"stroke-width" => "0" do
            circle :cx => "388", :cy => "214", :r => "33", :fill => "rgb(0,44,67)"
            circle :cx => "330", :cy => "230", :r => "18", :fill => "rgb(52,123,146)"
            circle :cx => "295", :cy => "238", :r => "9", :fill => "rgb(0,63,122)"
            circle :cx => "398", :cy => "175", :r => "6", :fill => "rgb(0,63,122)"
            circle :cx => "430", :cy => "240", :r => "8", :fill => "rgb(52,123,146)"
            circle :cx => "275", :cy => "243", :r => "5", :fill => "rgb(0,44,67)"
          end
          g :id => "reflected" do
            use :"xlink:href" => "#starter"
            use :"xlink:href" => "#starter", :transform => "translate(0,250) matrix(1,0,0,-1,0,0) translate(0,-250)"
          end
          g :id => "tile" do
            use :"xlink:href" => "#reflected"
            use :"xlink:href" => "#reflected", :transform => "rotate(60,250,250)"
            use :"xlink:href" => "#reflected", :transform => "rotate(120,250,250)"
            use :"xlink:href" => "#reflected", :transform => "rotate(180,250,250)"
            use :"xlink:href" => "#reflected", :transform => "rotate(240,250,250)"
            use :"xlink:href" => "#reflected", :transform => "rotate(300,250,250)"
          end
        end
        x1, y1 =  0, 346.4102
        x2, y2 = 300, 173.2051
        ((-2)..2).each do |m|
          ((-2)..2).each do |n|
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
