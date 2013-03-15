#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "cmm"
    end
    body do
      svg :width => "100%", :height => "100%" do
        defs do
          g :id => "quarter" do
            g :id => "three-fourths" do
              rect :x => "25", :y => "0", :width => "25", :height => "40", :fill => "rgb(175,64,42)"
              rect :x => "0", :y => "0", :width => "25", :height => "60", :fill => "rgb(0,166,206)"
              rect :x => "50", :y => "0", :width => "25", :height => "20", :fill => "rgb(266,179,34)"
              polygon :points => "50,20 75,20 50,40", :fill => "rgb(0,166,206)"
              polygon :points => "25,40 50,40 25,60", :fill => "rgb(266,179,34)"
              polygon :points => "0,60 25,60 0,80", :fill => "rgb(175,64,42)"
            end
            use :"xlink:href" => "#three-fourths", :transform => "translate(75) scale(0.25)"
            use :"xlink:href" => "#three-fourths", :transform => "translate(93.75) scale(0.0625)"
            polygon :points => "98.4375,0 100,0 98.4375,1.25", :fill => "rgb(175,64,42)"
          end
          g :id => "half" do
            use :"xlink:href" => "#quarter"
            use :"xlink:href" => "#quarter", :transform => "matrix(-1,0,0,1,0,0)"
          end
          g :id => "tile" do
            use :"xlink:href" => "#half"
            use :"xlink:href" => "#half", :transform => "matrix(1,0,0,-1,0,0)"
          end
        end
        x1, y1 =  100,80
        x2, y2 = 100, -80
        ((-10)..15).each do |m|
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
