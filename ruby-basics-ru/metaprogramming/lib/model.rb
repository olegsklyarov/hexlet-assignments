# frozen_string_literal: true

# BEGIN
module Model
  attr_reader :attributes

  def self.included(base)
    base.extend ClassMethods
  end

  def initialize(attrs = {})
    @attributes = self.class.properties.to_h do |property|
      value = attrs.fetch property[:name], property[:default]
      casted_value = cast value, property[:type]
      [property[:name], casted_value]
    end
  end

  private

  def cast(value, type)
    return nil if value.nil?

    case type
    when :integer then value.to_i
    when :string then value.to_s
    when :boolean then !!value
    when :datetime then DateTime.parse(value)
    end
  end

  module ClassMethods
    attr_reader :properties

    def attribute(name, options = {})
      @properties ||= []
      @properties.push name: name, type: options[:type], default: options[:default]

      define_method name do
        @attributes[name]
      end

      define_method "#{name}=" do |value|
        @attributes[name] = cast value, options[:type]
      end
    end
  end
end
# END
