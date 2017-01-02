shared_examples 'ProgneTapera::EnumConfig' do |code_count, enum_list|

  describe '.enum_name' do
    it 'exists' do expect(described_class).to respond_to(:enum_name) end
  end

  describe '.item_defined?' do
    it 'exists' do expect(described_class).to respond_to(:item_defined?) end
  end

  describe '.add_item' do
    it 'exists' do expect(described_class).to respond_to(:add_item) end
  end

  describe '.safe_add_item' do
    it 'exists' do expect(described_class).to respond_to(:safe_add_item) end
  end

  describe '.enum_constants' do
    it 'exists' do expect(described_class).to respond_to(:enum_constants) end
  end

  describe '.all' do
    it 'exists'                      do expect(described_class).to            respond_to(:all) end
    it 'returns all values'          do expect(described_class.all).to        be_present       end
    it "returns #{code_count} items" do expect(described_class.all.length).to eq(code_count)   end
  end

  describe '.selected' do
    it 'exists' do expect(described_class).to respond_to(:selected) end
  end

  describe '.each' do
    it 'exists' do expect(described_class).to respond_to(:each) end
  end

  describe '.form_options' do
    it 'exists' do expect(described_class).to respond_to(:form_options) end
  end

  describe '.enum' do
    it 'exists' do expect(described_class).to respond_to(:enum) end
  end

  describe '.overload_enum_i18n' do
    it 'exists' do expect(described_class).to respond_to(:overload_enum_i18n) end
  end

  enum_list.each do |enum_item|

    const_name = enum_item[:name].upcase

    describe "::#{const_name}" do
      before :each do @enum_item = described_class.const_get const_name end
      it 'exists'  do expect(@enum_item).to be_present end
      enum_item.each do |key, value|
        it "#{key.to_s.gsub('_', ' ')} is #{value}" do expect(@enum_item.send key.to_sym).to eq(value) end
      end
    end

    describe '.lookup' do
      it "should be able to find the #{enum_item[:name]} enum item per #{enum_item[:code]}" do
        found_enum_item = described_class.lookup enum_item[:code]
        expect(found_enum_item).to                be_present
        expect(found_enum_item.code).to           eq(enum_item[:code])
        expect(found_enum_item.name).to           eq(enum_item[:name])
        expect(found_enum_item.localized_name).to eq(enum_item[:localized_name])
      end
    end

  end

  #enum_list.each do |enum_item|
  #  it ".lookup('#{enum_item[:code]}')" do expect(described_class.lookup enum_item[:code]).to eq(described_class.const_get enum_item[:name].upcase) end
  #end

  #view_collection_mappings = {} if view_collection_mappings.nil?
  #view_collection_mappings[:view_collection] = code_count
  #view_collection_mappings.each do |view_collection, expected_count|
  #  describe ".#{view_collection}" do
  #    it 'exists'                          do expect(described_class).to                              respond_to(view_collection) end
  #    it "returns #{expected_count} items" do expect(described_class.send(view_collection).length).to eq(expected_count)          end
  #  end
  #end

end
