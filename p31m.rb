#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "p31m"
    end
    body do
      svg do
        defs do
          g :id => "sixth" do
            circle :r => "35",:fill => "rgb(179,197,197)",:cx => "275",:cy => "200"
            circle :r => "18",:fill => "rgb(113,68,62)",:cx => "345",:cy => "220"
            circle :r => "13",:fill => "rgb(193,176,113)",:cx => "390",:cy => "235"
            circle :r => "23",:fill => "rgb(230,205,122)",:cx => "219",:cy => "145"
          end
          g :id => "third" do
            use :"xlink:href" => "#sixth"
            use :"xlink:href" => "#sixth", :transform => "translate(150,76.7949) matrix(0.5,0.866,0.866,-0.5,0,0) translate(-150,-76.7949)"
          end
          g :id => "tile" do
            use :"xlink:href" => "#third"
            use :"xlink:href" => "#third",:transform => "rotate(120,250,250)"
            use :"xlink:href" => "#third",:transform => "rotate(240,250,250)"
          end
        end
        x1, y1 =  0, 346.4102
        x2, y2 = 300, 173.2051
        ((-15)..15).each do |m|
          ((-10)..20).each do |n|
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
