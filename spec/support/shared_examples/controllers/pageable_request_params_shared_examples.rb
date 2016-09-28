# controllers with:
#   include Concerns::IndexWithDefaultPaging
# ...should include these shared examples
RSpec.shared_examples_for "controller with pageable request params" do

  context "with request params" do
    context "with :page" do
      context "when it is set" do
        let(:page){ Faker::Number.between(1, 3) }
        let(:params){ {page: page} }

        it "does not set a default value" do
          get :index, params: params

          expect(subject.params[:page].to_i).to eq page
        end
      end

      context "when it is not set" do
        let(:params){ nil }

        it "sets a default value" do
          get :index, params: params

          expect(subject.params[:page].to_i).to eq 0
        end
      end
    end

    context "with :per_page" do
      context "when it is set" do
        let(:per_page){ Faker::Number.between(1, 3) }
        let(:params){ {per_page: per_page} }

        it "does not set a default value" do
          get :index, params: params

          expect(subject.params[:per_page].to_i).to eq per_page
        end
      end

      context "when it is not set" do
        let(:params){ nil }

        it "sets a default value" do
          get :index, params: params

          expect(subject.params[:per_page].to_i).to eq Kaminari.config.default_per_page
        end
      end
    end
  end
end
