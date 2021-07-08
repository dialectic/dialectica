# frozen_string_literal: true

require "pathname"
require "yaml"

RSpec.shared_examples :cases do
  Pathname.glob(File.expand_path("../cases/*.yml", __FILE__)).each do |path|
    config = YAML.load(path.read)

    describe "structure case: #{path.basename(".yml")}" do
      before do
        config["atoms"].each do |atom, categories|
          structure.insert(atom, *categories)
        end
      end

      let(:config) { config }

      config["selections"].each do |selection_config|
        describe "selection: #{selection_config["selection"]}" do
          let(:selection) {
            structure.select(*selection_config["selection"])
          }

          it "contains the correct atoms" do
            expect(selection.atoms.to_a).to eq(selection_config["atoms"])
          end

          it "contains the correct sub-categories" do
            expect(selection.subcategories.to_a).to eq(selection_config["subcategories"])
          end
        end
      end
    end
  end
end
