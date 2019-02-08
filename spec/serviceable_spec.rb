class TestService
  include Serviceable
end

RSpec.describe Serviceable do
  it "has a version number" do
    expect(Serviceable::VERSION).not_to be nil
  end

  let(:serivce_class) { TestService }

  it "should add #call to object." do
    expect(serivce_class).to respond_to(:call)
  end

  it "should add #cicuit." do
    expect(serivce_class).to respond_to(:circuit)
  end

  context "override default config" do
    TestService.class_eval do
      @@run_count = 0

      def self.run_count
        @@run_count
      end

      def self.service_name
        "new_service"
      end

      def self.circuit_options
        { volume_threshold: 5, exceptions: [Timeout::Error] }
      end

      def call
        @@run_count += 1
        raise Timeout::Error
      end
    end

    let(:new_service_class) { TestService }

    it "should change service_name" do
      expect(new_service_class.circuit.service).to eq("new_service")
    end

    it "should change circuit option" do
      expect(new_service_class.circuit.circuit_options).to include(volume_threshold: 5)
    end

    it "when call raise error circuit should raise error also." do
      result = new_service_class.call
      expect(result).to be(nil)
    end

    it "should close circuit when keep fail" do
      # service will increase run_count upon service call
      # if circuit open due to the failure, circuit will skip call method,
      # So service class run_count should be less than 6
      # because we are going to fail 100%
      # and our volume threshold is 5.
      # puts new_service_class.circuit.circuit_store.inspect
      60.times do
        new_service_class.call
      rescue => e
        # puts new_service_class.circuit.failure_count
      end

      expect(new_service_class.run_count).to be < 7
    end

  end

end
