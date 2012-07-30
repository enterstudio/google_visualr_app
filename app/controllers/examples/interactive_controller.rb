class Examples::InteractiveController < ApplicationController

  layout "default"

  # http://code.google.com/apis/chart/interactive/docs/gallery/annotatedtimeline.html#Example
  def annotated_time_line

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('date'  , 'Date')
    data_table.new_column('number', 'Sold Pencils')
    data_table.new_column('string', 'title1')
    data_table.new_column('string', 'text1' )
    data_table.new_column('number', 'Sold Pens'   )
    data_table.new_column('string', 'title2')
    data_table.new_column('string', 'text2' )
    data_table.add_rows( [
      [ Date.parse("2008-2-1"), 30000, '', '', 40645, '', ''],
      [ Date.parse("2008-2-2"), 14045, '', '', 20374, '', ''],
      [ Date.parse("2008-2-3"), 55022, '', '', 50766, '', ''],
      [ Date.parse("2008-2-4"), 75284, '', '', 14334, 'Out of Stock','Ran out of stock on pens at 4pm'],
      [ Date.parse("2008-2-5"), 41476, 'Bought Pens','Bought 200k pens', 66467, '', ''],
      [ Date.parse("2008-2-6"), 33322, '', '', 39463, '', '']
    ] )

    opts   = { :displayAnnotations => true }
    @chart = GoogleVisualr::Interactive::AnnotatedTimeLine.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/areachart.html#Example
  def area_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')
    data_table.add_rows( [
      ['2004', 1000, 400],
      ['2005', 1170, 460],
      ['2006', 660, 1120],
      ['2007', 1030, 540]
    ])

    opts   = { width: 400, height: 240, title: 'Company Performance', hAxis: {title: 'Year', titleTextStyle: {color: '#FF0000'}} }
    @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/barchart.html#Example
  def bar_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, '2004')
    data_table.set_cell(0, 1, 1000)
    data_table.set_cell(0, 2, 400)
    data_table.set_cell(1, 0, '2005')
    data_table.set_cell(1, 1, 1170)
    data_table.set_cell(1, 2, 460)
    data_table.set_cell(2, 0, '2006')
    data_table.set_cell(2, 1, 660)
    data_table.set_cell(2, 2, 1120)
    data_table.set_cell(3, 0, '2007')
    data_table.set_cell(3, 1, 1030)
    data_table.set_cell(3, 2, 540)

    opts   = { :width => 400, :height => 240, :title => 'Company Performance', vAxis: {title: 'Year', titleTextStyle: {color: 'red'}} }
    @chart = GoogleVisualr::Interactive::BarChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/bubblechart.html
def bubble_chart

  data_table = GoogleVisualr::DataTable.new
  data_table.new_column('string', 'ID')
  data_table.new_column('number', 'Life Expectancy')
  data_table.new_column('number', 'Fertility Rate')
  data_table.new_column('string', 'Region')
  data_table.new_column('number', 'Population')
  data_table.add_rows( [
    ['CAN',    80.66,              1.67,      'North America',  33739900],
    ['DEU',    79.84,              1.36,      'Europe',         81902307],
    ['DNK',    78.6,               1.84,      'Europe',         5523095],
    ['EGY',    72.73,              2.78,      'Middle East',    79716203],
    ['GBR',    80.05,              2,         'Europe',         61801570],
    ['IRN',    72.49,              1.7,       'Middle East',    73137148],
    ['IRQ',    68.09,              4.77,      'Middle East',    31090763],
    ['ISR',    81.55,              2.96,      'Middle East',    7485600],
    ['RUS',    68.6,               1.54,      'Europe',         141850000],
    ['USA',    78.09,              2.05,      'North America',  307007000]
  ])

  opts    = {
     :width => 800, :height => 500,
     :title => 'Correlation between life expectancy, fertility rate and population of some world countries (2010)',
     :hAxis => { :title => 'Life Expectancy' },
     :vAxis => { :title => 'Fertility Rate'  },
     :bubble => { :textStyle => { :fontSize => 11 } }
   }
   @chart = GoogleVisualr::Interactive::BubbleChart.new(data_table, opts)

