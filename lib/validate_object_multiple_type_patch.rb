module ValidatedObject
  class Base
    class TypeValidator
      def expected_class?(expected_class, value)
        Array(expected_class).any? { |cls| value.is_a?(cls) }
      end
    end
  end
end
