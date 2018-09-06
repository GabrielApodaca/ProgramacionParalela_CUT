class SingletonExample

  class << self
      def mutex
          @mutex ||= Mutex.new
      end

      def print(msg)
          @mutex.synchronize do
            puts msg
          end
      end
  end
end