end

  # http://code.google.com/apis/chart/interactive/docs/gallery/candlestickchart.html
  def candlestick_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'day')
    data_table.new_column('number', 'min')
    data_table.new_column('number', 'opening')
    data_table.new_column('number', 'closing')
    data_table.new_column('number', 'max')
    data_table.add_rows( [
      ['Mon',20,28,38,45],
      ['Tue',31,38,55,66],
      ['Wed',50,55,77,80],
      ['Thu',50,77,66,77],
      ['Fri',15,66,22,68]
    ] )

    opts   = { :width => 400, :height => 240, :legend => 'none' }
    @chart = GoogleVisualr::Interactive::CandlestickChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/columnchart.html#Example
  def column_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, '2004')
    data_table.set_cell(0, 1, 1000)
    data_table.set_cell(0, 2, 400)
    data_table.set_cell(1, 0, '2005')
    data_table.set_cell(1, 1, 1170)
    data_table.set_cell(1, 2, 460)
    data_table.set_cell(2, 0, '2006')
    data_table.set_cell(2, 1, 660)
    data_table.set_cell(2, 2, 1120)
    data_table.set_cell(3, 0, '2007')
    data_table.set_cell(3, 1, 1030)
    data_table.set_cell(3, 2, 540)

    opts   = { :width => 400, :height => 240, :title => 'Company Performance', :hAxis => { :title => 'Year', :titleTextStyle => {:color => 'red'} } }
    @chart = GoogleVisualr::Interactive::ColumnChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/combochart.html
  def combo_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'month'       )
    data_table.new_column('number', 'Bolivia'     )
    data_table.new_column('number', 'Ecuador'     )
    data_table.new_column('number', 'Madagascar'  )
    data_table.new_column('number', 'Papua Guinea')
    data_table.new_column('number', 'Rwanda'      )
    data_table.new_column('number', 'Avarage'     )
    data_table.add_rows( [
      ['2004/05', 165, 938  , 522, 998  , 450, 614.6],
      ['2005/06', 135, 1120 , 599, 1268 , 288, 682  ],
      ['2006/07', 157, 1167 , 587, 807  , 397, 623  ],
      ['2007/08', 139, 1110 , 615, 968  , 215, 609.4],
      ['2008/09', 136, 691  , 629, 1026 , 366, 569.6]
    ] )

    opts   = { :width => 700, :height => 400, :title => 'Monthly Coffee Production by Country', :vAxis => {:title => 'Cups'}, :hAxis => {:title => 'Month'}, :seriesType => 'bars', :series => {'5' => {:type => 'line'}} }
    @chart = GoogleVisualr::Interactive::ComboChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/gauge.html#Example
  def gauge

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string'  , 'Label')
    data_table.new_column('number'  , 'Value')
    data_table.add_rows(3)
    data_table.set_cell(0, 0, 'Memory' )
    data_table.set_cell(0, 1, 80)
    data_table.set_cell(1, 0, 'CPU'    )
    data_table.set_cell(1, 1, 55)
    data_table.set_cell(2, 0, 'Network')
    data_table.set_cell(2, 1, 68)

    opts   = { :width => 400, :height => 120, :redFrom => 90, :redTo => 100, :yellowFrom => 75, :yellowTo => 90, :minorTicks => 5 }
    @chart = GoogleVisualr::Interactive::Gauge.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/geochart.html#Example
  def geo_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Country')
    data_table.new_column('number', 'Popularity')
    data_table.add_rows(6)
    data_table.set_cell(0, 0, 'Germany')
    data_table.set_cell(0, 1, 200)
    data_table.set_cell(1, 0, 'United States')
    data_table.set_cell(1, 1, 300)
    data_table.set_cell(2, 0, 'Brazil')
    data_table.set_cell(2, 1, 400)
    data_table.set_cell(3, 0, 'Canada')
    data_table.set_cell(3, 1, 500)
    data_table.set_cell(4, 0, 'France')
    data_table.set_cell(4, 1, 600)
    data_table.set_cell(5, 0, 'RU')
    data_table.set_cell(5, 1, 700)

    opts   = { :width => 500, :height => 300 }
    @chart = GoogleVisualr::Interactive::GeoChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/geomap.html#Example
  def geo_map

    # Regions Example
    data_table_regions = GoogleVisualr::DataTable.new
    data_table_regions.new_column('string'  , 'Country'   )
    data_table_regions.new_column('number'  , 'Popularity')
    data_table_regions.add_rows(6)
    data_table_regions.set_cell(0, 0, 'Germany'      )
    data_table_regions.set_cell(0, 1, 200)
    data_table_regions.set_cell(1, 0, 'United States')
    data_table_regions.set_cell(1, 1, 300)
    data_table_regions.set_cell(2, 0, 'Brazil'       )
    data_table_regions.set_cell(2, 1, 400)
    data_table_regions.set_cell(3, 0, 'Canada'       )
    data_table_regions.set_cell(3, 1, 500)
    data_table_regions.set_cell(4, 0, 'France'       )
    data_table_regions.set_cell(4, 1, 600)
    data_table_regions.set_cell(5, 0, 'RU'           )
    data_table_regions.set_cell(5, 1, 700)

    opts   = { :dataMode => 'regions' }
    @chart_regions = GoogleVisualr::Interactive::GeoMap.new(data_table_regions, opts)

    # Markers Example
    data_table_markers = GoogleVisualr::DataTable.new
    data_table_markers.new_column('string'  , 'Country'   )
    data_table_markers.new_column('number'  , 'Popularity')
    data_table_markers.add_rows(6)
    data_table_markers.set_cell(0, 0, 'New York'     )
    data_table_markers.set_cell(0, 1, 200)
    data_table_markers.set_cell(1, 0, 'Boston'       )
    data_table_markers.set_cell(1, 1, 300)
    data_table_markers.set_cell(2, 0, 'Miami'        )
    data_table_markers.set_cell(2, 1, 400)
    data_table_markers.set_cell(3, 0, 'Chicago'      )
    data_table_markers.set_cell(3, 1, 500)
    data_table_markers.set_cell(4, 0, 'Los Angeles'  )
    data_table_markers.set_cell(4, 1, 600)
    data_table_markers.set_cell(5, 0, 'Houston'      )
    data_table_markers.set_cell(5, 1, 700)

    opts   = { :dataMode => 'markers', :region => 'US', :colors => ['0xFF8747', '0xFFB581', '0xc06000'] }
    @chart_markers = GoogleVisualr::Interactive::GeoMap.new(data_table_markers, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/intensitymap.html
  def intensity_map

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', '', 'Country')
    data_table.new_column('number', 'Population (mil)', 'a')
    data_table.new_column('number', 'Area (km2)'      , 'b')
    data_table.add_rows(5)
    data_table.set_cell(0, 0, 'CN')
    data_table.set_cell(0, 1, 1324)
    data_table.set_cell(0, 2, 9640821)
    data_table.set_cell(1, 0, 'IN')
    data_table.set_cell(1, 1, 1133)
    data_table.set_cell(1, 2, 3287263)
    data_table.set_cell(2, 0, 'US')
    data_table.set_cell(2, 1, 304 )
    data_table.set_cell(2, 2, 9629091)
    data_table.set_cell(3, 0, 'ID')
    data_table.set_cell(3, 1, 232 )
    data_table.set_cell(3, 2, 1904569)
    data_table.set_cell(4, 0, 'BR')
    data_table.set_cell(4, 1, 187 )
    data_table.set_cell(4, 2, 8514877)

    opts   = {}
    @chart = GoogleVisualr::Interactive::IntensityMap.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/linechart.html#Example
  def line_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', 'Sales')
    data_table.new_column('number', 'Expenses')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, '2004')
    data_table.set_cell(0, 1, 1000)
    data_table.set_cell(0, 2, 400)
    data_table.set_cell(1, 0, '2005')
    data_table.set_cell(1, 1, 1170)
    data_table.set_cell(1, 2, 460)
    data_table.set_cell(2, 0, '2006')
    data_table.set_cell(2, 1, 860)
    data_table.set_cell(2, 2, 580)
    data_table.set_cell(3, 0, '2007')
    data_table.set_cell(3, 1, 1030)
    data_table.set_cell(3, 2, 540)

    opts   = { :width => 400, :height => 240, :title => 'Company Performance', :legend => 'bottom' }
    @chart = GoogleVisualr::Interactive::LineChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/map.html
  def map

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('number', 'Lat' )
    data_table.new_column('number', 'Lon' )
    data_table.new_column('string', 'Name')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, 37.4232   )
    data_table.set_cell(0, 1, -122.0853 )
    data_table.set_cell(0, 2, 'Work'      )
    data_table.set_cell(1, 0, 37.4289   )
    data_table.set_cell(1, 1, -122.1697 )
    data_table.set_cell(1, 2, 'University')
    data_table.set_cell(2, 0, 37.6153   )
    data_table.set_cell(2, 1, -122.3900 )
    data_table.set_cell(2, 2, 'Airport'   )
    data_table.set_cell(3, 0, 37.4422   )
    data_table.set_cell(3, 1, -122.1731 )
    data_table.set_cell(3, 2, 'Shopping'  )

    opts   = { :showTip => true }
    @chart = GoogleVisualr::Interactive::Map.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/motionchart.html#Example
  def motion_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Fruit'   )
    data_table.new_column('date'  , 'Date'    )
    data_table.new_column('number', 'Sales'   )
    data_table.new_column('number', 'Expenses')
    data_table.new_column('string', 'Location')
    data_table.add_rows([
      ['Apples' ,Date.parse("1988-01-01"),1000,300,'East'],
      ['Oranges',Date.parse("1988-01-01"),1150,200,'West'],
      ['Bananas',Date.parse("1988-01-01"),300 ,250,'West'],
      ['Apples' ,Date.parse("1989-07-01"),1200,400,'East'],
      ['Oranges',Date.parse("1989-07-01"),750 ,150,'West'],
      ['Bananas',Date.parse("1989-07-01"),788 ,617,'West']
    ])

    opts   = { :width => 600, :height => 300 }
    @chart = GoogleVisualr::Interactive::MotionChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/orgchart.html#Example
  def org_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Name'   )
    data_table.new_column('string', 'Manager')
    data_table.new_column('string', 'ToolTip')
    data_table.add_rows( [
      [ {:v => 'Mike', :f => 'Mike<div style="color:red; font-style:italic">President</div>'   }, ''    , 'The President' ],
      [ {:v => 'Jim' , :f => 'Jim<div style="color:red; font-style:italic">Vice President<div>'}, 'Mike', 'VP'            ],
      [ 'Alice'  , 'Mike', ''           ],
      [ 'Bob'    , 'Jim' , 'Bob Sponge' ],
      [ 'Carol'  , 'Bob' , ''           ]
    ] )

    opts   = { :allowHtml => true }
    @chart = GoogleVisualr::Interactive::OrgChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/piechart.html#Example
  def pie_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Task')
    data_table.new_column('number', 'Hours per Day')
    data_table.add_rows(5)
    data_table.set_cell(0, 0, 'Work'     )
    data_table.set_cell(0, 1, 11 )
    data_table.set_cell(1, 0, 'Eat'      )
    data_table.set_cell(1, 1, 2  )
    data_table.set_cell(2, 0, 'Commute'  )
    data_table.set_cell(2, 1, 2  )
    data_table.set_cell(3, 0, 'Watch TV' )
    data_table.set_cell(3, 1, 2  )
    data_table.set_cell(4, 0, 'Sleep'    )
    data_table.set_cell(4, 1, 7  )

    opts   = { :width => 400, :height => 240, :title => 'My Daily Activities', :is3D => true }
    @chart = GoogleVisualr::Interactive::PieChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/scatterchart.html#Example
  def scatter_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('number', 'Age')
    data_table.new_column('number', 'Weight')
    data_table.add_rows(6)
    data_table.set_cell( 0, 0, 8  )
    data_table.set_cell( 0, 1, 12 )
    data_table.set_cell( 1, 0, 4  )
    data_table.set_cell( 1, 1, 5.5)
    data_table.set_cell( 2, 0, 11 )
    data_table.set_cell( 2, 1, 14 )
    data_table.set_cell( 3, 0, 4  )
    data_table.set_cell( 3, 1, 4.5)
    data_table.set_cell( 4, 0, 3  )
    data_table.set_cell( 4, 1, 3.5)
    data_table.set_cell( 5, 0, 6.5)
    data_table.set_cell( 5, 1, 7  )

    opts   = { :width => 400, :height => 240, :title => 'Age vs. Weight comparison',
               :hAxis => { :title => 'Age'    , :minValue => 0, :maxValue => 15 },
               :vAxis => { :title => 'Weight' , :minValue => 0, :maxValue => 15 },
               :legend => 'none' }
    @chart = GoogleVisualr::Interactive::ScatterChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/steppedareachart.html#Example
  def stepped_area_chart

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string'  , 'Director (Year)')
    data_table.new_column('number'  , 'Rotten Tomatoes')
    data_table.new_column('number' , 'IMDB')
    data_table.add_rows( [
      ['Alfred Hitchcock (1935)', 8.4,         7.9],
      ['Ralph Thomas (1959)',     6.9,         6.5],
      ['Don Sharp (1978)',        6.5,         6.4],
      ['James Hawes (2008)',      4.4,         6.2]
    ])

    opts   = { :width => 800, :height => 500, :title => "The decline of 'The 39 Steps'", :vAxis => { :title => 'Accumulated Rating'}, :isStacked => true }
    @chart = GoogleVisualr::Interactive::SteppedAreaChart.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/table.html#Example
  def table

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string'  , 'Name')
    data_table.new_column('number'  , 'Salary')
    data_table.new_column('boolean' , 'Full Time Employee')
    data_table.add_rows(4)
    data_table.set_cell(0, 0, 'Mike'  )
    data_table.set_cell(0, 1, {:v => 10000, :f => '$10,000'})
    data_table.set_cell(0, 2, true  )
    data_table.set_cell(1, 0, 'Jim'   )
    data_table.set_cell(1, 1, {:v => 8000 , :f => '$8,000' })
    data_table.set_cell(1, 2, false )
    data_table.set_cell(2, 0, 'Alice' )
    data_table.set_cell(2, 1, {:v => 12500, :f => '$12,500'})
    data_table.set_cell(2, 2, true  )
    data_table.set_cell(3, 0, 'Bob'   )
    data_table.set_cell(3, 1, {:v => 7000 , :f => '$7,000' })
    data_table.set_cell(3, 2, true  )

    opts   = { :width => 600, :showRowNumber => true }
    @chart = GoogleVisualr::Interactive::Table.new(data_table, opts)

  end

  # http://code.google.com/apis/chart/interactive/docs/gallery/treemap.html#Example
  def tree_map

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Region')
    data_table.new_column('string', 'Parent')
    data_table.new_column('number', 'Market trade volume (size)')
    data_table.new_column('number', 'Market increase/decrease (color)')
    data_table.add_rows( [
      ["Global"   , nil      , 0 , 0   ],
      ["America"  , "Global"  , 0 , 0   ],
      ["Europe"   , "Global"  , 0 , 0   ],
      ["Asia"     , "Global"  , 0 , 0   ],
      ["Australia", "Global"  , 0 , 0   ],
      ["Africa"   , "Global"  , 0 , 0   ],
      ["Brazil"   , "America" , 11, 10  ],
      ["USA"      , "America" , 52, 31  ],
      ["Mexico"   , "America" , 24, 12  ],
      ["Canada"   , "America" , 16, -23 ],
      ["France"   , "Europe"  , 42, -11 ],
      ["Germany"  , "Europe"  , 31, -2  ],
      ["Sweden"   , "Europe"  , 22, -13 ],
      ["Italy"    , "Europe"  , 17, 4   ],
      ["UK"       , "Europe"  , 21, -5  ],
      ["China"    , "Asia"    , 36, 4   ],
      ["Japan"    , "Asia"    , 20, -12 ],
      ["India"    , "Asia"    , 40, 63  ],
      ["Laos"     , "Asia"    , 4 , 34  ],
      ["Mongolia" , "Asia"    , 1 , -5  ],
      ["Israel"   , "Asia"    , 12, 24  ],
      ["Iran"     , "Asia"    , 18, 13  ],
      ["Pakistan" , "Asia"    , 11, -52 ],
      ["Egypt"    , "Africa"  , 21, 0   ],
      ["S. Africa", "Africa"  , 30, 43  ],
      ["Sudan"    , "Africa"  , 12, 2   ],
      ["Congo"    , "Africa"  , 10, 12  ],
      ["Zair"     , "Africa"  , 8 , 10  ]
    ] )

    opts   = { :width => 600, :height => 600, :minColor => '#f00', :midColor => '#ddd', :maxColor => '#0d0', :headerHeight => 15, :fontColor => 'black', :showScale => true }
    @chart = GoogleVisualr::Interactive::TreeMap.new(data_table, opts)

  end

end
