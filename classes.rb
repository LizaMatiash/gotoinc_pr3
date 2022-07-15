# frozen_string_literal: true

# sss
class Station
  attr_reader :train

  def initialize(name)
    @name = name
    @train = {}
  end

  def coming(number, type, size)
    train[number] = { type: type, sixe: size }
  end

  def show_all
    "Trains that stands here: #{train.keys.join(', ')}"
  end

  # грузові
  def show_freight
    puts 'Freigh trains that stands here: '
    train.each { |k, _v| puts k if train[k][:type] == 'freight' }
  end

  # пасажирські
  def show_passanger
    puts 'Passanger trains that stands here: '
    train.each { |k, _v| puts k if train[k][:type] == 'passanger' }
  end

  def send(number)
    puts "Bye train #{number}"
    train.delete(number)
  end
end

# dd
class Route
  attr_accessor :route, :full_way
  attr_reader :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
    @route = []
    @full_way = []
    @full_way.push(start, finish)
  end

  def add(station)
    route << station
    full_way.insert(-2, station)
  end

  def delete(station)
    route.delete(station)
    full_way.delete(station)
  end

  def show
    puts "Your route is #{start}, #{route.join(', ')}, #{finish}"
  end
end

# fff
class Train
  attr_reader :number, :type
  attr_accessor :speed, :size, :route, :station

  def initialize(number, type, size)
    @number = number
    @type = type
    @size = size
    @speed = 0
    @route = nil
    @station = nil
  end

  def new_speed(nss)
    self.speed = nss
    puts "New speed is #{speed}"
  end

  def brake
    self.speed = 0
    puts "Braked speed is #{speed}"
  end

  def current_speed
    puts "Current speed is #{speed}"
  end

  def hook
    puts @speed.zero? ? "New size: #{self.size += 1} vagons" : 'Train is moving'
  end

  def unhook
    puts speed.zero? ? "New size: #{self.size -= 1} vagons" : 'Train is moving'
  end

  def current_size
    puts "Current size is #{size}"
  end

  def get_route(route)
    self.route = route
    puts "Your route is #{route.join(', ')}"
  end

  def move_to_next_station
    self.station = route[0] if station.nil?
    self.station = route[route.index(station) + 1] if route.index(station) + 1 < route.size
    puts "Your station is: #{station}"
  end

  def station_route
    self.station = route[0] if station.nil?
    if station == route[0]
      puts "You are on first station #{station}, next #{route[route.index(station) + 1]}"
    elsif station == route[route.size - 1]
      puts "You are on last station #{station}, prev #{route[route.index(station) - 1]}"
    else
      puts "Your station: #{station}, prev #{route[route.index(station) - 1]}, next #{route[route.index(station) + 1]}"
    end
  end
end

# route = Route.new('A', 'B')
# route.add('C')
# route.add('D')
# route.show
# route.delete('D')
# route.show
#
# train = Train.new(123, 'hhh', 11)
# train.new_speed(46)
# train.hook
# train.brake
# train.unhook
# train.get_route(route.full_way)
# train.move_to_next_station
# train.station_route
# #
# station = Station.new('Kyiv')
# station.coming(123, 'freight', 11)
# station.coming(124, 'passanger', 11)
# station.show_freight
# station.send(123)
# station.show_freight
